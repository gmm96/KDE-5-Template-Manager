#!/bin/bash

rm ~/.bin/TemplateCreator.sh
rm ~/.bin/TemplateEraser.sh
rm ~/.bin/TemplateManagerLocalization.sh
rm ~/.bin/TemplateManagerTools.sh

rm ~/.local/share/kservices5/ServiceMenus/TemplateManager.desktop

lang_arr=("${LANGUAGE//:/}")
case "${lang_arr[0]:0:2}" in
    "es")
        confirmation_msg="¿Desea eliminar también las plantillas existentes? Esta acción no se podrá deshacer.";;
    "fr")
        confirmation_msg="Voulez-vous également supprimer les modèles existants? Cette action ne peut pas être annulée.";;
    "it")
        confirmation_msg="Vuoi anche rimuovere i modelli esistenti? Questa azione non può essere annullata.";;
    "de")
        confirmation_msg="Möchten Sie auch die vorhandenen Vorlagen entfernen? Diese Aktion kann nicht rückgängig gemacht werden.";;
    "pt")
        confirmation_msg="Você também deseja remover os modelos existentes? Essa ação não pode ser desfeita.";;
    "ru")
        confirmation_msg="Вы также хотите удалить существующие шаблоны? Это действие не может быть отменено.";;
    "nl")
        confirmation_msg="Wilt u tevens de reeds gemaakte sjablonen verwijderen? Dit kan niet ongedaan worden gemaakt.";;
    "cs")
        confirmation_msg="Chcete také odstranit stávající šablony? Tuto akci nelze vrátit zpět.";;
    "pl")
        confirmation_msg="Czy chcesz również usunąć istniejące szablony? Tej czynności nie można cofnąć.";;
    "ro")
        confirmation_msg="Doriți, de asemenea, să eliminați șabloanele existente? Această acțiune nu poate fi anulată.";;
    "et")
        confirmation_msg="Kas soovite ka olemasolevad mallid eemaldada? Seda toimingut ei saa tagasi võtta.";;
    "fi")
        confirmation_msg="Haluatko myös poistaa olemassa olevat mallit? Tätä toimintoa ei voi kumota.";;
    "sv")
        confirmation_msg="Vill du också ta bort befintliga mallar? Denna åtgärd kan inte ångras.";;
    "nb" | "nn" | "no")
        confirmation_msg="Vil du også fjerne de eksisterende malene? Denne handlingen kan ikke angres.";;
    "tr")
        success="Mevcut şablonları da kaldırmak istiyor musunuz? Bu işlem geri alınamaz.";;
    "uk")
        success="Ви також хочете видалити існуючі шаблони? Цю дію не можна скасувати.";;
    "is")
        success="Viltu líka fjarlægja núverandi sniðmát? Ekki er hægt að afturkalla þessa aðgerð.";;
    "el")
        success="Θέλετε επίσης να καταργήσετε τα υπάρχοντα πρότυπα; Αυτή η πράξη δε μπορεί να αναιρεθεί.";;
    "hu")
        success="El akarja távolítani a meglévő sablonokat is? Ez a művelet nem visszavonható.";;
    "da")
        success="Vil du også fjerne de eksisterende skabeloner? Denne handling kan ikke fortrydes.";;
    *)
        confirmation_msg="Do you also want to remove the existing templates? This action cannot be undone.";;
esac

if kdialog --warningyesno "$confirmation_msg" --title "Template manager"; then
    rm -r ~/Templates/*
fi

case "${lang_arr[0]:0:2}" in
    "es")
        success="Plugin Administrador de Plantillas para KDE 5 desinstalado existosamente.";;
    "fr")
        success="Le plugin KDE 5 Template Manager a été désinstallé avec succès.";;
    "it")
        success="Il plugin KDE 5 Template Manager è stato disinstallato correttamente.";;
    "de")
        success="KDE 5 Template Manager Plugin erfolgreich deinstalliert.";;
    "pt")
        success="O plugin do gerenciador de modelos do KDE 5 foi desinstalado com sucesso.";;
    "ru")
        success="Плагин KDE 5 Template Manager успешно установлен.";;
    "nl")
        success="De KDE 5-sjabloonbeheerplug-in is verwijderd.";;
    "cs")
        success="Plugin Správce šablon KDE 5 byl úspěšně odinstalován.";;
    "pl")
        success="Wtyczka KDE 5 Template Manager została pomyślnie odinstalowana.";;
    "ro")
        success="KDE 5 Template Manager Plugin dezinstalat cu succes.";;
    "et")
        success="KDE 5 mallihalduri pistikprogrammi desinstallimine õnnestus.";;
    "fi")
        success="KDE 5 Template Manager -laajennuksen asennus onnistui.";;
    "sv")
        success="Plugin-programmet KDE 5 Template Manager avinstallerades.";;
    "nb" | "nn" | "no")
        success="KDE 5 Template Manager Plugin ble avinstallert.";;
    "tr")
        success="KDE 5 Template Manager Eklentisi başarıyla kaldırıldı.";;
    "uk")
        success="Ви Плагін KDE 5 Template Manager успішно видалено.";;
    "is")
        success="Tappi KDE 5 sniðmátsstjóra tókst að fjarlægja.";;
    "el")
        success="Η εγκατάσταση του KDE 5 Template Manager απεγκαταστάθηκε με επιτυχία.";;
    "hu")
        success="A KDE 5 Template Manager beépülő modul sikeresen eltávolítva.";;
    "da")
        success="KDE 5 Template Manager Plugin blev afinstalleret.";;
    *)
        success="KDE 5 Template Manager Plugin successfully uninstalled.";;
esac

kdialog --msgbox "$success" --title "Template manager"