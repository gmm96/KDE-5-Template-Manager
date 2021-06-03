#!/bin/bash

. "$HOME/.bin/TemplateManagerLocalization.sh"
. "$HOME/.bin/TemplateManagerTools.sh"

function cancel_operation()
{
    kdialog --error "$(str_cancel_operation)" --title "$window_title"
    exit 1
}

function cannot_template()
{
    kdialog --error "$(str_cannot_template)" --title "$window_title"
    exit 1
}

# region Main

if [ "$#" -ne 1 ]; then
    echo "Error: Illegal number of parameters."
    echo "Use: sh $0 <file/directory>"
    exit 1
fi

shortname="$(get_filename_wo_extension "$1")"

if ! template_name=$(kdialog --inputbox "$(str_get_name)" "$shortname" --title "$window_title"); then
    cancel_operation
elif [[ -z "${template_name// /}" ]]; then
    template_name=$shortname
fi

if ! template_comment=$(kdialog --inputbox "$(str_get_comment)" --title "$window_title"); then
    cancel_operation
fi

if ! template_icon=$(kdialog --geticon MimeType --title "$window_title"); then
    cancel_operation
fi

if [ -d "$1" ]; then
    template_url="$template_src_folder/$template_name"
    cp -r "$1" "$template_url"
elif [ -f "$1" ]; then
    template_url="$template_src_folder/$template_name.$(get_file_extension "$1")"
    cp "$1" "$template_url"
else
    cannot_template
fi

echo "[Desktop Entry]
Name=$template_name
Comment=$template_comment
Type=Link
URL=$template_url
Icon=$template_icon" > "$template_folder/$template_name.$desktop_ext"

kdialog --msgbox "$(str_created_template)'$template_name'." --title "$window_title":

# endregion