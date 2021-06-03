#!/bin/bash

locales_arr=("${LANGUAGE//:/}")
first_locale="${locales_arr[0]:0:2}"

# region TemplateCreator

function str_cancel_operation()
{
    case "$first_locale" in
        "es")
            echo "Operación cancelada por el usuario."
            ;;
        "fr")
            echo "Opération annulée par l'utilisateur."
            ;;
        "it")
            echo "Operazione annullata dall'utente."
            ;;
        "de")
            echo "Vorgang vom Benutzer abgebrochen."
            ;;
        "pt")
            echo "Operação cancelada pelo usuário."
            ;;
        "ru")
            echo "Операция отменена пользователем."
            ;;
        "nl")
            echo "De handeling is afgebroken door de gebruiker."
            ;;
        *)
            echo "Operation cancelled by user."
            ;;
    esac
}

function str_cannot_template()
{
    case "$first_locale" in
        "es")
            echo "No se puede crear una plantilla a partir de este fichero o directorio."
            ;;
        "fr")
            echo "Impossible de créer un modèle à partir de ce fichier ou de ce répertoire."
            ;;
        "it")
            echo "Impossibile creare un modello da questo file o directory."
            ;;
        "de")
            echo "Aus dieser Datei oder diesem Verzeichnis kann keine Vorlage erstellt werden."
            ;;
        "pt")
            echo "Não é possível criar um modelo a partir deste arquivo ou diretório."
            ;;
        "ru")
            echo "Невозможно создать шаблон из этого файла или каталога."
            ;;
        "nl")
            echo "Er kan geen sjabloon worden gemaakt van dit bestand of deze map."
            ;;
        *)
            echo "Cannot make template from this file or directory."
            ;;
    esac
}

function str_get_name()
{
    case "$first_locale" in
        "es")
            echo "Por favor, introduzca un nombre de plantilla.\nSi se encuentra vacío, tomará el mismo nombre que el archivo original."
            ;;
        "fr")
            echo "Veuillez saisir un nom de modèle.\nS'il est vide, il prendra le nom de fichier d'origine."
            ;;
        "it")
            echo "Per favore, inserisci un nome per il modello.\nSe vuoto, prenderà il nome del file originale."
            ;;
        "de")
            echo "Bitte geben Sie einen Vorlagennamen ein.\nWenn leer, wird der ursprüngliche Dateiname verwendet."
            ;;
        "pt")
            echo "Por favor, insira um nome de modelo.\nSe estiver vazio, terá o nome do arquivo original."
            ;;
        "ru")
            echo "Пожалуйста, введите название шаблона.\nЕсли пусто, будет использовано исходное имя файла."
            ;;
        "nl")
            echo "Geef het sjabloon een naam.\nLaat leeg om de oorspronkelijke bestandsnaam te gebruiken."
            ;;
        *)
            echo "Please, enter a template name.\nIf empty, it will take the original filename."
            ;;
    esac
}

function str_get_comment()
{
    case "$first_locale" in
        "es")
            echo "Por favor, introduzca un comentario para la plantilla."
            ;;
        "fr")
            echo "Veuillez saisir un commentaire sur le modèle."
            ;;
        "it")
            echo "Per favore, inserisci il commento del modello."
            ;;
        "de")
            echo "Bitte geben Sie einen Vorlagenkommentar ein."
            ;;
        "pt")
            echo "Por favor, insira o comentário do modelo."
            ;;
        "ru")
            echo "Пожалуйста, введите комментарий к шаблону."
            ;;
        "nl")
            echo "Voer een sjabloonopmerking in."
            ;;
        *)
            echo "Please, enter template comment."
            ;;
    esac
}

function str_created_template()
{
    case "$first_locale" in
        "es")
            echo "Plantilla creada satisfactoriamente como "
            ;;
        "fr")
            echo "Modèle créé avec succès en tant que "
            ;;
        "it")
            echo "Modello creato con successo come "
            ;;
        "de")
            echo "Vorlage erfolgreich erstellt als "
            ;;
        "pt")
            echo "Modelo criado com sucesso como "
            ;;
        "ru")
            echo "Шаблон успешно создан как "
            ;;
        "nl")
            echo "Het sjabloon is aangemaakt als ."
            ;;
        *)
            echo "Template created successfully as "
            ;;
    esac
}

# endregion

# region TemplateEraser

function str_no_available_templates()
{
    case "$first_locale" in
        "es")
            echo "No hay plantillas disponibles."
            ;;
        "fr")
            echo "Il n'y a pas de modèles disponibles."
            ;;
        "it")
            echo "Non ci sono modelli disponibili."
            ;;
        "de")
            echo "Es sind keine Vorlagen verfügbar."
            ;;
        "pt")
            echo "Não existem modelos disponíveis."
            ;;
        "ru")
            echo "Нет доступных шаблонов."
            ;;
        "nl")
            echo "Er zijn geen sjablonen beschikbaar."
            ;;
        *)
            echo "There are no available templates."
            ;;
    esac
}

function str_select_templates()
{
    case "$first_locale" in
        "es")
            echo "Selecciona la(s) plantilla(s) que desee eliminar:"
            ;;
        "fr")
            echo "Sélectionnez le(s) modèle(s) que vous souhaitez supprimer:"
            ;;
        "it")
            echo "Seleziona i modello/i che desideri rimuovere::"
            ;;
        "de")
            echo "Wählen Sie die Vorlagen aus, die Sie entfernen möchten:"
            ;;
        "pt")
            echo "Selecione o(s) modelo(s) que deseja remover:"
            ;;
        "ru")
            echo "Выберите шаблон (ы), который вы хотите удалить:"
            ;;
        "nl")
            echo "Selecteer één of meerdere te verwijderen sjablonen."
            ;;
        *)
            echo "Select the template(s) you desire to remove:"
            ;;
    esac
}

function str_remove_confirmation()
{
    case "$first_locale" in
        "es")
            echo "¿Estás seguro de que deseas eliminar las siguientes plantillas? Esta acción no se podrá deshacer.<br>"
            ;;
        "fr")
            echo "Voulez-vous vraiment supprimer les prochains modèles? Cette action ne peut pas être annulée.<br>"
            ;;
        "it")
            echo "Sei sicuro di voler rimuovere i modelli successivi? Questa operazione non può essere annullata.<br>"
            ;;
        "de")
            echo "Möchten Sie die nächsten Vorlagen wirklich entfernen? Diese Aktion kann nicht rückgängig gemacht werden.<br>"
            ;;
        "pt")
            echo "Tem certeza que deseja remover os próximos modelos? Esta ação não pode ser desfeita.<br>"
            ;;
        "ru")
            echo "Вы уверены, что хотите удалить следующие шаблоны? Это действие нельзя отменить.<br>"
            ;;
        "nl")
            echo "Weet u zeker dat u de volgende sjablonen wilt verwijderen? Dit kan niet ongedaan worden gemaakt.<br>"
            ;;
        *)
            echo "Are you sure you want to remove next templates? This action cannot be undone.<br>"
            ;;
    esac
}

function str_removed_templates()
{
    case "$first_locale" in
        "es")
            echo "Las siguientes plantillas fueron eliminadas:<br>"
            ;;
        "fr")
            echo "Les modèles suivants ont été supprimés:<br>"
            ;;
        "it")
            echo "I modelli successivi sono stati rimossi:<br>"
            ;;
        "de")
            echo "Die nächsten Vorlagen wurden entfernt:<br>"
            ;;
        "pt")
            echo "Os próximos modelos foram removidos:<br>"
            ;;
        "ru")
            echo "Следующие шаблоны были удалены:<br>"
            ;;
        "nl")
            echo "De volgende sjablonen zijn verwijderd:<br>"
            ;;
        *)
            echo "Next templates were removed:<br>"
            ;;
    esac
}

# endregion