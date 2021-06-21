#!/bin/bash

# shellcheck source=./TemplateManagerLocalization.sh
. "$HOME/.bin/TemplateManagerLocalization.sh"
# shellcheck source=./TemplateManagerTools.sh
. "$HOME/.bin/TemplateManagerTools.sh"

function cancel_operation()
{
    kdialog --error "$(str_cancel_operation)" --title "$(str_window_title)" --icon "$creator_icon"
    exit 1
}

function cannot_template()
{
    kdialog --error "$(str_cannot_template)" --title "$(str_window_title)" --icon "$creator_icon"
    exit 1
}

function exists_template_with_same_name()
{
    kdialog --error "$(str_exists_template_with_same_name)" --title "$(str_window_title)" --icon "$editor_icon"
}


# region Main

if [ "$#" -ne 1 ]; then
    echo "Error: Illegal number of parameters."
    echo "Use: sh $0 <file/directory>"
    exit 1
elif [ ! -d "$1" ] && [ ! -f "$1" ]; then
    cannot_template
fi

shortname="$(get_filename_wo_extension "$1")"

if ! template_name=$(kdialog --inputbox "$(str_get_name)" "$shortname" --title "$(str_window_title)" --icon "$creator_icon" --geometry 450x300); then
    cancel_operation
elif [ -z "${template_name// /}" ]; then
    template_name=$shortname
elif does_template_exist_with_same_name "${CONFIG["URL"]}" "$template_name"; then
    exists_template_with_same_name
fi

if ! template_comment=$(kdialog --inputbox "$(str_get_comment)" --title "$(str_window_title)" --icon "$creator_icon"); then
    cancel_operation
fi

if ! template_icon=$(kdialog --geticon MimeType --title "$(str_window_title)" --icon "$creator_icon"); then
    cancel_operation
fi

template_url="$template_src_folder/$template_name$(get_file_extension "$1")"
cp -r "$1" "$template_url"

echo "[Desktop Entry]
Name=$template_name
Comment=$template_comment
Type=Link
URL=$template_url
Icon=$template_icon" > "$template_folder/$template_name$desktop_ext"

kdialog --msgbox "$(str_created_template)'$template_name'." --title "$(str_window_title)" --icon "$creator_icon"

# endregion