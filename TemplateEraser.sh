#!/bin/bash

# shellcheck source=./TemplateManagerLocalization.sh
. "$HOME/.bin/TemplateManagerLocalization.sh"
# shellcheck source=./TemplateManagerTools.sh
. "$HOME/.bin/TemplateManagerTools.sh"

function cancel_operation()
{
    kdialog --error "$(str_cancel_operation)" --title "$(str_window_title)" --icon "$eraser_icon"
    exit 1
}

function no_available_templates()
{
    kdialog --error "$(str_no_available_templates)" --title "$(str_window_title)" --icon "$eraser_icon"
    exit 1
}

function remove_template()
{
    rm -r "${template_src_folder:?}/${1:?}" "$(get_template_desktop_path "$1")"
}

# region Main


if [ "$(ls -1q "$template_src_folder" | wc -l)" -eq 0 ]; then
    no_available_templates
fi

declare -a kdialog_args
kdialog_args+=("$(str_select_templates)")

for file in "$template_src_folder"/* ; do
    if [ -e "$file" ] && [ -e "$(get_template_desktop_path "$file")" ]; then
        filename="$(get_filename "$file")"
        kdialog_args+=("$filename")
        if [ -d "$file" ]; then
            kdialog_args+=("🗂   $filename")
        elif [ -f "$file" ]; then
            kdialog_args+=("🗐   $filename")
        else
            kdialog_args+=("❓   $filename")
        fi
        kdialog_args+=("off")
    fi
done

if ! templates_to_remove=$(kdialog --separate-output --checklist "${kdialog_args[@]}" --title "$(str_window_title)" --icon "$eraser_icon"); then
    cancel_operation
fi

file_list=""
while IFS= read -r file; do
    file_list="$file_list<br>- $file"
done <<< "$templates_to_remove"

if ! kdialog --warningyesno "$(str_remove_confirmation)$file_list" --title "$(str_window_title)" --icon "$eraser_icon"; then
    cancel_operation
fi

while IFS= read -r file; do
    remove_template "$file"
done <<< "$templates_to_remove"

kdialog --msgbox "$(str_removed_templates)$file_list" --title "$(str_window_title)" --icon "$eraser_icon"

# endregion