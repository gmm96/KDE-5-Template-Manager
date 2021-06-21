#!/bin/bash

creator_icon="xapp-favorite-symbolic"
editor_icon="edit"
eraser_icon="delete"

template_folder="$HOME/Templates"
template_src_folder="$HOME/Templates/source"

desktop_ext=".desktop"

function get_filename()
{
    basename -- "$1"
}

function get_filename_wo_extension()
{
    filename="$(get_filename "$1")"
    if [ -d "$1" ]; then
        echo "$filename"
    else
        echo "${filename%.*}"
    fi
}

function get_file_extension()
{
    local filename filename_wo_extension
    filename="$(get_filename "$1")"
    filename_wo_extension="$(get_filename_wo_extension "$1")"
    echo "${filename#$filename_wo_extension}"
}

function get_template_desktop_path()
{
    echo "$template_folder/$(get_filename_wo_extension "$1")$desktop_ext"
}