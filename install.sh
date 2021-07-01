#!/bin/bash

. ./TemplateManagerTools.sh
. ./TemplateManagerLocalization.sh

mkdir -p "$bin_dir"
mkdir -p "$template_src_folder"

/bin/cp "./TemplateCreator.sh" "$bin_dir"
/bin/cp "./TemplateEditor.sh" "$bin_dir"
/bin/cp "./TemplateEraser.sh" "$bin_dir"
/bin/cp "./TemplateManagerLocalization.sh" "$bin_dir"
/bin/cp "./TemplateManagerTools.sh" "$bin_dir"
chmod +x "$bin_dir/TemplateCreator.sh"
chmod +x "$bin_dir/TemplateEditor.sh"
chmod +x "$bin_dir/TemplateEraser.sh"

/bin/cp "./TemplateManager_File.desktop" "$service_folder"
/bin/cp "./TemplateManager_Dir.desktop" "$service_folder"

kdialog --msgbox "$(str_installed)" --title "$(str_window_title)" --icon "$creator_icon"
