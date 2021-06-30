#!/bin/bash

creator_icon="xapp-favorite-symbolic"
editor_icon="edit"
eraser_icon="delete"

if [ "$(xdg-user-dir TEMPLATES)" != "$HOME" ]; then
    template_folder="$(xdg-user-dir TEMPLATES)"
else
    IFS=':' read -ra template_possible_folders <<< "$(kf5-config --path templates)"
    counter=0
    unset template_folder
    while [ $counter -lt ${#template_possible_folders[@]} ] && [ -z "$template_folder" ]; do
        path="$(realpath "${template_possible_folders[$counter]}")"
        if [ "${path##$HOME}" != "${path}" ]; then
            template_folder="$path"
        fi
        ((counter++))
    done
fi

template_src_folder="$template_folder/source"

desktop_ext=".desktop"

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
