#!/bin/bash

# shellcheck source=./TemplateManagerLocalization.sh
. "$bin_dir/TemplateManagerLocalization.sh"
# shellcheck source=./TemplateManagerTools.sh
. "$bin_dir/TemplateManagerTools.sh"

function cancel_operation()
{
    kdialog --error "$(str_cancel_operation)" --title "$(str_window_title)" --icon "$editor_icon"
    exit 1
}

function no_available_templates()
{
    kdialog --error "$(str_no_available_templates)" --title "$(str_window_title)" --icon "$editor_icon"
    exit 1
}

function name_should_be_filled()
{
    kdialog --error "$(str_name_should_not_be_empty)" --title "$(str_window_title)" --icon "$editor_icon"
}

function exists_template_with_same_name()
{
    kdialog --error "$(str_exists_template_with_same_name)" --title "$(str_window_title)" --icon "$editor_icon"
}

function value_by_default_for_new_template_type_radiolist() # (pathToFileOrDir: str, templateType: str)
{
    if [ -f "$1" ] && [ "$2" == "File" ]; then
        printf "on"
    elif [ -d "$1" ] && [ "$2" == "Dir" ]; then
        printf "on"
    else
        printf "off"
    fi
}

function does_template_exist_with_same_name() { # (currentTemplatePath: str, newTemplateName: str)
    local exists shortname
    exists=1
    for file in "$template_src_folder"/*; do
        shortname="$(get_filename_wo_extension "$file")"
        if [ "$2" == "$shortname" ] && [ "$(get_filename_wo_extension "$1")" != "$2" ]; then
            exists=0
        fi
    done
    return $exists
}


# region Main

if [ "$(find "$template_src_folder" -maxdepth 1 -mindepth 1 -printf '%P\n' | wc -l)" -eq 0 ]; then
    no_available_templates
fi

kdialog_select_template=()
kdialog_select_template+=("$(str_select_template_to_edit)")

for file in "$template_src_folder"/*; do
    if [ -e "$file" ] && [ -e "$(get_template_desktop_path "$file")" ]; then
        filename="$(get_filename "$file")"
        kdialog_select_template+=("$filename")
        if [ -d "$file" ]; then
            kdialog_select_template+=("🗂   $filename")
        elif [ -f "$file" ]; then
            kdialog_select_template+=("🗐   $filename")
        else
            kdialog_select_template+=("❓   $filename")
        fi
        kdialog_select_template+=("off")
    fi
done

if ! template_to_edit=$(kdialog --radiolist "${kdialog_select_template[@]}" --title "$(str_window_title)" --icon "$editor_icon" --geometry 500x500); then
    cancel_operation
fi

declare -A CONFIG
while IFS="=" read -r key value; do
    CONFIG[$key]=$value
done <<< "$(tail -n +2 "$(get_template_desktop_path "$template_to_edit")")"

while
    kdialog_select_property=()
    kdialog_select_property+=("$(str_select_property_to_edit)")

    for key in "${!CONFIG[@]}"; do
        case "$key" in
            "Name")
                kdialog_select_property+=("$key" "__________ $(str_edit_name) __________
${CONFIG[$key]}" "off")
                ;;
            "Comment")
                kdialog_select_property+=("$key" "__________ $(str_edit_comment) __________
${CONFIG[$key]}" "off")
                ;;
            "Icon")
                kdialog_select_property+=("$key" "__________ $(str_edit_icon) __________
${CONFIG[$key]}" "off")
                ;;
        esac
    done

    kdialog_select_property+=("Open" "__________ $(str_open_current_template) __________
${CONFIG["URL"]}" "off")
    kdialog_select_property+=("Update" "__________ $(str_update_template) __________
$new_template_original_path" "off")
    if [ -n "$new_template_original_path" ]; then
        kdialog_select_property+=("Discard_Update" "__________ $(str_discard_new_template) __________
$new_template_original_path" "off")
        kdialog_select_property+=("Open_Update" "__________ $(str_open_new_template) __________
$new_template_original_path" "off")
    fi
    kdialog_select_property+=("Save" "__________ $(str_save_and_exit) __________
" "off")

    [ -n "$new_template_original_path" ] && geometry="500x600" || geometry="500x500"
    if ! property_to_edit=$(kdialog --radiolist "${kdialog_select_property[@]}" --title "$(str_window_title)" --icon "$editor_icon" --geometry "$geometry"); then
        cancel_operation
    fi

    case "$property_to_edit" in
        "Name")
            if template_name=$(kdialog --inputbox "$(str_get_name)" "${CONFIG[$property_to_edit]}" --title "$(str_window_title)" --icon "$editor_icon" --geometry 450x300); then
                if [ -z "${template_name// /}" ]; then
                    template_name="${CONFIG[$property_to_edit]}"
                    name_should_be_filled
                elif does_template_exist_with_same_name "${CONFIG["URL"]}" "$template_name"; then
                    exists_template_with_same_name
                else
                    CONFIG[$property_to_edit]=$template_name
                fi
            fi
            ;;
        "Comment")
            if template_comment=$(kdialog --inputbox "$(str_get_comment)" "${CONFIG[$property_to_edit]}" --title "$(str_window_title)" --icon "$editor_icon"); then
                CONFIG[$property_to_edit]=$template_comment
            fi
            ;;
        "Icon")
            if template_icon=$(kdialog --geticon MimeType --title "$(str_window_title)" --icon "$editor_icon"); then
                CONFIG[$property_to_edit]=$template_icon
            fi
            ;;
        "Open")
            [ -e "${CONFIG["URL"]}" ] && xdg-open "${CONFIG["URL"]}"
            ;;
        "Update")
            kdialog_select_type=()
            kdialog_select_type+=("$(str_select_new_template_type)")
            kdialog_select_type+=("File" "$(str_file)" "$(value_by_default_for_new_template_type_radiolist "${CONFIG["URL"]}" "File")")
            kdialog_select_type+=("Dir" "$(str_directory)" "$(value_by_default_for_new_template_type_radiolist "${CONFIG["URL"]}" "Dir")")
            if new_template_type=$(kdialog --radiolist "${kdialog_select_type[@]}" --title "$(str_window_title)" --icon "$editor_icon"); then
                case $new_template_type in
                    "File")
                        new_template_original_path="$(kdialog --getopenfilename "$HOME" --title "$(str_window_title)" --icon "$editor_icon")"
                        ;;
                    "Dir")
                        new_template_original_path="$(kdialog --getexistingdirectory "$HOME" --title "$(str_window_title)" --icon "$editor_icon")"
                        ;;
                esac
                if [ -n "$new_template_original_path" ]; then
                    if kdialog --warningyesno "$(str_backup_confirmation)" --title "$(str_window_title)" --icon "$editor_icon"; then
                        if backup_path=$(kdialog --getsavefilename "$HOME/$(get_filename "${CONFIG["URL"]}")"); then
                            /bin/cp -r "${CONFIG["URL"]}" "$backup_path"
                        fi
                    fi
                fi
            fi
            ;;
        "Open_Update")
            [ -n "$new_template_original_path" ] && [ -e "$new_template_original_path" ] && xdg-open "$new_template_original_path"
            ;;
        "Discard_Update")
            [ -n "$new_template_original_path" ] && new_template_original_path=""
            ;;
    esac
    [ "$property_to_edit" != "Save" ]
do true; done

if [ "$(get_filename_wo_extension "${CONFIG["URL"]}")" != "${CONFIG["Name"]}" ] && [ -n "$new_template_original_path" ]; then
    rm "$(get_template_desktop_path "${CONFIG["URL"]}")"
    rm -r "${CONFIG["URL"]}"
    new_path="$template_src_folder/${CONFIG["Name"]}$(get_file_extension "$new_template_original_path")"
    /bin/cp -r "$new_template_original_path" "$new_path"
    CONFIG["URL"]="$new_path"
elif [ "$(get_filename_wo_extension "${CONFIG["URL"]}")" != "${CONFIG["Name"]}" ]; then
    rm "$(get_template_desktop_path "${CONFIG["URL"]}")"
    new_path="$template_src_folder/${CONFIG["Name"]}$(get_file_extension "${CONFIG["URL"]}")"
    mv "${CONFIG["URL"]}" "$new_path"
    CONFIG["URL"]="$new_path"
elif [ -e "$new_template_original_path" ]; then
    rm -r "${CONFIG["URL"]}"
    new_path="$template_src_folder/${CONFIG["Name"]}$(get_file_extension "$new_template_original_path")"
    /bin/cp -r "$new_template_original_path" "$new_path"
    CONFIG["URL"]="$new_path"
fi

printf "[Desktop Entry]" > "$template_folder/${CONFIG["Name"]}$desktop_ext"
for key in "${!CONFIG[@]}"; do
    printf "\n%s=%s" "$key" "${CONFIG[$key]}" >> "$template_folder/${CONFIG["Name"]}$desktop_ext"
done

kdialog --msgbox "$(str_edited_template)" --title "$(str_window_title)" --icon "$editor_icon"

# endregion
