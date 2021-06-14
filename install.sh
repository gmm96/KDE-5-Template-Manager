#!/bin/bash

bin_dir="$HOME/.bin/"

mkdir -p "$bin_dir"
mkdir -p "$HOME/Templates/source"
cp ./TemplateCreator.sh "$bin_dir"
cp ./TemplateEraser.sh "$bin_dir"
cp ./TemplateManagerLocalization.sh "$bin_dir"
cp ./TemplateManagerTools.sh "$bin_dir"
chmod +x "$bin_dir/TemplateCreator.sh"
chmod +x "$bin_dir/TemplateEraser.sh"

cp ./TemplateManager.desktop "$HOME/.local/share/kservices5/ServiceMenus/"

lang_arr=("${LANGUAGE//:/}")
case "${lang_arr[0]:0:2}" in
    "es")
        success="Plugin Administrador de Plantillas para KDE 5 instalado existosamente.";;
    "fr")
        success="Le plugin KDE 5 Template Manager a été installé avec succès.";;
    "it")
        success="Il plugin KDE 5 Template Manager installato con successo.";;
    "de")
        success="KDE 5 Template Manager Plugin erfolgreich installiert.";;
    "pt")
        success="O plugin do gerenciador de modelos do KDE 5 foi instalado com sucesso.";;
    "ru")
        success="Плагин KDE 5 Template Manager успешно установлен.";;
    "nl")
        success="De KDE 5-sjabloonbeheerplug-in is geïnstalleerd.";;
    "cs")
        success="Plugin Správce šablon KDE 5 byl úspěšně nainstalován.";;
    "pl")
        success="Wtyczka menedżera szablonów KDE 5 pomyślnie zainstalowana.";;
    "ro")
        success="KDE 5 Template Manager Plugin a fost instalat cu succes.";;
    "et")
        success="KDE 5 mallihalduri pistikprogrammi installimine õnnestus.";;
    "fi")
        success="KDE 5 Template Manager -laajennuksen asennus onnistui.";;
    "sv")
        success="KDE 5 Template Manager Plugin har installerats.";;
    "nb" | "nn" | "no")
        success="KDE 5 Template Manager Plugin er installert.";;
    "tr")
        success="KDE 5 Template Manager Eklentisi başarıyla kuruldu.";;
    "uk")
        success="Плагін KDE 5 Template Manager успішно встановлено.";;
    "is")
        success="Tappi KDE 5 sniðmátastjóra var sett upp.";;
    "el")
        success="Η προσθήκη KDE 5 Template Manager εγκαταστάθηκε με επιτυχία.";;
    "hu")
        success="A KDE 5 Template Manager beépülő modul sikeresen telepítve.";;
    "da")
        success="KDE 5 Template Manager Plugin er installeret.";;
    *)
        success="KDE 5 Template Manager Plugin successfully installed.";;
esac

kdialog --msgbox "$success" --title "Template manager" --icon "favorite"