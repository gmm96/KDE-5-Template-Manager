#!/bin/bash

locales_arr=("${LANGUAGE//:/}")
first_locale="${locales_arr[0]:0:2}"

function str_window_title() {
    case "$first_locale" in
        "es")
            echo "Administrador de plantillas";;
        "fr")
            echo "Gestionnaire de modèles";;
        "it")
            echo "Gestore modelli";;
        "de")
            echo "Vorlagenmanager";;
        "pt")
            echo "Gerenciador de modelos";;
        "ru")
            echo "Менеджер шаблонов";;
        "nl")
            echo "Sjabloonmanager";;
        "cs")
            echo "Správce šablon";;
        "pl")
            echo "Menedżer szablonów";;
        "ro")
            echo "Manager șabloane";;
        "et")
            echo "Mallihaldur";;
        "fi")
            echo "Mallinhallinta";;
        "sv")
            echo "Mallchef";;
        "nb" | "nn" | "no")
            echo "Malansvarlig";;
        *)
            echo "Template manager";;
    esac
}

# region TemplateCreator

function str_cancel_operation()
{
    case "$first_locale" in
        "es")
            echo "Operación cancelada por el usuario.";;
        "fr")
            echo "Opération annulée par l'utilisateur.";;
        "it")
            echo "Operazione annullata dall'utente.";;
        "de")
            echo "Vorgang vom Benutzer abgebrochen.";;
        "pt")
            echo "Operação cancelada pelo usuário.";;
        "ru")
            echo "Операция отменена пользователем.";;
        "nl")
            echo "De handeling is afgebroken door de gebruiker.";;
        "cs")
            echo "Operace zrušena uživatelem.";;
        "pl")
            echo "Operacja anulowana przez użytkownika.";;
        "ro")
            echo "Operațiune anulată de utilizator.";;
        "et")
            echo "Kasutaja tühistas toimingu.";;
        "fi")
            echo "Käyttäjä peruutti toiminnan.";;
        "sv")
            echo "Åtgärden avbröts av användaren.";;
        "nb" | "nn" | "no")
            echo "Operasjonen avbrutt av brukeren.";;
        *)
            echo "Operation cancelled by user.";;
    esac
}

function str_cannot_template()
{
    case "$first_locale" in
        "es")
            echo "No se puede crear una plantilla a partir de este fichero o directorio.";;
        "fr")
            echo "Impossible de créer un modèle à partir de ce fichier ou de ce répertoire.";;
        "it")
            echo "Impossibile creare un modello da questo file o directory.";;
        "de")
            echo "Aus dieser Datei oder diesem Verzeichnis kann keine Vorlage erstellt werden.";;
        "pt")
            echo "Não é possível criar um modelo a partir deste arquivo ou diretório.";;
        "ru")
            echo "Невозможно создать шаблон из этого файла или каталога.";;
        "nl")
            echo "Er kan geen sjabloon worden gemaakt van dit bestand of deze map.";;
        "cs")
            echo "Z tohoto souboru nebo adresáře nelze vytvořit šablonu.";;
        "pl")
            echo "Nie można utworzyć szablonu z tego pliku lub katalogu.";;
        "ro")
            echo "Nu se poate crea șablon din acest fișier sau director.";;
        "et")
            echo "Sellest failist või kataloogist ei saa malli luua.";;
        "fi")
            echo "Mallia ei voi luoda tästä tiedostosta tai hakemistosta.";;
        "sv")
            echo "Det går inte att skapa mall från den här filen eller katalogen.";;
        "nb" | "nn" | "no")
            echo "Kan ikke lage mal fra denne filen eller katalogen.";;
        *)
            echo "Cannot make template from this file or directory.";;
    esac
}

function str_get_name()
{
    case "$first_locale" in
        "es")
            echo "Por favor, introduzca un nombre de plantilla.<br>Si se encuentra vacío, tomará el mismo nombre que el archivo original.";;
        "fr")
            echo "Veuillez saisir un nom de modèle.<br>S'il est vide, il prendra le nom de fichier d'origine.";;
        "it")
            echo "Per favore, inserisci un nome per il modello.<br>Se vuoto, prenderà il nome del file originale.";;
        "de")
            echo "Bitte geben Sie einen Vorlagennamen ein.<br>Wenn leer, wird der ursprüngliche Dateiname verwendet.";;
        "pt")
            echo "Por favor, insira um nome de modelo.<br>Se estiver vazio, terá o nome do arquivo original.";;
        "ru")
            echo "Пожалуйста, введите название шаблона.<br>Если пусто, будет использовано исходное имя файла.";;
        "nl")
            echo "Geef het sjabloon een naam.<br>Laat leeg om de oorspronkelijke bestandsnaam te gebruiken.";;
        "cs")
            echo "Zadejte prosím název šablony.<br>Pokud je prázdný, použije se původní název souboru.";;
        "pl")
            echo "Proszę podać nazwę szablonu.<br>Jeśli jest pusty, przyjmie oryginalną nazwę pliku.";;
        "ro")
            echo "Vă rugăm să introduceți un nume de șablon.<br>Dacă este gol, acesta va prelua numele de fișier original.";;
        "et")
            echo "Sisestage malli nimi.<br>Kui see on tühi, võtab see algse failinime.";;
        "fi")
            echo "Anna mallin nimi.<br>Jos se on tyhjä, se vie alkuperäisen tiedostonimen.";;
        "sv")
            echo "Ange ett mallnamn.<br>Om det är tomt tar det ursprungliga filnamnet.";;
        "nb" | "nn" | "no")
            echo "Vennligst skriv inn et malnavn.<br>Hvis det er tomt, tar det det originale filnavnet.";;
        *)
            echo "Please, enter a template name.<br>If empty, it will take the original filename.";;
    esac
}

function str_get_comment()
{
    case "$first_locale" in
        "es")
            echo "Por favor, introduzca un comentario para la plantilla.";;
        "fr")
            echo "Veuillez saisir un commentaire sur le modèle.";;
        "it")
            echo "Per favore, inserisci il commento del modello.";;
        "de")
            echo "Bitte geben Sie einen Vorlagenkommentar ein.";;
        "pt")
            echo "Por favor, insira o comentário do modelo.";;
        "ru")
            echo "Пожалуйста, введите комментарий к шаблону.";;
        "nl")
            echo "Voer een sjabloonopmerking in.";;
        "cs")
            echo "Zadejte prosím komentář šablony.";;
        "pl")
            echo "Proszę wpisać komentarz do szablonu.";;
        "ro")
            echo "Vă rugăm, introduceți comentariul șablonului.";;
        "et")
            echo "Sisestage palun malli kommentaar.";;
        "fi")
            echo "Anna mallikommentti.";;
        "sv")
            echo "Snälla, ange mallkommentar.";;
        "nb" | "nn" | "no")
            echo "Vennligst skriv inn malkommentar.";;
        *)
            echo "Please, enter template comment.";;
    esac
}

function str_created_template()
{
    case "$first_locale" in
        "es")
            echo "Plantilla creada satisfactoriamente como ";;
        "fr")
            echo "Modèle créé avec succès en tant que ";;
        "it")
            echo "Modello creato con successo come ";;
        "de")
            echo "Vorlage erfolgreich erstellt als ";;
        "pt")
            echo "Modelo criado com sucesso como ";;
        "ru")
            echo "Шаблон успешно создан как ";;
        "nl")
            echo "Het sjabloon is aangemaakt als ";;
        "cs")
            echo "Šablona byla úspěšně vytvořena jako ";;
        "pl")
            echo "Szablon utworzony pomyślnie jako ";;
        "ro")
            echo "Șablon creat cu succes ca ";;
        "et")
            echo "Mall on edukalt loodud ";;
        "fi")
            echo "Mallin luominen onnistui nimellä ";;
        "sv")
            echo "Mall skapades framgångsrikt som ";;
        "nb" | "nn" | "no")
            echo "Mal opprettet vellykket som ";;
        *)
            echo "Template created successfully as ";;
    esac
}

# endregion

# region TemplateEraser

function str_no_available_templates()
{
    case "$first_locale" in
        "es")
            echo "No hay plantillas disponibles.";;
        "fr")
            echo "Il n'y a pas de modèles disponibles.";;
        "it")
            echo "Non ci sono modelli disponibili.";;
        "de")
            echo "Es sind keine Vorlagen verfügbar.";;
        "pt")
            echo "Não existem modelos disponíveis.";;
        "ru")
            echo "Нет доступных шаблонов.";;
        "nl")
            echo "Er zijn geen sjablonen beschikbaar.";;
        "cs")
            echo "Nejsou k dispozici žádné šablony.";;
        "pl")
            echo "Brak dostępnych szablonów.";;
        "ro")
            echo "Nu există șabloane disponibile.";;
        "et")
            echo "Malle pole saadaval.";;
        "fi")
            echo "Ei ole käytettävissä malleja.";;
        "sv")
            echo "Det finns inga tillgängliga mallar.";;
        "nb" | "nn" | "no")
            echo "Det er ingen tilgjengelige maler.";;
        *)
            echo "There are no available templates.";;
    esac
}

function str_select_templates()
{
    case "$first_locale" in
        "es")
            echo "Selecciona la(s) plantilla(s) que desee eliminar:";;
        "fr")
            echo "Sélectionnez le(s) modèle(s) que vous souhaitez supprimer:";;
        "it")
            echo "Seleziona i modello/i che desideri rimuovere:";;
        "de")
            echo "Wählen Sie die Vorlagen aus, die Sie entfernen möchten:";;
        "pt")
            echo "Selecione o(s) modelo(s) que deseja remover:";;
        "ru")
            echo "Выберите шаблон (ы), который вы хотите удалить:";;
        "nl")
            echo "Selecteer één of meerdere te verwijderen sjablonen:";;
        "cs")
            echo "Vyberte šablony, které chcete odebrat:";;
        "pl")
            echo "Wybierz szablony, które chcesz usunąć:";;
        "ro")
            echo "Wybierz szablony, które chcesz usunąć:";;
        "et")
            echo "Valige mallid, mille soovite eemaldada:";;
        "fi")
            echo "Valitse poistettavat mallit:";;
        "sv")
            echo "Välj de mallar du vill ta bort:";;
        "nb" | "nn" | "no")
            echo "Velg malene du vil fjerne:";;
        *)
            echo "Select the template(s) you desire to remove:";;
    esac
}

function str_remove_confirmation()
{
    case "$first_locale" in
        "es")
            echo "¿Estás seguro de que deseas eliminar las siguientes plantillas? Esta acción no se podrá deshacer.<br>";;
        "fr")
            echo "Voulez-vous vraiment supprimer les prochains modèles? Cette action ne peut pas être annulée.<br>";;
        "it")
            echo "Sei sicuro di voler rimuovere i modelli successivi? Questa operazione non può essere annullata.<br>";;
        "de")
            echo "Möchten Sie die nächsten Vorlagen wirklich entfernen? Diese Aktion kann nicht rückgängig gemacht werden.<br>";;
        "pt")
            echo "Tem certeza que deseja remover os próximos modelos? Esta ação não pode ser desfeita.<br>";;
        "ru")
            echo "Вы уверены, что хотите удалить следующие шаблоны? Это действие нельзя отменить.<br>";;
        "nl")
            echo "Weet u zeker dat u de volgende sjablonen wilt verwijderen? Dit kan niet ongedaan worden gemaakt.<br>";;
        "cs")
            echo "Opravdu chcete odebrat další šablony? Tuto akci nelze vrátit zpět.<br>";;
        "pl")
            echo "Czy na pewno chcesz usunąć kolejne szablony? Tej czynności nie można cofnąć.<br>";;
        "ro")
            echo "Sigur doriți să eliminați următoarele șabloane? Această acțiune nu poate fi anulată.<br>";;
        "et")
            echo "Kas soovite kindlasti järgmised mallid eemaldada? Seda toimingut ei saa tagasi võtta.<br>";;
        "fi")
            echo "Haluatko varmasti poistaa seuraavat mallit? Tätä toimintoa ei voi kumota.<br>";;
        "sv")
            echo "Är du säker på att du vill ta bort nästa mallar? Den här åtgärden kan inte ångras.<br>";;
        "nb" | "nn" | "no")
            echo "Er du sikker på at du vil fjerne neste maler? Denne handlingen kan ikke angres.<br>";;
        *)
            echo "Are you sure you want to remove next templates? This action cannot be undone.<br>";;
    esac
}

function str_removed_templates()
{
    case "$first_locale" in
        "es")
            echo "Las siguientes plantillas fueron eliminadas:<br>";;
        "fr")
            echo "Les modèles suivants ont été supprimés:<br>";;
        "it")
            echo "I modelli successivi sono stati rimossi:<br>";;
        "de")
            echo "Die nächsten Vorlagen wurden entfernt:<br>";;
        "pt")
            echo "Os próximos modelos foram removidos:<br>";;
        "ru")
            echo "Следующие шаблоны были удалены:<br>";;
        "nl")
            echo "De volgende sjablonen zijn verwijderd:<br>";;
        "cs")
            echo "Byly odstraněny další šablony:<br>";;
        "pl")
            echo "Kolejne szablony zostały usunięte:<br>";;
        "ro")
            echo "Următoarele șabloane au fost eliminate:<br>";;
        "et")
            echo "Järgmised mallid eemaldati:<br>";;
        "fi")
            echo "Seuraavat mallit poistettiin:<br>";;
        "sv")
            echo "Nästa mallar togs bort:<br>";;
        "nb" | "nn" | "no")
            echo "Neste maler ble fjernet:<br>";;
        *)
            echo "Next templates were removed:<br>";;
    esac
}

# endregion