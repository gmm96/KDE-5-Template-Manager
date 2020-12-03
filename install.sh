#!/bin/bash

mkdir -p ~/.bin
cp ./TemplateMaker.sh ~/.bin/
chmod +x ~/.bin/TemplateMaker.sh

cp ./TemplateMaker.desktop ~/.local/share/kservices5/ServiceMenus/
kdialog --title "KDE 5 Template Maker Plugin successfully installed" --passivepopup ""