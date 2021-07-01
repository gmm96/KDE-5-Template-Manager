#!/bin/bash

# region Shared constants

creator_icon="favorite"
editor_icon="edit"
eraser_icon="delete"
desktop_ext=".desktop"
bin_dir="$HOME/.bin/"

if [ "$(xdg-user-dir TEMPLATES)" != "$HOME" ]; then
    template_folder="$(xdg-user-dir TEMPLATES)"
else
    IFS=':' read -ra template_installation_paths <<< "$(kf5-config --path templates)"
    counter=0
    unset template_folder
    while [ $counter -lt ${#template_installation_paths[@]} ] && [ -z "$template_folder" ]; do
        path="$(realpath "${template_installation_paths[$counter]}")"
        if [ "${path##$HOME}" != "${path}" ]; then
            template_folder="$path"
            template_src_folder="$template_folder/source"
        fi
        ((counter++))
    done
fi

IFS=':' read -ra service_installation_paths <<< "$(kf5-config --path services)"
counter=0
unset service_folder
while [ $counter -lt ${#service_installation_paths[@]} ] && [ -z "$service_folder" ]; do
    path="$(realpath "${service_installation_paths[$counter]}")"
    if [ "${path##$HOME}" != "${path}" ]; then
        if [ -e "$path/ServiceMenus" ]; then
            service_folder="$path/ServiceMenus"
        else
            service_folder="$path"
        fi
    fi
    ((counter++))
done

# endregion

# region Shared functions

function get_filename() # (filePath: str)
{
    basename -- "$1"
}

function get_filename_wo_extension() # (filePath: str)
{
    local filename
    filename="$(get_filename "$1")"
    if [ ! -d "$1" ]; then
        filename="${filename%.*}"
    fi
    printf "%s" "$filename"
}

function get_file_extension() # (filePath: str)
{
    local filename filename_wo_extension ext
    filename="$(get_filename "$1")"
    filename_wo_extension="$(get_filename_wo_extension "$1")"
    ext="${filename#$filename_wo_extension}"
    printf "%s" "$ext"
}

function get_template_desktop_path() # (templatePath: str)
{
    local path
    path="$template_folder/$(get_filename_wo_extension "$1")$desktop_ext"
    printf "%s" "$path"
}

# endregion
