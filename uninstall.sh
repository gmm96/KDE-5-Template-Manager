#!/bin/bash

. ./TemplateManagerTools.sh
. ./TemplateManagerLocalization.sh

bin_dir="~/.local/bin"
servicedir="~/.local/share/kservices5/ServiceMenus"

rmdir "$template_src_folder"

rm "$bin_dir/TemplateCreator.sh"
rm "$bin_dir/TemplateEditor.sh"
rm "$bin_dir/TemplateEraser.sh"
rm "$bin_dir/TemplateManagerLocalization.sh"
rm "$bin_dir/TemplateManagerTools.sh"

rm "$servicedir/TemplateManager_File.desktop"
rm "$servicedir/TemplateManager_Dir.desktop"

if kdialog --warningyesno "$(str_uninstall_confirmation_msg)" --title "$(str_window_title)" --icon "$creator_icon"; then
    rm -r "${template_folder:?}/"*
fi

kdialog --msgbox "$(str_uninstalled)" --title "$(str_window_title)" --icon "$creator_icon"
