#!/bin/bash

mkdir -p ~/.bin
mkdir -p ~/Templates/source
cp ./TemplateCreator.sh ~/.bin/
cp ./TemplateEraser.sh ~/.bin/
chmod +x ~/.bin/TemplateCreator.sh
chmod +x ~/.bin/TemplateEraser.sh

cp ./TemplateManager.desktop ~/.local/share/kservices5/ServiceMenus/

lang_arr=("${LANGUAGE//:/}")
case "${lang_arr[0]:0:2}" in
    "es")
        success="Plugin Administrador de Plantillas para KDE 5 instalado existosamente."
        ;;
    "fr")
        success="Le plugin KDE 5 Template Manager a été installé avec succès."
        ;;
    "it")
        success="Il plugin KDE 5 Template Manager installato con successo."
        ;;
    "de")
        success="KDE 5 Template Manager Plugin erfolgreich installiert."
        ;;
    "pt")
        success="O plugin do gerenciador de modelos do KDE 5 foi instalado com sucesso."
        ;;
    "ru")
        success="Плагин KDE 5 Template Manager успешно установлен."
        ;;
    *)
        success="KDE 5 Template Manager Plugin successfully installed."
        ;;
esac

kdialog --title "Template manager" --msgbox "$success"
