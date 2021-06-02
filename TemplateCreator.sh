#!/bin/bash

template_folder="$HOME/Templates"
template_src_folder="$template_folder/source"
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

function cannot_template() {
  lang_arr=("${LANGUAGE//:/}")
  case "${lang_arr[0]:0:2}" in
    "es")
      not_template_msg="No se puede crear una plantilla a partir de este fichero o directorio."
      ;;
    "fr")
      not_template_msg="Impossible de créer un modèle à partir de ce fichier ou de ce répertoire."
      ;;
    "it")
      not_template_msg="Impossibile creare un modello da questo file o directory."
      ;;
    "de")
      not_template_msg="Aus dieser Datei oder diesem Verzeichnis kann keine Vorlage erstellt werden."
      ;;
    "pt")
      not_template_msg="Não é possível criar um modelo a partir deste arquivo ou diretório."
      ;;
    "ru")
      not_template_msg="Невозможно создать шаблон из этого файла или каталога."
      ;;
    "nl")
      not_template_msg="Er kan geen sjabloon worden gemaakt van dit bestand of deze map."
      ;;
    *)
      not_template_msg="Cannot make template from this file or directory."
      ;;
  esac
  kdialog --error "$not_template_msg" --title "$title"
  exit 1
}

function get_name_msg() {
  lang_arr=("${LANGUAGE//:/}")
  case "${lang_arr[0]:0:2}" in
    "es")
      name="Por favor, introduzca un nombre de plantilla.\nSi se encuentra vacío, tomará el mismo nombre que el archivo original."
      ;;
    "fr")
      name="Veuillez saisir un nom de modèle.\nS'il est vide, il prendra le nom de fichier d'origine."
      ;;
    "it")
      name="Per favore, inserisci un nome per il modello.\nSe vuoto, prenderà il nome del file originale."
      ;;
    "de")
      name="Bitte geben Sie einen Vorlagennamen ein.\nWenn leer, wird der ursprüngliche Dateiname verwendet."
      ;;
    "pt")
      name="Por favor, insira um nome de modelo.\nSe estiver vazio, terá o nome do arquivo original."
      ;;
    "ru")
      name="Пожалуйста, введите название шаблона.\nЕсли пусто, будет использовано исходное имя файла."
      ;;
    "nl")
      name="Geef het sjabloon een naam.\Laat leeg om de oorspronkelijke bestandsnaam te gebruiken."
      ;;
    *)
      name="Please, enter a template name.\n If empty, it will take the original filename."
      ;;
  esac
  echo "$name"
}

function get_comment_msg() {
  lang_arr=("${LANGUAGE//:/}")
  case "${lang_arr[0]:0:2}" in
    "es")
      comment="Por favor, introduzca un comentario para la plantilla."
      ;;
    "fr")
      comment="Veuillez saisir un commentaire sur le modèle."
      ;;
    "it")
      comment="Per favore, inserisci il commento del modello."
      ;;
    "de")
      comment="Bitte geben Sie einen Vorlagenkommentar ein."
      ;;
    "pt")
      comment="Por favor, insira o comentário do modelo."
      ;;
    "ru")
      comment="Пожалуйста, введите комментарий к шаблону."
      ;;
    "nl")
      comment="Voer een sjabloonopmerking in."
      ;;
    *)
      comment="Please, enter template comment."
      ;;
  esac
  echo "$comment"
}

function get_success_msg() {
  lang_arr=("${LANGUAGE//:/}")
  case "${lang_arr[0]:0:2}" in
    "es")
      success="Plantilla creada satisfactoriamente como "
      ;;
    "fr")
      success="Modèle créé avec succès en tant que "
      ;;
    "it")
      success="Modello creato con successo come "
      ;;
    "de")
      success="Vorlage erfolgreich erstellt als "
      ;;
    "pt")
      success="Modelo criado com sucesso como "
      ;;
    "ru")
      success="Шаблон успешно создан как "
      ;;
    "nl")
      success="Het sjabloon is aangemaakt als ."
      ;;
    *)
      success="Template created successfully as "
      ;;
  esac
  echo "$success"
}

if [ "$#" -ne 1 ]; then
  echo "Error: Illegal number of parameters."
  echo "Use: sh $0 <file>"
  exit 1
fi

filename=$(basename -- "$1")
shortname="${filename%%.*}"
file_ext="${filename##*.}"

if ! template_name=$(kdialog --inputbox "$(get_name_msg)" "$shortname" --title "$title"); then
  cancel_operation
elif [[ -z "${template_name// /}" ]]; then
  template_name=$shortname
fi

if ! template_comment=$(kdialog --inputbox "$(get_comment_msg)" --title "$title"); then
  cancel_operation
fi

if ! template_icon=$(kdialog --geticon MimeType --title "$title"); then
  cancel_operation
fi

if [ -d "$1" ]; then
  template_url="$template_src_folder/$template_name"
  cp -r "$1" "$template_url"
elif [ -f "$1" ]; then
  template_url="$template_src_folder/$template_name.$file_ext"
  cp "$1" "$template_url"
else
  cannot_template
fi

echo "[Desktop Entry]
Name=$template_name
Comment=$template_comment
Type=Link
URL=$template_url
Icon=$template_icon" >"$template_folder/$template_name.$desktop_ext"

kdialog --msgbox "$(get_success_msg)'$template_name'." --title "$title":
