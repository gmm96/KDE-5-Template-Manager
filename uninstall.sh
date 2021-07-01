#!/bin/bash

. ./TemplateManagerTools.sh
. ./TemplateManagerLocalization.sh

rmdir "$template_src_folder"

rm "$bin_dir/TemplateCreator.sh"
rm "$bin_dir/TemplateEditor.sh"
rm "$bin_dir/TemplateEraser.sh"
rm "$bin_dir/TemplateManagerLocalization.sh"
rm "$bin_dir/TemplateManagerTools.sh"
rmdir "$bin_dir"

rm "$service_folder/TemplateManager.desktop"

if kdialog --warningyesno "$(str_uninstall_confirmation_msg)" --title "$(str_window_title)" --icon "$creator_icon"; then
    rm -r "${template_folder:?}/"*
fi

kdialog --msgbox "$(str_uninstalled)" --title "$(str_window_title)" --icon "$creator_icon"
