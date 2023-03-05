#!/bin/bash

. ./TemplateManagerTools.sh
. ./TemplateManagerLocalization.sh

mkdir -p ~/.local/bin
mkdir -p "$template_src_folder"


/bin/cp "./TemplateCreator.sh" ~/.local/bin
/bin/cp "./TemplateEditor.sh" ~/.local/bin
/bin/cp "./TemplateEraser.sh" ~/.local/bin
/bin/cp "./TemplateManagerLocalization.sh" ~/.local/bin
/bin/cp "./TemplateManagerTools.sh" ~/.local/bin
chmod +x "~/.local/bin/TemplateCreator.sh"
chmod +x "~/.local/bin/TemplateEditor.sh"
chmod +x "~/.local/bin/TemplateEraser.sh"

/bin/cp "./TemplateManager_File.desktop" ~/.local/share/kservices5/ServiceMenus/
/bin/cp "./TemplateManager_Dir.desktop" ~/.local/share/kservices5/ServiceMenus/

kdialog --msgbox "$(str_installed)" --title "$(str_window_title)" --icon "$creator_icon"
