#!/bin/bash

rm ~/.bin/TemplateCreator.sh
rm ~/.bin/TemplateEraser.sh
rm ~/.local/share/kservices5/ServiceMenus/TemplateManager.desktop

lang_arr=("${LANGUAGE//:/}")
case "${lang_arr[0]:0:2}" in
  "es")
    confirmation_msg="¿Desea eliminar también las plantillas existentes? Esta acción no se podrá deshacer."
    ;;
  "fr")
    confirmation_msg="Voulez-vous également supprimer les modèles existants? Cette action ne peut pas être annulée."
    ;;
  "it")
    confirmation_msg="Vuoi anche rimuovere i modelli esistenti? Questa azione non può essere annullata."
    ;;
  "de")
    confirmation_msg="Möchten Sie auch die vorhandenen Vorlagen entfernen? Diese Aktion kann nicht rückgängig gemacht werden."
    ;;
  "pt")
    confirmation_msg="Você também deseja remover os modelos existentes? Essa ação não pode ser desfeita."
    ;;
  "ru")
    confirmation_msg="Вы также хотите удалить существующие шаблоны? Это действие не может быть отменено."
    ;;
    "nl")
    confirmation_msg="Wilt u tevens de reeds gemaakte sjablonen verwijderen? Dit kan niet ongedaan worden gemaakt."
    ;;
  *)
    confirmation_msg="Do you also want to remove the existing templates? This action cannot be undone."
    ;;
esac

if kdialog --warningyesno "$confirmation_msg" --title "Template Manager"; then
  rm -r ~/Templates/*
fi

case "${lang_arr[0]:0:2}" in
  "es")
    success="Plugin Administrador de Plantillas para KDE 5 desinstalado existosamente."
    ;;
  "fr")
    success="Le plugin KDE 5 Template Manager a été désinstallé avec succès."
    ;;
  "it")
    success="Il plugin KDE 5 Template Manager è stato disinstallato correttamente."
    ;;
  "de")
    success="KDE 5 Template Manager Plugin erfolgreich deinstalliert."
    ;;
  "pt")
    success="O plugin do gerenciador de modelos do KDE 5 foi desinstalado com sucesso."
    ;;
  "ru")
    success="Плагин KDE 5 Template Manager успешно установлен."
    ;;
  "nl")
    success="De KDE 5-sjabloonbeheerplug-in is verwijderd."
    ;;
  *)
    success="KDE 5 Template Manager Plugin successfully uninstalled."
    ;;
esac

kdialog --title "Template manager" --msgbox "$success"
