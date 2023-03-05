#!/bin/bash

. ./TemplateManagerTools.sh
. ./TemplateManagerLocalization.sh

bindir="~/.local/bin"
servicedir="~/.local/share/kservices5/ServiceMenus"

rmdir "$template_src_folder"

rm "$bindir/TemplateCreator.sh"
rm "$bindir/TemplateEditor.sh"
rm "$bindir/TemplateEraser.sh"
rm "$bindir/TemplateManagerLocalization.sh"
rm "$bindir/TemplateManagerTools.sh"

rm "$servicedir/TemplateManager_File.desktop"
rm "$servicedir/TemplateManager_Dir.desktop"

if kdialog --warningyesno "$(str_uninstall_confirmation_msg)" --title "$(str_window_title)" --icon "$creator_icon"; then
    rm -r "${template_folder:?}/"*
fi

kdialog --msgbox "$(str_uninstalled)" --title "$(str_window_title)" --icon "$creator_icon"
