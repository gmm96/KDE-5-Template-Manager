#!/bin/bash

if [ "$#" -ne 1 ]; then
    echo "Error: Illegal number of parameters."
    echo "Use: sh $0 <file>"
    exit 1;
fi

filename=$(basename -- "$1");
extension="${filename##*.}";
shortname="${filename%%.*}";

function cancel_operation {
	kdialog --error "Operation cancelled by user.";
	exit 1;
}

templatename=$(kdialog --inputbox "Please, enter template name.<br> If empty, it'll take the original filename." $shortname --title "Template maker");
if [ $? -eq 1 ]
then
	cancel_operation;
elif [[ -z "${templatename// }" ]]
then 
	templatename=$shortname;
fi

templatecomment=$(kdialog --inputbox "Please, enter template comment." --title "Template maker");
if [ $? -eq 1 ]
then
	cancel_operation;
fi

templateicon=$(kdialog --geticon MimeType --title "Template maker");
if [ $? -eq 1 ]
then
	cancel_operation;
fi

cp $1 "$HOME/Templates/source/$templatename.$extension";
echo "[Desktop Entry]
Name=$templatename
Comment=$templatecomment
Type=Link
URL=source/$templatename.$extension
Icon=$templateicon" > "$HOME/Templates/$templatename.desktop";

kdialog --msgbox "Template created successfully as '$templatename'":