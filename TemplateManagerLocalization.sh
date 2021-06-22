#!/bin/bash

locales_arr=("${LANGUAGE//:/}")
first_locale="${locales_arr[0]:0:2}"

function str_window_title() {
    case "$first_locale" in
        "es")
            printf "Administrador de plantillas";;
        "fr")
            printf "Gestionnaire de modèles";;
        "it")
            printf "Gestore modelli";;
        "de")
            printf "Vorlagenmanager";;
        "pt")
            printf "Gerenciador de modelos";;
        "ru")
            printf "Менеджер шаблонов";;
        "nl")
            printf "Sjabloonmanager";;
        "cs")
            printf "Správce šablon";;
        "pl")
            printf "Menedżer szablonów";;
        "ro")
            printf "Manager șabloane";;
        "et")
            printf "Mallihaldur";;
        "fi")
            printf "Mallinhallinta";;
        "sv")
            printf "Mallchef";;
        "nb" | "nn" | "no")
            printf "Malansvarlig";;
        "tr")
            printf "Şablon yöneticisi";;
        "uk")
            printf "Менеджер шаблонів";;
        "is")
            printf "Sniðmátastjóri";;
        "el")
            printf "Διαχειριστής προτύπων";;
        "hu")
            printf "Sablonkezelő";;
        "da")
            printf "Skabelonadministrator";;
        *)
            printf "Template manager";;
    esac
}

# region TemplateCreator

function str_cancel_operation()
{
    case "$first_locale" in
        "es")
            printf "Operación cancelada por el usuario.";;
        "fr")
            printf "Opération annulée par l'utilisateur.";;
        "it")
            printf "Operazione annullata dall'utente.";;
        "de")
            printf "Vorgang vom Benutzer abgebrochen.";;
        "pt")
            printf "Operação cancelada pelo usuário.";;
        "ru")
            printf "Операция отменена пользователем.";;
        "nl")
            printf "De handeling is afgebroken door de gebruiker.";;
        "cs")
            printf "Operace zrušena uživatelem.";;
        "pl")
            printf "Operacja anulowana przez użytkownika.";;
        "ro")
            printf "Operațiune anulată de utilizator.";;
        "et")
            printf "Kasutaja tühistas toimingu.";;
        "fi")
            printf "Käyttäjä peruutti toiminnan.";;
        "sv")
            printf "Åtgärden avbröts av användaren.";;
        "nb" | "nn" | "no")
            printf "Operasjonen avbrutt av brukeren.";;
        "tr")
            printf "İşlem kullanıcı tarafından iptal edildi.";;
        "uk")
            printf "Операцію скасовано користувачем.";;
        "is")
            printf "Aðgerð hætt við af notanda.";;
        "el")
            printf "Η λειτουργία ακυρώθηκε από τον χρήστη.";;
        "hu")
            printf "A műveletet a felhasználó törölte.";;
        "da")
            printf "Drift annulleret af brugeren.";;
        *)
            printf "Operation cancelled by user.";;
    esac
}

function str_cannot_template()
{
    case "$first_locale" in
        "es")
            printf "No se puede crear una plantilla a partir de este fichero o directorio.";;
        "fr")
            printf "Impossible de créer un modèle à partir de ce fichier ou de ce répertoire.";;
        "it")
            printf "Impossibile creare un modello da questo file o directory.";;
        "de")
            printf "Aus dieser Datei oder diesem Verzeichnis kann keine Vorlage erstellt werden.";;
        "pt")
            printf "Não é possível criar um modelo a partir deste arquivo ou diretório.";;
        "ru")
            printf "Невозможно создать шаблон из этого файла или каталога.";;
        "nl")
            printf "Er kan geen sjabloon worden gemaakt van dit bestand of deze map.";;
        "cs")
            printf "Z tohoto souboru nebo adresáře nelze vytvořit šablonu.";;
        "pl")
            printf "Nie można utworzyć szablonu z tego pliku lub katalogu.";;
        "ro")
            printf "Nu se poate crea șablon din acest fișier sau director.";;
        "et")
            printf "Sellest failist või kataloogist ei saa malli luua.";;
        "fi")
            printf "Mallia ei voi luoda tästä tiedostosta tai hakemistosta.";;
        "sv")
            printf "Det går inte att skapa mall från den här filen eller katalogen.";;
        "nb" | "nn" | "no")
            printf "Kan ikke lage mal fra denne filen eller katalogen.";;
        "tr")
            printf "Bu dosya veya dizinden şablon oluşturulamıyor.";;
        "uk")
            printf "Не вдається створити шаблон із цього файлу або каталогу.";;
        "is")
            printf "Get ekki búið til sniðmát úr þessari skrá eða möppu.";;
        "el")
            printf "Δεν είναι δυνατή η δημιουργία προτύπου από αυτό το αρχείο ή κατάλογο.";;
        "hu")
            printf "Nem lehet sablont készíteni ebből a fájlból vagy könyvtárból.";;
        "da")
            printf "Kan ikke oprette skabelon fra denne fil eller bibliotek.";;
        *)
            printf "Cannot make template from this file or directory.";;
    esac
}

function str_get_name()
{
    case "$first_locale" in
        "es")
            printf "Por favor, introduzca un nombre de plantilla.<br>Si se encuentra vacío, tomará el mismo nombre que el archivo original.";;
        "fr")
            printf "Veuillez saisir un nom de modèle.<br>S'il est vide, il prendra le nom de fichier d'origine.";;
        "it")
            printf "Per favore, inserisci un nome per il modello.<br>Se vuoto, prenderà il nome del file originale.";;
        "de")
            printf "Bitte geben Sie einen Vorlagennamen ein.<br>Wenn leer, wird der ursprüngliche Dateiname verwendet.";;
        "pt")
            printf "Por favor, insira um nome de modelo.<br>Se estiver vazio, terá o nome do arquivo original.";;
        "ru")
            printf "Пожалуйста, введите название шаблона.<br>Если пусто, будет использовано исходное имя файла.";;
        "nl")
            printf "Geef het sjabloon een naam.<br>Laat leeg om de oorspronkelijke bestandsnaam te gebruiken.";;
        "cs")
            printf "Zadejte prosím název šablony.<br>Pokud je prázdný, použije se původní název souboru.";;
        "pl")
            printf "Proszę podać nazwę szablonu.<br>Jeśli jest pusty, przyjmie oryginalną nazwę pliku.";;
        "ro")
            printf "Vă rugăm să introduceți un nume de șablon.<br>Dacă este gol, acesta va prelua numele de fișier original.";;
        "et")
            printf "Sisestage malli nimi.<br>Kui see on tühi, võtab see algse failinime.";;
        "fi")
            printf "Anna mallin nimi.<br>Jos se on tyhjä, se vie alkuperäisen tiedostonimen.";;
        "sv")
            printf "Ange ett mallnamn.<br>Om det är tomt tar det ursprungliga filnamnet.";;
        "nb" | "nn" | "no")
            printf "Vennligst skriv inn et malnavn.<br>Hvis det er tomt, tar det det originale filnavnet.";;
        "tr")
            printf "Lütfen bir şablon adı girin.<br>Boşsa, orijinal dosya adını alacaktır.";;
        "uk")
            printf "Будь ласка, введіть назву шаблону.<br>Якщо пусте, воно буде мати оригінальне ім’я файлу.";;
        "is")
            printf "Vinsamlegast sláðu inn heiti sniðmáts.<br>Ef það er autt tekur það upprunalega skráarheitið.";;
        "el")
            printf "Εισαγάγετε ένα όνομα προτύπου.<br>Εάν είναι κενό, θα πάρει το αρχικό όνομα αρχείου.";;
        "hu")
            printf "Kérjük, írja be a sablon nevét.<br>Ha üres, akkor az eredeti fájlnév lesz.";;
        "da")
            printf "Indtast venligst et skabelonnavn.<br>Hvis det er tomt, tager det det originale filnavn.";;
        *)
            printf "Please, enter a template name.<br>If empty, it will take the original filename.";;
    esac
}

function str_get_comment()
{
    case "$first_locale" in
        "es")
            printf "Por favor, introduzca un comentario para la plantilla.<br>Se mostrará como sugerencia en el de diálogo de creación de un nuevo archivo, donde usted elige su nombre.";;
        "fr")
            printf "S'il vous plaît, entrez un commentaire sur le modèle.<br>Il sera affiché comme indice dans la boîte de dialogue de création de nouveau fichier, où vous choisissez son nom de fichier.";;
        "it")
            printf "Per favore, inserisci il commento del modello.<br>Verrà visualizzato come suggerimento nella finestra di dialogo di creazione del nuovo file, dove scegli il nome del file.";;
        "de")
            printf "Bitte geben Sie einen Kommentar zur Vorlage ein.<br>Er wird als Hinweis im Dialogfeld zum Erstellen neuer Dateien angezeigt, in dem Sie den Dateinamen auswählen.";;
        "pt")
            printf "Por favor, insira o comentário do modelo.<br>Ele será exibido como uma dica na caixa de diálogo de criação de novo arquivo, onde você escolhe o nome do arquivo.";;
        "ru")
            printf "Пожалуйста, введите комментарий к шаблону.<br>Он будет отображаться как подсказка в диалоге создания нового файла, где вы выбираете его имя.";;
        "nl")
            printf "Voer een sjabloonopmerking in.<br>Het wordt weergegeven als hint in het dialoogvenster voor het maken van nieuwe bestanden, waar u de bestandsnaam kiest.";;
        "cs")
            printf "Zadejte prosím komentář šablony.<br>Zobrazí se jako nápověda v novém dialogu pro vytvoření souboru, kde zvolíte jeho název souboru.";;
        "pl")
            printf "Proszę wpisać komentarz do szablonu.<br>Będzie on wyświetlany jako podpowiedź w oknie tworzenia nowego pliku, gdzie wybierasz jego nazwę.";;
        "ro")
            printf "Vă rugăm, introduceți comentariul șablon.<br>Acesta va fi afișat ca indiciu în dialogul de creare a fișierelor noi, unde alegeți numele acestuia.";;
        "et")
            printf "Sisestage palun malli kommentaar.<br>Seda kuvatakse vihjena uues faili loomise dialoogis, kus valite selle failinime.";;
        "fi")
            printf "Anna mallikommentti.<br>Se näkyy vihjeenä uudessa tiedostonluonti-valintaikkunassa, jossa valitset sen tiedostonimen.";;
        "sv")
            printf "Vänligen ange mallkommentar.<br>Den kommer att visas som en ledtråd i dialogrutan för skapande av nya filer, där du väljer filnamn.";;
        "nb" | "nn" | "no")
            printf "Vennligst skriv inn malkommentarer.<br>Den vises som et hint i dialogboksen for ny filoppretting, der du velger filnavnet.";;
        "tr")
            printf "Lütfen şablon yorumunu girin.<br>Dosya adını seçtiğiniz yeni dosya oluşturma iletişim kutusunda ipucu olarak görüntülenecektir.";;
        "uk")
            printf "Будь ласка, введіть коментар до шаблону.<br>Він буде відображений як підказка у діалоговому вікні створення нового файлу, де ви виберете його ім'я файлу.";;
        "is")
            printf "Vinsamlegast sláðu inn sniðmátaskýringu.<br>Það verður sýnt sem vísbending í nýjum skjalagerðarglugga þar sem þú velur skráarnafn.";;
        "el")
            printf "Εισαγάγετε σχόλιο προτύπου.<br>Θα εμφανίζεται ως υπόδειξη στο νέο διάλογο δημιουργίας αρχείων, όπου επιλέγετε το όνομα αρχείου του.";;
        "hu")
            printf "Kérjük, írja be a sablon megjegyzését.<br>Ujjként jelenik meg az új fájl létrehozása párbeszédpanelen, ahol a fájlnevet választja.";;
        "da")
            printf "Indtast venligst skabelonkommentar.<br>Den vises som antydning i dialogboksen til oprettelse af en ny fil, hvor du vælger dens filnavn.";;
        *)
            printf "Please, enter template comment.<br>It will be displayed as hint in new file creation dialog, where you choose its filename.";;
    esac
}

function str_created_template()
{
    case "$first_locale" in
        "es")
            printf "Plantilla creada satisfactoriamente como ";;
        "fr")
            printf "Modèle créé avec succès en tant que ";;
        "it")
            printf "Modello creato con successo come ";;
        "de")
            printf "Vorlage erfolgreich erstellt als ";;
        "pt")
            printf "Modelo criado com sucesso como ";;
        "ru")
            printf "Шаблон успешно создан как ";;
        "nl")
            printf "Het sjabloon is aangemaakt als ";;
        "cs")
            printf "Šablona byla úspěšně vytvořena jako ";;
        "pl")
            printf "Szablon utworzony pomyślnie jako ";;
        "ro")
            printf "Șablon creat cu succes ca ";;
        "et")
            printf "Mall on edukalt loodud ";;
        "fi")
            printf "Mallin luominen onnistui nimellä ";;
        "sv")
            printf "Mall skapades framgångsrikt som ";;
        "nb" | "nn" | "no")
            printf "Mal opprettet vellykket som ";;
        "tr")
            printf "Şablon başarıyla oluşturuldu ";;
        "uk")
            printf "Шаблон успішно створено як ";;
        "is")
            printf "Sniðmát búið til sem ";;
        "el")
            printf "Το πρότυπο δημιουργήθηκε με επιτυχία ως ";;
        "hu")
            printf "A sablon sikeresen létrehozva ";;
        "da")
            printf "Skabelon oprettet med succes som ";;
        *)
            printf "Template created successfully as ";;
    esac
}

# endregion

# region TemplateEditor

function str_name_should_not_be_empty()
{
    case "$first_locale" in
        "es")
            printf "El nombre de la plantilla no puede estar vacío.";;
        "fr")
            printf "Le nom du modèle ne doit pas être vide.";;
        "it")
            printf "Il nome del modello non deve essere vuoto.";;
        "de")
            printf "Der Vorlagenname darf nicht leer sein.";;
        "pt")
            printf "O nome do modelo não deve estar vazio.";;
        "ru")
            printf "Название шаблона не должно быть пустым.";;
        "nl")
            printf "Sjabloonnaam mag niet leeg zijn.";;
        "cs")
            printf "Název šablony by neměl být prázdný.";;
        "pl")
            printf "Nazwa szablonu nie powinna być pusta.";;
        "ro")
            printf "Numele șablonului nu trebuie să fie gol.";;
        "et")
            printf "Mallinimi ei tohi olla tühi.";;
        "fi")
            printf "Mallin nimi ei saa olla tyhjä.";;
        "sv")
            printf "Mallnamnet får inte vara tomt.";;
        "nb" | "nn" | "no")
            printf "Malnavnet skal ikke være tomt.";;
        "tr")
            printf "Şablon adı boş bırakılmamalıdır.";;
        "uk")
            printf "Ім'я шаблону не повинно бути порожнім.";;
        "is")
            printf "Sniðmát heiti ætti ekki að vera autt.";;
        "el")
            printf "Το όνομα προτύπου δεν πρέπει να είναι κενό.";;
        "hu")
            printf "A sablon neve nem lehet üres.";;
        "da")
            printf "Skabelonnavn bør ikke være tomt.";;
        *)
            printf "Template name should not be empty.";;
    esac
}

function str_select_template_to_edit()
{
    case "$first_locale" in
        "es")
            printf "Seleccione la plantilla que desee editar:";;
        "fr")
            printf "Sélectionnez le modèle que vous souhaitez modifier:";;
        "it")
            printf "Seleziona il modello che vuoi modificare:";;
        "de")
            printf "Wählen Sie die Vorlage aus, die Sie bearbeiten möchten:";;
        "pt")
            printf "Selecione o modelo que deseja editar:";;
        "ru")
            printf "Выберите шаблон, который хотите отредактировать:";;
        "nl")
            printf "Selecteer de sjabloon die u wilt bewerken:";;
        "cs")
            printf "Vyberte šablonu, kterou chcete upravit:";;
        "pl")
            printf "Wybierz szablon, który chcesz edytować:";;
        "ro")
            printf "Selectați șablonul pe care doriți să îl editați:";;
        "et")
            printf "Valige mall, mida soovite muuta:";;
        "fi")
            printf "Valitse muokattava malli:";;
        "sv")
            printf "Välj mallen du vill redigera:";;
        "nb" | "nn" | "no")
            printf "Velg malen du vil redigere:";;
        "tr")
            printf "Düzenlemek istediğiniz şablonu seçin:";;
        "uk")
            printf "Виберіть шаблон, який потрібно редагувати:";;
        "is")
            printf "Veldu sniðmát sem þú vilt breyta:";;
        "el")
            printf "Επιλέξτε το πρότυπο που θέλετε να επεξεργαστείτε:";;
        "hu")
            printf "Válassza ki a szerkeszteni kívánt sablont:";;
        "da")
            printf "Vælg den skabelon, du vil redigere:";;
        *)
            printf "Select the template you want to edit:";;
    esac
}

function str_select_property_to_edit()
{
    case "$first_locale" in
        "es")
            printf "Elija la acción que desea realizar.<br>Puede guardar los cambios para conservarlos o descartarlos haciendo click en <i>Cancelar</i>.";;
        "fr")
            printf "Choisissez l'action que vous souhaitez effectuer.<br>Vous pouvez enregistrer les modifications pour les conserver ou les annuler en cliquant sur <i>Annuler</i>.";;
        "it")
            printf "Scegli l'azione che desideri eseguire.<br>Puoi salvare le modifiche per conservarle o eliminarle facendo clic su <i>Annulla</i>.";;
        "de")
            printf "Wählen Sie die Aktion aus, die Sie ausführen möchten.<br>Sie können die Änderungen speichern, um sie beizubehalten, oder sie verwerfen, indem Sie auf <i>Abbrechen</i> klicken.";;
        "pt")
            printf "Escolha a ação que deseja executar.<br>Você pode salvar as alterações para mantê-las ou descartá-las clicando em <i>Cancelar</i>.";;
        "ru")
            printf "Выберите действие, которое вы хотите выполнить.<br>Вы можете сохранить изменения или отменить их, нажав <i>Отмена</i>.";;
        "nl")
            printf "Kies de actie die u wilt uitvoeren.<br>U kunt de wijzigingen opslaan om ze te behouden of ze verwijderen door op <i>Annuleren</i> te klikken.";;
        "cs")
            printf "Vyberte akci, kterou chcete provést.<br>Změny můžete uložit, abyste je uchovali, nebo je zahodit kliknutím na <i>Zrušit</i>.";;
        "pl")
            printf "Wybierz czynność, którą chcesz wykonać.<br>Możesz zapisać zmiany, aby je zachować, lub odrzucić je, klikając <i>Anuluj</i>.";;
        "ro")
            printf "Alegeți acțiunea pe care doriți să o efectuați.<br>Puteți salva modificările pentru a le păstra sau le puteți renunța făcând clic pe <i>Anulare</i>.";;
        "et")
            printf "Valige toiming, mida soovite teha.<br>Muudatuste säilitamiseks võite muudatused salvestada või neist loobuda, klõpsates nuppu <i>Tühista</i>.";;
        "fi")
            printf "Valitse suoritettava toiminto.<br>Voit tallentaa muutokset säilyttääksesi ne tai hylätä ne napsauttamalla <i>Peruuta</i>.";;
        "sv")
            printf "Välj den åtgärd du vill utföra.<br>Du kan spara ändringarna för att behålla dem eller kasta dem genom att klicka på <i>Avbryt</i>.";;
        "nb" | "nn" | "no")
            printf "Velg handlingen du vil utføre.<br>Du kan lagre endringene for å beholde dem eller forkaste dem ved å klikke på <i>Avbryt</i>.";;
        "tr")
            printf "Gerçekleştirmek istediğiniz eylemi seçin.<br>Değişiklikleri saklamak için kaydedebilir veya <i>İptal</i>'i tıklayarak iptal edebilirsiniz.";;
        "uk")
            printf "Виберіть дію, яку хочете виконати.<br>Ви можете зберегти зміни, щоб зберегти їх, або відхилити, натиснувши <i>Скасувати</i>.";;
        "is")
            printf "Veldu aðgerðina sem þú vilt framkvæma.<br>Þú getur vistað breytingarnar til að halda þeim eða fargað þeim með því að smella á <i>Hætta við</i>.";;
        "el")
            printf "Επιλέξτε την ενέργεια που θέλετε να εκτελέσετε.<br>Μπορείτε να αποθηκεύσετε τις αλλαγές για να τις διατηρήσετε ή να τις απορρίψετε κάνοντας κλικ στο <i>Ακύρωση</i>.";;
        "hu")
            printf "Válassza ki a végrehajtani kívánt műveletet.<br>A módosításokat elmentheti, hogy megtartsa őket, vagy elvetheti őket a <i>Mégse</i> gombra kattintva.";;
        "da")
            printf "Vælg den handling, du vil udføre.<br>Du kan gemme ændringerne for at beholde dem eller kassere dem ved at klikke på <i>Annuller</i>.";;
        *)
            printf "Choose the action you want to perform.<br>You can save the changes to keep them or discard them by clicking on <i>Cancel</i>.";;
    esac
}

function str_edit_name()
{
    case "$first_locale" in
        "es")
            printf "Editar nombre";;
        "fr")
            printf "Modifier le nom";;
        "it")
            printf "Modifica nome";;
        "de")
            printf "Namen bearbeiten";;
        "pt")
            printf "Editar nome";;
        "ru")
            printf "Редактировать название";;
        "nl")
            printf "Naam bewerken";;
        "cs")
            printf "Upravit jméno";;
        "pl")
            printf "Zmień imię";;
        "ro")
            printf "Editeaza numele";;
        "et")
            printf "Muuda nime";;
        "fi")
            printf "Muokkaa nimeä";;
        "sv")
            printf "Redigera namn";;
        "nb" | "nn" | "no")
            printf "Rediger navn";;
        "tr")
            printf "Adı düzenle";;
        "uk")
            printf "Редагувати ім'я";;
        "is")
            printf "Breyttu nafni";;
        "el")
            printf "Επεξεργασία ονόματος";;
        "hu")
            printf "Név szerkesztése";;
        "da")
            printf "Rediger navn";;
        *)
            printf "Edit name";;
    esac
}

function str_edit_comment()
{
    case "$first_locale" in
        "es")
            printf "Editar comentario";;
        "fr")
            printf "Modifier le commentaire";;
        "it")
            printf "Modifica commento";;
        "de")
            printf "Kommentar bearbeiten";;
        "pt")
            printf "Editar comentário";;
        "ru")
            printf "Редактировать комментарий";;
        "nl")
            printf "Reactie bewerken";;
        "cs")
            printf "Upravit komentář";;
        "pl")
            printf "Edytuj komentarz";;
        "ro")
            printf "Editați comentariul";;
        "et")
            printf "Muuda kommentaari";;
        "fi")
            printf "Muokkaa kommenttia";;
        "sv")
            printf "Redigera kommentar";;
        "nb" | "nn" | "no")
            printf "Rediger kommentar";;
        "tr")
            printf "Yorumu düzenle";;
        "uk")
            printf "Редагувати коментар";;
        "is")
            printf "Breyta athugasemd";;
        "el")
            printf "Επεξεργασία σχολίου";;
        "hu")
            printf "Megjegyzés szerkesztése";;
        "da")
            printf "Rediger kommentar";;
        *)
            printf "Edit comment";;
    esac
}

function str_edit_icon()
{
    case "$first_locale" in
        "es")
            printf "Editar icono";;
        "fr")
            printf "Modifier l'icône";;
        "it")
            printf "Modifica l'icona";;
        "de")
            printf "Bearbeiten Sie das Symbol";;
        "pt")
            printf "Edite o ícone";;
        "ru")
            printf "Отредактируйте значок";;
        "nl")
            printf "Bewerk het pictogram";;
        "cs")
            printf "Upravte ikonu";;
        "pl")
            printf "Edytuj ikonę";;
        "ro")
            printf "Editați pictograma";;
        "et")
            printf "Muutke ikooni";;
        "fi")
            printf "Muokkaa kuvaketta";;
        "sv")
            printf "Redigera ikonen";;
        "nb" | "nn" | "no")
            printf "Rediger ikonet";;
        "tr")
            printf "Simgeyi düzenle";;
        "uk")
            printf "Відредагуйте піктограму";;
        "is")
            printf "Breyttu tákninu";;
        "el")
            printf "Επεξεργαστείτε το εικονίδιο";;
        "hu")
            printf "Szerkessze az ikont";;
        "da")
            printf "Rediger ikonet";;
        *)
            printf "Edit icon";;
    esac
}

function str_save_and_exit()
{
    case "$first_locale" in
        "es")
            printf "Guardar y salir";;
        "fr")
            printf "Sauvegarder et quitter";;
        "it")
            printf "Salva ed esci";;
        "de")
            printf "Speichern und schließen";;
        "pt")
            printf "Salvar e sair";;
        "ru")
            printf "Сохранить и выйти";;
        "nl")
            printf "Opslaan en afsluiten";;
        "cs")
            printf "Uložit a odejít";;
        "pl")
            printf "Zapisz i wyjdź";;
        "ro")
            printf "Salvează și ieși";;
        "et")
            printf "Salvesta ja välju";;
        "fi")
            printf "Tallenna ja poistu";;
        "sv")
            printf "Spara och avsluta";;
        "nb" | "nn" | "no")
            printf "Lagre og lukk";;
        "tr")
            printf "Kaydet ve çık";;
        "uk")
            printf "Зберегти та вийти";;
        "is")
            printf "Vista og hætta";;
        "el")
            printf "Αποθήκευση και έξοδος";;
        "hu")
            printf "Mentés és kilépés";;
        "da")
            printf "Gem og luk";;
        *)
            printf "Save and exit";;
    esac
}

function str_edited_template()
{
    case "$first_locale" in
        "es")
            printf "Plantilla modificada con éxito.";;
        "fr")
            printf "Modèle modifié avec succès.";;
        "it")
            printf "Modello modificato con successo.";;
        "de")
            printf "Vorlage erfolgreich geändert.";;
        "pt")
            printf "Modelo editado com sucesso.";;
        "ru")
            printf "Шаблон успешно отредактирован.";;
        "nl")
            printf "Sjabloon succesvol bewerkt.";;
        "cs")
            printf "Šablona byla úspěšně upravena.";;
        "pl")
            printf "Pomyślnie edytowano szablon.";;
        "ro")
            printf "Șablonul a fost editat cu succes.";;
        "et")
            printf "Mall on edukalt muudetud.";;
        "fi")
            printf "Mallin muokkaus onnistui.";;
        "sv")
            printf "Mall redigerades framgångsrikt.";;
        "nb" | "nn" | "no")
            printf "Malen ble redigert.";;
        "tr")
            printf "Şablon başarıyla düzenlendi.";;
        "uk")
            printf "Шаблон успішно відредаговано.";;
        "is")
            printf "Sniðmáti breytt.";;
        "el")
            printf "Η επεξεργασία του προτύπου ολοκληρώθηκε με επιτυχία.";;
        "hu")
            printf "A sablon szerkesztése sikeres volt.";;
        "da")
            printf "Skabelonen blev redigeret.";;
        *)
            printf "Template edited successfully.";;
    esac
}

function str_exists_template_with_same_name()
{
    case "$first_locale" in
        "es")
            printf "Ya existe una plantilla con el mismo nombre. Por favor, pruebe con otro.";;
        "fr")
            printf "Il existe un modèle existant avec exactement le même. S'il vous plaît, essayez-en un autre.";;
        "it")
            printf "C'è un modello esistente con esattamente lo stesso. Per favore, provane un altro.";;
        "de")
            printf "Es gibt eine vorhandene Vorlage mit genau der gleichen. Bitte versuchen Sie es mit einem anderen.";;
        "pt")
            printf "Existe um modelo existente com exatamente o mesmo. Por favor, tente outro.";;
        "ru")
            printf "Есть существующий шаблон с точно таким же. Пожалуйста, попробуйте другой.";;
        "nl")
            printf "Er is een bestaande sjabloon met precies hetzelfde. Probeer een andere.";;
        "cs")
            printf "Existuje existující šablona s přesně stejnou. Zkuste prosím jiný.";;
        "pl")
            printf "Istnieje szablon z dokładnie tym samym. Proszę, spróbuj innego.";;
        "ro")
            printf "Există un șablon existent cu exact același lucru. Vă rog, încercați altul.";;
        "et")
            printf "Olemasolev mall täpselt sama. Palun proovige mõnda muud.";;
        "fi")
            printf "Olemassa oleva malli, jossa on täsmälleen sama. Yritä toista.";;
        "sv")
            printf "Det finns en befintlig mall med exakt samma. Snälla, prova en annan.";;
        "nb" | "nn" | "no")
            printf "Der en eksisterende mal med nøyaktig den samme. Vær så snill, prøv en annen.";;
        "tr")
            printf "Tam olarak aynı olan mevcut bir şablon var. Lütfen, başka bir tane deneyin.";;
        "uk")
            printf "Існує існуючий шаблон із абсолютно однаковим. Будь ласка, спробуйте інший.";;
        "is")
            printf "Þar er núverandi sniðmát með nákvæmlega það sama. Vinsamlegast reyndu annað.";;
        "el")
            printf "Υπάρχει ένα υπάρχον πρότυπο με ακριβώς το ίδιο. Παρακαλώ, δοκιμάστε ένα άλλο.";;
        "hu")
            printf "Van egy létező sablon pontosan ugyanazzal. Kérjük, próbálkozzon másikkal.";;
        "da")
            printf "Der er en eksisterende skabelon med nøjagtig den samme. Prøv en anden.";;
        *)
            printf "There an existing template with exactly the same same. Please, try another.";;
    esac
}

function str_open_current_template()
{
    case "$first_locale" in
        "es")
            printf "Abrir plantilla actual";;
        "fr")
            printf "Ouvrir le modèle actuel";;
        "it")
            printf "Apri il modello corrente";;
        "de")
            printf "Aktuelle Vorlage öffnen";;
        "pt")
            printf "Abra o modelo atual";;
        "ru")
            printf "Открыть текущий шаблон";;
        "nl")
            printf "Huidige sjabloon openen";;
        "cs")
            printf "Otevřít aktuální šablonu";;
        "pl")
            printf "Otwórz aktualny szablon";;
        "ro")
            printf "Deschideți șablonul curent";;
        "et")
            printf "Ava praegune mall";;
        "fi")
            printf "Avaa nykyinen malli";;
        "sv")
            printf "Åpne gjeldende mal";;
        "nb" | "nn" | "no")
            printf "Åpne gjeldende mal";;
        "tr")
            printf "Geçerli şablonu aç";;
        "uk")
            printf "Відкрити поточний шаблон";;
        "is")
            printf "Opnaðu núverandi sniðmát";;
        "el")
            printf "Ανοίξτε το τρέχον πρότυπο";;
        "hu")
            printf "Nyissa meg az aktuális sablont";;
        "da")
            printf "Åbn den aktuelle skabelon";;
        *)
            printf "Open current template";;
    esac
}

function str_update_template()
{
    case "$first_locale" in
        "es")
            printf "Actualizar plantilla con un nuevo archivo o directorio";;
        "fr")
            printf "Mettre à jour le modèle avec un nouveau fichier ou répertoire";;
        "it")
            printf "Aggiorna il modello con un nuovo file o directory";;
        "de")
            printf "Vorlage mit neuer Datei oder Verzeichnis aktualisieren";;
        "pt")
            printf "Atualizar modelo com novo arquivo ou diretório";;
        "ru")
            printf "Обновить шаблон с новым файлом или каталогом";;
        "nl")
            printf "Sjabloon bijwerken met nieuw bestand of nieuwe map";;
        "cs")
            printf "Aktualizujte šablonu o nový soubor nebo adresář";;
        "pl")
            printf "Zaktualizuj szablon o nowy plik lub katalog";;
        "ro")
            printf "Actualizați șablonul cu fișier sau director nou";;
        "et")
            printf "Värskendage malli uue faili või kataloogiga";;
        "fi")
            printf "Päivitä malli uudella tiedostolla tai hakemistolla";;
        "sv")
            printf "Uppdatera mall med ny fil eller katalog";;
        "nb" | "nn" | "no")
            printf "Oppdater mal med ny fil eller katalog";;
        "tr")
            printf "Şablonu yeni dosya veya dizinle güncelleyin";;
        "uk")
            printf "Оновити шаблон новим файлом або каталогом";;
        "is")
            printf "Uppfærðu sniðmát með nýrri skrá eða möppu";;
        "el")
            printf "Ενημέρωση προτύπου με νέο αρχείο ή κατάλογο";;
        "hu")
            printf "Frissítse a sablont új fájllal vagy könyvtárral";;
        "da")
            printf "Opdater skabelon med ny fil eller mappe";;
        *)
            printf "Update template with new file or directory";;
    esac
}

function str_discard_new_template()
{
    case "$first_locale" in
        "es")
            printf "Descartar el nuevo archivo o directorio de plantilla";;
        "fr")
            printf "Supprimer le nouveau fichier modèle ou répertoire";;
        "it")
            printf "Elimina nuovo file modello o directory";;
        "de")
            printf "Neue Vorlagendatei oder neues Verzeichnis verwerfen";;
        "pt")
            printf "Descartar novo arquivo ou diretório de modelo";;
        "ru")
            printf "Отменить новый файл или каталог шаблона";;
        "nl")
            printf "Nieuw sjabloonbestand of nieuwe map verwijderen";;
        "cs")
            printf "Zlikvidujte nový soubor šablony nebo adresář";;
        "pl")
            printf "Odrzuć nowy plik szablonu lub katalog";;
        "ro")
            printf "Aruncați fișierul sau directorul șablon nou";;
        "et")
            printf "Visake uus mallifail või kataloog minema";;
        "fi")
            printf "Hylkää uusi mallitiedosto tai hakemisto";;
        "sv")
            printf "Kasta ny mallfil eller katalog";;
        "nb" | "nn" | "no")
            printf "Kast ny malfil eller katalog";;
        "tr")
            printf "Yeni şablon dosyasını veya dizini atın";;
        "uk")
            printf "Dobja el az új sablonfájlt vagy könyvtárat";;
        "is")
            printf "Fargaðu nýrri sniðmátaskrá eða möppu";;
        "el")
            printf "Απορρίψτε νέο αρχείο προτύπου ή κατάλογο";;
        "hu")
            printf "Dobja el az új sablonfájlt vagy könyvtárat";;
        "da")
            printf "Kasser ny skabelonfil eller mappe";;
        *)
            printf "Discard new template file or directory";;
    esac
}

function str_open_new_template()
{
    case "$first_locale" in
        "es")
            printf "Abrir nueva plantilla";;
        "fr")
            printf "Ouvrir nouveau modèle";;
        "it")
            printf "Apri nuovo modello";;
        "de")
            printf "Neue Vorlage öffnen";;
        "pt")
            printf "Abrir novo modelo";;
        "ru")
            printf "Открыть новый шаблон";;
        "nl")
            printf "Nieuwe sjabloon openen";;
        "cs")
            printf "Otevřít novou šablonu";;
        "pl")
            printf "Otwórz nowy szablon";;
        "ro")
            printf "Deschideți un șablon nou";;
        "et")
            printf "Ava uus mall";;
        "fi")
            printf "Avaa uusi malli";;
        "sv")
            printf "Öppna ny mall";;
        "nb" | "nn" | "no")
            printf "Åpne ny mal";;
        "tr")
            printf "Yeni şablon aç";;
        "uk")
            printf "Відкрити новий шаблон";;
        "is")
            printf "Opnaðu nýtt sniðmát";;
        "el")
            printf "Άνοιγμα νέου προτύπου";;
        "hu")
            printf "Új sablon megnyitása";;
        "da")
            printf "Åbn ny skabelon";;
        *)
            printf "Open new template";;
    esac
}

function str_select_new_template_type()
{
    case "$first_locale" in
        "es")
            printf "Seleccione el tipo de la nueva fuente de plantilla.";;
        "fr")
            printf "Sélectionnez le type de la nouvelle source de modèle.";;
        "it")
            printf "Seleziona il tipo della nuova origine del modello.";;
        "de")
            printf "Wählen Sie den Typ der neuen Vorlagenquelle aus.";;
        "pt")
            printf "Selecione o tipo da nova fonte de modelo.";;
        "ru")
            printf "Выберите тип нового источника шаблона.";;
        "nl")
            printf "Selecteer het type van de nieuwe sjabloonbron.";;
        "cs")
            printf "Vyberte typ nového zdroje šablony.";;
        "pl")
            printf "Wybierz typ nowego źródła szablonu.";;
        "ro")
            printf "Selectați tipul sursei noului șablon.";;
        "et")
            printf "Valige uue malli allika tüüp.";;
        "fi")
            printf "Valitse uuden mallilähteen tyyppi.";;
        "sv")
            printf "Välj typen av den nya mallkällan.";;
        "nb" | "nn" | "no")
            printf "Velg typen for den nye malkilden.";;
        "tr")
            printf "Yeni şablon kaynağının türünü seçin.";;
        "uk")
            printf "Виберіть тип нового джерела шаблону.";;
        "is")
            printf "Veldu gerð nýju sniðmátagjafans.";;
        "el")
            printf "Επιλέξτε τον τύπο της νέας πηγής προτύπου.";;
        "hu")
            printf "Válassza ki az új sablonforrás típusát.";;
        "da")
            printf "Vælg typen af den nye skabelonkilde.";;
        *)
            printf "Select the type of the new template source.";;
    esac
}

function str_file()
{
    case "$first_locale" in
        "es")
            printf "Archivo";;
        "fr")
            printf "Fichier";;
        "it")
            printf "File";;
        "de")
            printf "Datei";;
        "pt")
            printf "Arquivo";;
        "ru")
            printf "Файл";;
        "nl")
            printf "Het dossier";;
        "cs")
            printf "Soubor";;
        "pl")
            printf "Plik";;
        "ro")
            printf "Fişier";;
        "et")
            printf "Fail";;
        "fi")
            printf "Tiedosto";;
        "sv")
            printf "Fil";;
        "nb" | "nn" | "no")
            printf "Fil";;
        "tr")
            printf "Dosya";;
        "uk")
            printf "Файл";;
        "is")
            printf "Skrá";;
        "el")
            printf "Αρχείο";;
        "hu")
            printf "File";;
        "da")
            printf "Fil";;
        *)
            printf "File";;
    esac
}

function str_directory()
{
    case "$first_locale" in
        "es")
            printf "Directorio";;
        "fr")
            printf "Directoire";;
        "it")
            printf "Directory";;
        "de")
            printf "Verzeichnis";;
        "pt")
            printf "Diretório";;
        "ru")
            printf "Каталог";;
        "nl")
            printf "Directory";;
        "cs")
            printf "Adresář";;
        "pl")
            printf "Informator";;
        "ro")
            printf "Director";;
        "et")
            printf "Kataloog";;
        "fi")
            printf "Hakemisto";;
        "sv")
            printf "Katalog";;
        "nb" | "nn" | "no")
            printf "Katalog";;
        "tr")
            printf "Dizin";;
        "uk")
            printf "Каталог";;
        "is")
            printf "Mappa";;
        "el")
            printf "Ευρετήριο";;
        "hu")
            printf "Könyvtár";;
        "da")
            printf "Vejviser";;
        *)
            printf "Directory";;
    esac
}

function str_backup_confirmation()
{
    case "$first_locale" in
        "es")
            printf "¿Desearía hacer una copia de seguridad de la plantilla anterior?";;
        "fr")
            printf "Souhaitez-vous faire une sauvegarde du dernier modèle?";;
        "it")
            printf "Vuoi fare un backup dell'ultimo modello?";;
        "de")
            printf "Möchten Sie ein Backup der letzten Vorlage erstellen?";;
        "pt")
            printf "Você gostaria de fazer um backup do último modelo?";;
        "ru")
            printf "Хотите сделать резервную копию последнего шаблона?";;
        "nl")
            printf "Wilt u een back-up maken van het laatste sjabloon?";;
        "cs")
            printf "Chcete vytvořit zálohu poslední šablony?";;
        "pl")
            printf "Czy chcesz zrobić kopię zapasową ostatniego szablonu?";;
        "ro")
            printf "Doriți să faceți o copie de rezervă a ultimului șablon?";;
        "et")
            printf "Kas soovite teha viimase malli varukoopia?";;
        "fi")
            printf "Haluatko tehdä varmuuskopion viimeisestä mallista?";;
        "sv")
            printf "Vill du göra en säkerhetskopia av den sista mallen?";;
        "nb" | "nn" | "no")
            printf "Vil du ta en sikkerhetskopi av den siste malen?";;
        "tr")
            printf "Son şablonun bir yedeğini almak ister misiniz?";;
        "uk")
            printf "Хочете зробити резервну копію останнього шаблону?";;
        "is")
            printf "Viltu taka afrit af síðasta sniðmátinu?";;
        "el")
            printf "Θέλετε να δημιουργήσετε αντίγραφο ασφαλείας του τελευταίου προτύπου?";;
        "hu")
            printf "Szeretne biztonsági másolatot készíteni az utolsó sablonról?";;
        "da")
            printf "Vil du tage en sikkerhedskopi af den sidste skabelon?";;
        *)
            printf "Would you like to make a backup of the last template?";;
    esac
}

# endregion

# region TemplateEraser

function str_no_available_templates()
{
    case "$first_locale" in
        "es")
            printf "No hay plantillas disponibles.";;
        "fr")
            printf "Il n'y a pas de modèles disponibles.";;
        "it")
            printf "Non ci sono modelli disponibili.";;
        "de")
            printf "Es sind keine Vorlagen verfügbar.";;
        "pt")
            printf "Não existem modelos disponíveis.";;
        "ru")
            printf "Нет доступных шаблонов.";;
        "nl")
            printf "Er zijn geen sjablonen beschikbaar.";;
        "cs")
            printf "Nejsou k dispozici žádné šablony.";;
        "pl")
            printf "Brak dostępnych szablonów.";;
        "ro")
            printf "Nu există șabloane disponibile.";;
        "et")
            printf "Malle pole saadaval.";;
        "fi")
            printf "Ei ole käytettävissä malleja.";;
        "sv")
            printf "Det finns inga tillgängliga mallar.";;
        "nb" | "nn" | "no")
            printf "Det er ingen tilgjengelige maler.";;
        "tr")
            printf "Kullanılabilir şablon yok.";;
        "uk")
            printf "Немає доступних шаблонів.";;
        "is")
            printf "Engin sniðmát eru til.";;
        "el")
            printf "Δεν υπάρχουν διαθέσιμα πρότυπα.";;
        "hu")
            printf "Nincsenek elérhető sablonok.";;
        "da")
            printf "Der er ingen tilgængelige skabeloner.";;
        *)
            printf "There are no available templates.";;
    esac
}

function str_select_templates_to_remove()
{
    case "$first_locale" in
        "es")
            printf "Selecciona la(s) plantilla(s) que desee eliminar:";;
        "fr")
            printf "Sélectionnez le(s) modèle(s) que vous souhaitez supprimer:";;
        "it")
            printf "Seleziona i modello/i che desideri rimuovere:";;
        "de")
            printf "Wählen Sie die Vorlagen aus, die Sie entfernen möchten:";;
        "pt")
            printf "Selecione o(s) modelo(s) que deseja remover:";;
        "ru")
            printf "Выберите шаблон (ы), который вы хотите удалить:";;
        "nl")
            printf "Selecteer één of meerdere te verwijderen sjablonen:";;
        "cs")
            printf "Vyberte šablony, které chcete odebrat:";;
        "pl")
            printf "Wybierz szablony, które chcesz usunąć:";;
        "ro")
            printf "Wybierz szablony, które chcesz usunąć:";;
        "et")
            printf "Valige mallid, mille soovite eemaldada:";;
        "fi")
            printf "Valitse poistettavat mallit:";;
        "sv")
            printf "Välj de mallar du vill ta bort:";;
        "nb" | "nn" | "no")
            printf "Velg malene du vil fjerne:";;
        "tr")
            printf "Kaldırmak istediğiniz şablonları seçin:";;
        "uk")
            printf "Виберіть шаблон (шаблони), який ви хочете видалити:";;
        "is")
            printf "Veldu sniðmátin sem þú vilt fjarlægja:";;
        "el")
            printf "Επιλέξτε τα πρότυπα που θέλετε να καταργήσετε:";;
        "hu")
            printf "Válassza ki az eltávolítani kívánt sablon (oka) t:";;
        "da")
            printf "Vælg den eller de skabeloner, du vil fjerne:";;
        *)
            printf "Select the template(s) you want to remove:";;
    esac
}

function str_remove_confirmation()
{
    case "$first_locale" in
        "es")
            printf "¿Estás seguro de que deseas eliminar las siguientes plantillas? Esta acción no se podrá deshacer.<br>";;
        "fr")
            printf "Voulez-vous vraiment supprimer les prochains modèles? Cette action ne peut pas être annulée.<br>";;
        "it")
            printf "Sei sicuro di voler rimuovere i modelli successivi? Questa operazione non può essere annullata.<br>";;
        "de")
            printf "Möchten Sie die nächsten Vorlagen wirklich entfernen? Diese Aktion kann nicht rückgängig gemacht werden.<br>";;
        "pt")
            printf "Tem certeza que deseja remover os próximos modelos? Esta ação não pode ser desfeita.<br>";;
        "ru")
            printf "Вы уверены, что хотите удалить следующие шаблоны? Это действие нельзя отменить.<br>";;
        "nl")
            printf "Weet u zeker dat u de volgende sjablonen wilt verwijderen? Dit kan niet ongedaan worden gemaakt.<br>";;
        "cs")
            printf "Opravdu chcete odebrat další šablony? Tuto akci nelze vrátit zpět.<br>";;
        "pl")
            printf "Czy na pewno chcesz usunąć kolejne szablony? Tej czynności nie można cofnąć.<br>";;
        "ro")
            printf "Sigur doriți să eliminați următoarele șabloane? Această acțiune nu poate fi anulată.<br>";;
        "et")
            printf "Kas soovite kindlasti järgmised mallid eemaldada? Seda toimingut ei saa tagasi võtta.<br>";;
        "fi")
            printf "Haluatko varmasti poistaa seuraavat mallit? Tätä toimintoa ei voi kumota.<br>";;
        "sv")
            printf "Är du säker på att du vill ta bort nästa mallar? Den här åtgärden kan inte ångras.<br>";;
        "nb" | "nn" | "no")
            printf "Er du sikker på at du vil fjerne neste maler? Denne handlingen kan ikke angres.<br>";;
        "tr")
            printf "Sonraki şablonları kaldırmak istediğinizden emin misiniz? Bu işlem geri alınamaz.<br>";;
        "uk")
            printf "Ви впевнені, що хочете видалити наступні шаблони? Цю дію не можна скасувати.<br>";;
        "is")
            printf "Ertu viss um að þú viljir fjarlægja næstu sniðmát? Ekki er hægt að afturkalla þessa aðgerð.<br>";;
        "el")
            printf "Είστε βέβαιοι ότι θέλετε να καταργήσετε τα επόμενα πρότυπα? Δεν είναι δυνατή η αναίρεση αυτής της ενέργειας.<br>";;
        "hu")
            printf "Biztosan eltávolítja a következő sablonokat? Ezt a műveletet nem lehet visszavonni.<br>";;
        "da")
            printf "Er du sikker på, at du vil fjerne de næste skabeloner? Denne handling kan ikke fortrydes.<br>";;
        *)
            printf "Are you sure you want to remove next templates? This action cannot be undone.<br>";;
    esac
}

function str_removed_templates()
{
    case "$first_locale" in
        "es")
            printf "Las siguientes plantillas fueron eliminadas:<br>";;
        "fr")
            printf "Les modèles suivants ont été supprimés:<br>";;
        "it")
            printf "I modelli successivi sono stati rimossi:<br>";;
        "de")
            printf "Die nächsten Vorlagen wurden entfernt:<br>";;
        "pt")
            printf "Os próximos modelos foram removidos:<br>";;
        "ru")
            printf "Следующие шаблоны были удалены:<br>";;
        "nl")
            printf "De volgende sjablonen zijn verwijderd:<br>";;
        "cs")
            printf "Byly odstraněny další šablony:<br>";;
        "pl")
            printf "Kolejne szablony zostały usunięte:<br>";;
        "ro")
            printf "Următoarele șabloane au fost eliminate:<br>";;
        "et")
            printf "Järgmised mallid eemaldati:<br>";;
        "fi")
            printf "Seuraavat mallit poistettiin:<br>";;
        "sv")
            printf "Nästa mallar togs bort:<br>";;
        "nb" | "nn" | "no")
            printf "Neste maler ble fjernet:<br>";;
        "tr")
            printf "Sonraki şablonlar kaldırıldı:<br>";;
        "uk")
            printf "Наступні шаблони були видалені:<br>";;
        "is")
            printf "Næstu sniðmát voru fjarlægð:<br>";;
        "el")
            printf "Τα επόμενα πρότυπα καταργήθηκαν:<br>";;
        "hu")
            printf "A következő sablonokat eltávolítottuk:<br>";;
        "da")
            printf "Næste skabeloner blev fjernet:<br>";;
        *)
            printf "Next templates were removed:<br>";;
    esac
}

# endregion