#!/bin/bash

template_folder="$HOME/Templates"
template_src_folder="$HOME/Templates/source"
desktop_ext="desktop"
title="Template manager"

function cancel_operation() {
  lang_arr=("${LANGUAGE//:/}")
  case "${lang_arr[0]:0:2}" in
    "es")
      cancel_msg="Operación cancelada por el usuario."
      ;;
    "fr")
      cancel_msg="Opération annulée par l'utilisateur."
      ;;
    "it")
      cancel_msg="Operazione annullata dall'utente."
      ;;
    "de")
      cancel_msg="Vorgang vom Benutzer abgebrochen."
      ;;
    "pt")
      cancel_msg="Operação cancelada pelo usuário."
      ;;
    "ru")
      cancel_msg="Операция отменена пользователем."
      ;;
    "nl")
      cancel_msg="De handeling is afgebroken door de gebruiker."
      ;;
    *)
      cancel_msg="Operation cancelled by user."
      ;;
  esac
  kdialog --error "$cancel_msg" --title "$title"
  exit 1
}

function no_templates() {
  lang_arr=("${LANGUAGE//:/}")
  case "${lang_arr[0]:0:2}" in
    "es")
      no_templates_msg="No hay plantillas disponibles."
      ;;
    "fr")
      no_templates_msg="Il n'y a pas de modèles disponibles."
      ;;
    "it")
      no_templates_msg="Non ci sono modelli disponibili."
      ;;
    "de")
      no_templates_msg="Es sind keine Vorlagen verfügbar."
      ;;
    "pt")
      no_templates_msg="Não existem modelos disponíveis."
      ;;
    "ru")
      no_templates_msg="Нет доступных шаблонов."
      ;;
    "nl")
      no_templates_msg="Er zijn geen sjablonen beschikbaar."
      ;;
    *)
      no_templates_msg="There are no available templates."
      ;;
  esac
  kdialog --error "$no_templates_msg" --title "$title"
  exit 1
}

function get_select_templates_msg() {
  lang_arr=("${LANGUAGE//:/}")
  case "${lang_arr[0]:0:2}" in
    "es")
      select="Selecciona la(s) plantilla(s) que desee eliminar:"
      ;;
    "fr")
      select="Sélectionnez le(s) modèle(s) que vous souhaitez supprimer:"
      ;;
    "it")
      select="Seleziona i modello/i che desideri rimuovere::"
      ;;
    "de")
      select="Wählen Sie die Vorlagen aus, die Sie entfernen möchten:"
      ;;
    "pt")
      select="Selecione o(s) modelo(s) que deseja remover:"
      ;;
    "ru")
      select="Выберите шаблон (ы), который вы хотите удалить:"
      ;;
    "nl")
      select="Selecteer één of meerdere te verwijderen sjablonen."
      ;;
    *)
      select="Select the template(s) you desire to remove:"
      ;;
  esac
  echo "$select"
}

function get_confirmation_msg() {
  lang_arr=("${LANGUAGE//:/}")
  case "${lang_arr[0]:0:2}" in
    "es")
      confirmation="¿Estás seguro de que deseas eliminar las siguientes plantillas? Esta acción no se podrá deshacer.<br>"
      ;;
    "fr")
      confirmation="Voulez-vous vraiment supprimer les prochains modèles? Cette action ne peut pas être annulée.<br>"
      ;;
    "it")
      confirmation="Sei sicuro di voler rimuovere i modelli successivi? Questa operazione non può essere annullata.<br>"
      ;;
    "de")
      confirmation="Möchten Sie die nächsten Vorlagen wirklich entfernen? Diese Aktion kann nicht rückgängig gemacht werden.<br>"
      ;;
    "pt")
      confirmation="Tem certeza que deseja remover os próximos modelos? Esta ação não pode ser desfeita.<br>"
      ;;
    "ru")
      confirmation="Вы уверены, что хотите удалить следующие шаблоны? Это действие нельзя отменить.<br>"
      ;;
     "nl")
      confirmation="Weet u zeker dat u de volgende sjablonen wilt verwijderen? Dit kan niet ongedaan worden gemaakt.<br>"
      ;;
    *)
      confirmation="Are you sure you want to remove next templates? This action cannot be undone.<br>"
      ;;
  esac
  echo "$confirmation"
}

function get_success_msg() {
  lang_arr=("${LANGUAGE//:/}")
  case "${lang_arr[0]:0:2}" in
    "es")
      success="Las siguientes plantillas fueron eliminadas:<br>"
      ;;
    "fr")
      success="Les modèles suivants ont été supprimés:<br>"
      ;;
    "it")
      success="I modelli successivi sono stati rimossi:<br>"
      ;;
    "de")
      success="Die nächsten Vorlagen wurden entfernt:<br>"
      ;;
    "pt")
      success="Os próximos modelos foram removidos:<br>"
      ;;
    "ru")
      success="Следующие шаблоны были удалены:<br>"
      ;;
    "nl")
      success="De volgende sjablonen zijn verwijderd:<br>"
      ;;
    *)
      success="Next templates were removed:<br>"
      ;;
  esac
  echo "$success"
}

function get_shortname() {
  filename="$(basename -- "$1")"
  echo "${filename%%.*}"
}

function get_template_desktop() {
  shortname="$(get_shortname "$1")"
  echo "$template_folder/$shortname.$desktop_ext"
}

function remove_template() {
  rm -r "${template_src_folder:?}/${1:?}" "$(get_template_desktop "$1")"
}

if [ "$(ls -1q "$HOME/Templates/source" | wc -l)" -eq 0 ]; then
  no_templates
fi

declare -a kdialog_args
kdialog_args+=("$(get_select_templates_msg)")

for file in "$template_src_folder"/*; do
  if [ -e "$file" ] && [ -e "$(get_template_desktop "$file")" ]; then
    filename=$(basename -- "$file")
    kdialog_args+=("$filename")
    if [ -d "$file" ]; then
      kdialog_args+=("Dir:  \"$filename\"")
    elif [ -f "$file" ]; then
      kdialog_args+=("File: \"$filename\"")
    else
      kdialog_args+=("???:  \"$filename\"")
    fi
    kdialog_args+=("off")
  fi
done

if ! templates_to_remove=$(kdialog --separate-output --checklist "${kdialog_args[@]}" --title "$title"); then
  cancel_operation
fi

file_list=""
while IFS= read -r file; do
  file_list="$file_list<br>- $file"
done <<<"$templates_to_remove"

if ! kdialog --warningyesno "$(get_confirmation_msg)$file_list" --title "$title"; then
  cancel_operation
fi

while IFS= read -r file; do
  remove_template "$file"
done <<<"$templates_to_remove"

kdialog --msgbox "$(get_success_msg)$file_list" --title "$title":
