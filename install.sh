#!/bin/bash

. ./TemplateManagerTools.sh
. ./TemplateManagerLocalization.sh

mkdir -p ~/.local/bin
mkdir -p "$template_src_folder"

bindir="~/.local/bin"
servicedir="~/.local/share/kservices5/ServiceMenus"


/bin/cp "./TemplateCreator.sh" $bindir
/bin/cp "./TemplateEditor.sh" $bindir
/bin/cp "./TemplateEraser.sh" $bindir
/bin/cp "./TemplateManagerLocalization.sh" $bindir
/bin/cp "./TemplateManagerTools.sh" $bindir
chmod +x "$bindir/TemplateCreator.sh"
chmod +x "$bindirTemplateEditor.sh"
chmod +x "$bindir/TemplateEraser.sh"

/bin/cp "./TemplateManager_File.desktop" $servicedir
/bin/cp "./TemplateManager_Dir.desktop" $servicedir

kdialog --msgbox "$(str_installed)" --title "$(str_window_title)" --icon "$creator_icon"
