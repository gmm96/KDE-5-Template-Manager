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
        "tr")
            echo "Şablon yöneticisi";;
        "uk")
            echo "Менеджер шаблонів";;
        "is")
            echo "Sniðmátastjóri";;
        "el")
            echo "Διαχειριστής προτύπων";;
        "hu")
            echo "Sablonkezelő";;
        "da")
            echo "Skabelonadministrator";;
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
        "tr")
            echo "İşlem kullanıcı tarafından iptal edildi.";;
        "uk")
            echo "Операцію скасовано користувачем.";;
        "is")
            echo "Aðgerð hætt við af notanda.";;
        "el")
            echo "Η λειτουργία ακυρώθηκε από τον χρήστη.";;
        "hu")
            echo "A műveletet a felhasználó törölte.";;
        "da")
            echo "Drift annulleret af brugeren.";;
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
        "tr")
            echo "Bu dosya veya dizinden şablon oluşturulamıyor.";;
        "uk")
            echo "Не вдається створити шаблон із цього файлу або каталогу.";;
        "is")
            echo "Get ekki búið til sniðmát úr þessari skrá eða möppu.";;
        "el")
            echo "Δεν είναι δυνατή η δημιουργία προτύπου από αυτό το αρχείο ή κατάλογο.";;
        "hu")
            echo "Nem lehet sablont készíteni ebből a fájlból vagy könyvtárból.";;
        "da")
            echo "Kan ikke oprette skabelon fra denne fil eller bibliotek.";;
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
        "tr")
            echo "Lütfen bir şablon adı girin.<br>Boşsa, orijinal dosya adını alacaktır.";;
        "uk")
            echo "Будь ласка, введіть назву шаблону.<br>Якщо пусте, воно буде мати оригінальне ім’я файлу.";;
        "is")
            echo "Vinsamlegast sláðu inn heiti sniðmáts.<br>Ef það er autt tekur það upprunalega skráarheitið.";;
        "el")
            echo "Εισαγάγετε ένα όνομα προτύπου.<br>Εάν είναι κενό, θα πάρει το αρχικό όνομα αρχείου.";;
        "hu")
            echo "Kérjük, írja be a sablon nevét.<br>Ha üres, akkor az eredeti fájlnév lesz.";;
        "da")
            echo "Indtast venligst et skabelonnavn.<br>Hvis det er tomt, tager det det originale filnavn.";;
        *)
            echo "Please, enter a template name.<br>If empty, it will take the original filename.";;
    esac
}

function str_get_comment()
{
    case "$first_locale" in
        "es")
            echo "Por favor, introduzca un comentario para la plantilla.<br>Se mostrará como sugerencia en el de diálogo de creación de un nuevo archivo, donde usted elige su nombre.";;
        "fr")
            echo "S'il vous plaît, entrez un commentaire sur le modèle.<br>Il sera affiché comme indice dans la boîte de dialogue de création de nouveau fichier, où vous choisissez son nom de fichier.";;
        "it")
            echo "Per favore, inserisci il commento del modello.<br>Verrà visualizzato come suggerimento nella finestra di dialogo di creazione del nuovo file, dove scegli il nome del file.";;
        "de")
            echo "Bitte geben Sie einen Kommentar zur Vorlage ein.<br>Er wird als Hinweis im Dialogfeld zum Erstellen neuer Dateien angezeigt, in dem Sie den Dateinamen auswählen.";;
        "pt")
            echo "Por favor, insira o comentário do modelo.<br>Ele será exibido como uma dica na caixa de diálogo de criação de novo arquivo, onde você escolhe o nome do arquivo.";;
        "ru")
            echo "Пожалуйста, введите комментарий к шаблону.<br>Он будет отображаться как подсказка в диалоге создания нового файла, где вы выбираете его имя.";;
        "nl")
            echo "Voer een sjabloonopmerking in.<br>Het wordt weergegeven als hint in het dialoogvenster voor het maken van nieuwe bestanden, waar u de bestandsnaam kiest.";;
        "cs")
            echo "Zadejte prosím komentář šablony.<br>Zobrazí se jako nápověda v novém dialogu pro vytvoření souboru, kde zvolíte jeho název souboru.";;
        "pl")
            echo "Proszę wpisać komentarz do szablonu.<br>Będzie on wyświetlany jako podpowiedź w oknie tworzenia nowego pliku, gdzie wybierasz jego nazwę.";;
        "ro")
            echo "Vă rugăm, introduceți comentariul șablon.<br>Acesta va fi afișat ca indiciu în dialogul de creare a fișierelor noi, unde alegeți numele acestuia.";;
        "et")
            echo "Sisestage palun malli kommentaar.<br>Seda kuvatakse vihjena uues faili loomise dialoogis, kus valite selle failinime.";;
        "fi")
            echo "Anna mallikommentti.<br>Se näkyy vihjeenä uudessa tiedostonluonti-valintaikkunassa, jossa valitset sen tiedostonimen.";;
        "sv")
            echo "Vänligen ange mallkommentar.<br>Den kommer att visas som en ledtråd i dialogrutan för skapande av nya filer, där du väljer filnamn.";;
        "nb" | "nn" | "no")
            echo "Vennligst skriv inn malkommentarer.<br>Den vises som et hint i dialogboksen for ny filoppretting, der du velger filnavnet.";;
        "tr")
            echo "Lütfen şablon yorumunu girin.<br>Dosya adını seçtiğiniz yeni dosya oluşturma iletişim kutusunda ipucu olarak görüntülenecektir.";;
        "uk")
            echo "Будь ласка, введіть коментар до шаблону.<br>Він буде відображений як підказка у діалоговому вікні створення нового файлу, де ви виберете його ім'я файлу.";;
        "is")
            echo "Vinsamlegast sláðu inn sniðmátaskýringu.<br>Það verður sýnt sem vísbending í nýjum skjalagerðarglugga þar sem þú velur skráarnafn.";;
        "el")
            echo "Εισαγάγετε σχόλιο προτύπου.<br>Θα εμφανίζεται ως υπόδειξη στο νέο διάλογο δημιουργίας αρχείων, όπου επιλέγετε το όνομα αρχείου του.";;
        "hu")
            echo "Kérjük, írja be a sablon megjegyzését.<br>Ujjként jelenik meg az új fájl létrehozása párbeszédpanelen, ahol a fájlnevet választja.";;
        "da")
            echo "Indtast venligst skabelonkommentar.<br>Den vises som antydning i dialogboksen til oprettelse af en ny fil, hvor du vælger dens filnavn.";;
        *)
            echo "Please, enter template comment.<br>It will be displayed as hint in new file creation dialog, where you choose its filename.";;
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
        "tr")
            echo "Şablon başarıyla oluşturuldu ";;
        "uk")
            echo "Шаблон успішно створено як ";;
        "is")
            echo "Sniðmát búið til sem ";;
        "el")
            echo "Το πρότυπο δημιουργήθηκε με επιτυχία ως ";;
        "hu")
            echo "A sablon sikeresen létrehozva ";;
        "da")
            echo "Skabelon oprettet med succes som ";;
        *)
            echo "Template created successfully as ";;
    esac
}

# endregion

# region TemplateEditor

function str_name_should_not_be_empty()
{
    case "$first_locale" in
        "es")
            echo "El nombre de la plantilla no puede estar vacío.";;
        "fr")
            echo "Le nom du modèle ne doit pas être vide.";;
        "it")
            echo "Il nome del modello non deve essere vuoto.";;
        "de")
            echo "Der Vorlagenname darf nicht leer sein.";;
        "pt")
            echo "O nome do modelo não deve estar vazio.";;
        "ru")
            echo "Название шаблона не должно быть пустым.";;
        "nl")
            echo "Sjabloonnaam mag niet leeg zijn.";;
        "cs")
            echo "Název šablony by neměl být prázdný.";;
        "pl")
            echo "Nazwa szablonu nie powinna być pusta.";;
        "ro")
            echo "Numele șablonului nu trebuie să fie gol.";;
        "et")
            echo "Mallinimi ei tohi olla tühi.";;
        "fi")
            echo "Mallin nimi ei saa olla tyhjä.";;
        "sv")
            echo "Mallnamnet får inte vara tomt.";;
        "nb" | "nn" | "no")
            echo "Malnavnet skal ikke være tomt.";;
        "tr")
            echo "Şablon adı boş bırakılmamalıdır.";;
        "uk")
            echo "Ім'я шаблону не повинно бути порожнім.";;
        "is")
            echo "Sniðmát heiti ætti ekki að vera autt.";;
        "el")
            echo "Το όνομα προτύπου δεν πρέπει να είναι κενό.";;
        "hu")
            echo "A sablon neve nem lehet üres.";;
        "da")
            echo "Skabelonnavn bør ikke være tomt.";;
        *)
            echo "Template name should not be empty.";;
    esac
}

function str_select_template_to_edit()
{
    case "$first_locale" in
        "es")
            echo "Seleccione la plantilla que desee editar:";;
        "fr")
            echo "Sélectionnez le modèle que vous souhaitez modifier:";;
        "it")
            echo "Seleziona il modello che vuoi modificare:";;
        "de")
            echo "Wählen Sie die Vorlage aus, die Sie bearbeiten möchten:";;
        "pt")
            echo "Selecione o modelo que deseja editar:";;
        "ru")
            echo "Выберите шаблон, который хотите отредактировать:";;
        "nl")
            echo "Selecteer de sjabloon die u wilt bewerken:";;
        "cs")
            echo "Vyberte šablonu, kterou chcete upravit:";;
        "pl")
            echo "Wybierz szablon, który chcesz edytować:";;
        "ro")
            echo "Selectați șablonul pe care doriți să îl editați:";;
        "et")
            echo "Valige mall, mida soovite muuta:";;
        "fi")
            echo "Valitse muokattava malli:";;
        "sv")
            echo "Välj mallen du vill redigera:";;
        "nb" | "nn" | "no")
            echo "Velg malen du vil redigere:";;
        "tr")
            echo "Düzenlemek istediğiniz şablonu seçin:";;
        "uk")
            echo "Виберіть шаблон, який потрібно редагувати:";;
        "is")
            echo "Veldu sniðmát sem þú vilt breyta:";;
        "el")
            echo "Επιλέξτε το πρότυπο που θέλετε να επεξεργαστείτε:";;
        "hu")
            echo "Válassza ki a szerkeszteni kívánt sablont:";;
        "da")
            echo "Vælg den skabelon, du vil redigere:";;
        *)
            echo "Select the template you want to edit:";;
    esac
}

function str_select_property_to_edit()
{
    case "$first_locale" in
        "es")
            echo "Elija la acción que desea realizar.<br>Puede guardar los cambios para conservarlos o descartarlos haciendo click en <i>Cancelar</i>.";;
        "fr")
            echo "Choisissez l'action que vous souhaitez effectuer.<br>Vous pouvez enregistrer les modifications pour les conserver ou les annuler en cliquant sur <i>Annuler</i>.";;
        "it")
            echo "Scegli l'azione che desideri eseguire.<br>Puoi salvare le modifiche per conservarle o eliminarle facendo clic su <i>Annulla</i>.";;
        "de")
            echo "Wählen Sie die Aktion aus, die Sie ausführen möchten.<br>Sie können die Änderungen speichern, um sie beizubehalten, oder sie verwerfen, indem Sie auf <i>Abbrechen</i> klicken.";;
        "pt")
            echo "Escolha a ação que deseja executar.<br>Você pode salvar as alterações para mantê-las ou descartá-las clicando em <i>Cancelar</i>.";;
        "ru")
            echo "Выберите действие, которое вы хотите выполнить.<br>Вы можете сохранить изменения или отменить их, нажав <i>Отмена</i>.";;
        "nl")
            echo "Kies de actie die u wilt uitvoeren.<br>U kunt de wijzigingen opslaan om ze te behouden of ze verwijderen door op <i>Annuleren</i> te klikken.";;
        "cs")
            echo "Vyberte akci, kterou chcete provést.<br>Změny můžete uložit, abyste je uchovali, nebo je zahodit kliknutím na <i>Zrušit</i>.";;
        "pl")
            echo "Wybierz czynność, którą chcesz wykonać.<br>Możesz zapisać zmiany, aby je zachować, lub odrzucić je, klikając <i>Anuluj</i>.";;
        "ro")
            echo "Alegeți acțiunea pe care doriți să o efectuați.<br>Puteți salva modificările pentru a le păstra sau le puteți renunța făcând clic pe <i>Anulare</i>.";;
        "et")
            echo "Valige toiming, mida soovite teha.<br>Muudatuste säilitamiseks võite muudatused salvestada või neist loobuda, klõpsates nuppu <i>Tühista</i>.";;
        "fi")
            echo "Valitse suoritettava toiminto.<br>Voit tallentaa muutokset säilyttääksesi ne tai hylätä ne napsauttamalla <i>Peruuta</i>.";;
        "sv")
            echo "Välj den åtgärd du vill utföra.<br>Du kan spara ändringarna för att behålla dem eller kasta dem genom att klicka på <i>Avbryt</i>.";;
        "nb" | "nn" | "no")
            echo "Velg handlingen du vil utføre.<br>Du kan lagre endringene for å beholde dem eller forkaste dem ved å klikke på <i>Avbryt</i>.";;
        "tr")
            echo "Gerçekleştirmek istediğiniz eylemi seçin.<br>Değişiklikleri saklamak için kaydedebilir veya <i>İptal</i>'i tıklayarak iptal edebilirsiniz.";;
        "uk")
            echo "Виберіть дію, яку хочете виконати.<br>Ви можете зберегти зміни, щоб зберегти їх, або відхилити, натиснувши <i>Скасувати</i>.";;
        "is")
            echo "Veldu aðgerðina sem þú vilt framkvæma.<br>Þú getur vistað breytingarnar til að halda þeim eða fargað þeim með því að smella á <i>Hætta við</i>.";;
        "el")
            echo "Επιλέξτε την ενέργεια που θέλετε να εκτελέσετε.<br>Μπορείτε να αποθηκεύσετε τις αλλαγές για να τις διατηρήσετε ή να τις απορρίψετε κάνοντας κλικ στο <i>Ακύρωση</i>.";;
        "hu")
            echo "Válassza ki a végrehajtani kívánt műveletet.<br>A módosításokat elmentheti, hogy megtartsa őket, vagy elvetheti őket a <i>Mégse</i> gombra kattintva.";;
        "da")
            echo "Vælg den handling, du vil udføre.<br>Du kan gemme ændringerne for at beholde dem eller kassere dem ved at klikke på <i>Annuller</i>.";;
        *)
            echo "Choose the action you want to perform.<br>You can save the changes to keep them or discard them by clicking on <i>Cancel</i>.";;
    esac
}

function str_edit_name()
{
    case "$first_locale" in
        "es")
            echo "Editar nombre";;
        "fr")
            echo "Modifier le nom";;
        "it")
            echo "Modifica nome";;
        "de")
            echo "Namen bearbeiten";;
        "pt")
            echo "Editar nome";;
        "ru")
            echo "Редактировать название";;
        "nl")
            echo "Naam bewerken";;
        "cs")
            echo "Upravit jméno";;
        "pl")
            echo "Zmień imię";;
        "ro")
            echo "Editeaza numele";;
        "et")
            echo "Muuda nime";;
        "fi")
            echo "Muokkaa nimeä";;
        "sv")
            echo "Redigera namn";;
        "nb" | "nn" | "no")
            echo "Rediger navn";;
        "tr")
            echo "Adı düzenle";;
        "uk")
            echo "Редагувати ім'я";;
        "is")
            echo "Breyttu nafni";;
        "el")
            echo "Επεξεργασία ονόματος";;
        "hu")
            echo "Név szerkesztése";;
        "da")
            echo "Rediger navn";;
        *)
            echo "Edit name";;
    esac
}

function str_edit_comment()
{
    case "$first_locale" in
        "es")
            echo "Editar comentario";;
        "fr")
            echo "Modifier le commentaire";;
        "it")
            echo "Modifica commento";;
        "de")
            echo "Kommentar bearbeiten";;
        "pt")
            echo "Editar comentário";;
        "ru")
            echo "Редактировать комментарий";;
        "nl")
            echo "Reactie bewerken";;
        "cs")
            echo "Upravit komentář";;
        "pl")
            echo "Edytuj komentarz";;
        "ro")
            echo "Editați comentariul";;
        "et")
            echo "Muuda kommentaari";;
        "fi")
            echo "Muokkaa kommenttia";;
        "sv")
            echo "Redigera kommentar";;
        "nb" | "nn" | "no")
            echo "Rediger kommentar";;
        "tr")
            echo "Yorumu düzenle";;
        "uk")
            echo "Редагувати коментар";;
        "is")
            echo "Breyta athugasemd";;
        "el")
            echo "Επεξεργασία σχολίου";;
        "hu")
            echo "Megjegyzés szerkesztése";;
        "da")
            echo "Rediger kommentar";;
        *)
            echo "Edit comment";;
    esac
}

function str_edit_icon()
{
    case "$first_locale" in
        "es")
            echo "Editar icono";;
        "fr")
            echo "Modifier l'icône";;
        "it")
            echo "Modifica l'icona";;
        "de")
            echo "Bearbeiten Sie das Symbol";;
        "pt")
            echo "Edite o ícone";;
        "ru")
            echo "Отредактируйте значок";;
        "nl")
            echo "Bewerk het pictogram";;
        "cs")
            echo "Upravte ikonu";;
        "pl")
            echo "Edytuj ikonę";;
        "ro")
            echo "Editați pictograma";;
        "et")
            echo "Muutke ikooni";;
        "fi")
            echo "Muokkaa kuvaketta";;
        "sv")
            echo "Redigera ikonen";;
        "nb" | "nn" | "no")
            echo "Rediger ikonet";;
        "tr")
            echo "Simgeyi düzenle";;
        "uk")
            echo "Відредагуйте піктограму";;
        "is")
            echo "Breyttu tákninu";;
        "el")
            echo "Επεξεργαστείτε το εικονίδιο";;
        "hu")
            echo "Szerkessze az ikont";;
        "da")
            echo "Rediger ikonet";;
        *)
            echo "Edit icon";;
    esac
}

function str_save_and_exit()
{
    case "$first_locale" in
        "es")
            echo "Guardar y salir";;
        "fr")
            echo "Sauvegarder et quitter";;
        "it")
            echo "Salva ed esci";;
        "de")
            echo "Speichern und schließen";;
        "pt")
            echo "Salvar e sair";;
        "ru")
            echo "Сохранить и выйти";;
        "nl")
            echo "Opslaan en afsluiten";;
        "cs")
            echo "Uložit a odejít";;
        "pl")
            echo "Zapisz i wyjdź";;
        "ro")
            echo "Salvează și ieși";;
        "et")
            echo "Salvesta ja välju";;
        "fi")
            echo "Tallenna ja poistu";;
        "sv")
            echo "Spara och avsluta";;
        "nb" | "nn" | "no")
            echo "Lagre og lukk";;
        "tr")
            echo "Kaydet ve çık";;
        "uk")
            echo "Зберегти та вийти";;
        "is")
            echo "Vista og hætta";;
        "el")
            echo "Αποθήκευση και έξοδος";;
        "hu")
            echo "Mentés és kilépés";;
        "da")
            echo "Gem og luk";;
        *)
            echo "Save and exit";;
    esac
}

function str_edited_template()
{
    case "$first_locale" in
        "es")
            echo "Plantilla modificada con éxito.";;
        "fr")
            echo "Modèle modifié avec succès.";;
        "it")
            echo "Modello modificato con successo.";;
        "de")
            echo "Vorlage erfolgreich geändert.";;
        "pt")
            echo "Modelo editado com sucesso.";;
        "ru")
            echo "Шаблон успешно отредактирован.";;
        "nl")
            echo "Sjabloon succesvol bewerkt.";;
        "cs")
            echo "Šablona byla úspěšně upravena.";;
        "pl")
            echo "Pomyślnie edytowano szablon.";;
        "ro")
            echo "Șablonul a fost editat cu succes.";;
        "et")
            echo "Mall on edukalt muudetud.";;
        "fi")
            echo "Mallin muokkaus onnistui.";;
        "sv")
            echo "Mall redigerades framgångsrikt.";;
        "nb" | "nn" | "no")
            echo "Malen ble redigert.";;
        "tr")
            echo "Şablon başarıyla düzenlendi.";;
        "uk")
            echo "Шаблон успішно відредаговано.";;
        "is")
            echo "Sniðmáti breytt.";;
        "el")
            echo "Η επεξεργασία του προτύπου ολοκληρώθηκε με επιτυχία.";;
        "hu")
            echo "A sablon szerkesztése sikeres volt.";;
        "da")
            echo "Skabelonen blev redigeret.";;
        *)
            echo "Template edited successfully.";;
    esac
}

function str_exists_template_with_same_name()
{
    case "$first_locale" in
        "es")
            echo "Ya existe una plantilla con el mismo nombre. Por favor, pruebe con otro.";;
        "fr")
            echo "Il existe un modèle existant avec exactement le même. S'il vous plaît, essayez-en un autre.";;
        "it")
            echo "C'è un modello esistente con esattamente lo stesso. Per favore, provane un altro.";;
        "de")
            echo "Es gibt eine vorhandene Vorlage mit genau der gleichen. Bitte versuchen Sie es mit einem anderen.";;
        "pt")
            echo "Existe um modelo existente com exatamente o mesmo. Por favor, tente outro.";;
        "ru")
            echo "Есть существующий шаблон с точно таким же. Пожалуйста, попробуйте другой.";;
        "nl")
            echo "Er is een bestaande sjabloon met precies hetzelfde. Probeer een andere.";;
        "cs")
            echo "Existuje existující šablona s přesně stejnou. Zkuste prosím jiný.";;
        "pl")
            echo "Istnieje szablon z dokładnie tym samym. Proszę, spróbuj innego.";;
        "ro")
            echo "Există un șablon existent cu exact același lucru. Vă rog, încercați altul.";;
        "et")
            echo "Olemasolev mall täpselt sama. Palun proovige mõnda muud.";;
        "fi")
            echo "Olemassa oleva malli, jossa on täsmälleen sama. Yritä toista.";;
        "sv")
            echo "Det finns en befintlig mall med exakt samma. Snälla, prova en annan.";;
        "nb" | "nn" | "no")
            echo "Der en eksisterende mal med nøyaktig den samme. Vær så snill, prøv en annen.";;
        "tr")
            echo "Tam olarak aynı olan mevcut bir şablon var. Lütfen, başka bir tane deneyin.";;
        "uk")
            echo "Існує існуючий шаблон із абсолютно однаковим. Будь ласка, спробуйте інший.";;
        "is")
            echo "Þar er núverandi sniðmát með nákvæmlega það sama. Vinsamlegast reyndu annað.";;
        "el")
            echo "Υπάρχει ένα υπάρχον πρότυπο με ακριβώς το ίδιο. Παρακαλώ, δοκιμάστε ένα άλλο.";;
        "hu")
            echo "Van egy létező sablon pontosan ugyanazzal. Kérjük, próbálkozzon másikkal.";;
        "da")
            echo "Der er en eksisterende skabelon med nøjagtig den samme. Prøv en anden.";;
        *)
            echo "There an existing template with exactly the same same. Please, try another.";;
    esac
}

function str_open_current_template()
{
    case "$first_locale" in
        "es")
            echo "Abrir plantilla actual";;
        "fr")
            echo "Ouvrir le modèle actuel";;
        "it")
            echo "Apri il modello corrente";;
        "de")
            echo "Aktuelle Vorlage öffnen";;
        "pt")
            echo "Abra o modelo atual";;
        "ru")
            echo "Открыть текущий шаблон";;
        "nl")
            echo "Huidige sjabloon openen";;
        "cs")
            echo "Otevřít aktuální šablonu";;
        "pl")
            echo "Otwórz aktualny szablon";;
        "ro")
            echo "Deschideți șablonul curent";;
        "et")
            echo "Ava praegune mall";;
        "fi")
            echo "Avaa nykyinen malli";;
        "sv")
            echo "Åpne gjeldende mal";;
        "nb" | "nn" | "no")
            echo "Åpne gjeldende mal";;
        "tr")
            echo "Geçerli şablonu aç";;
        "uk")
            echo "Відкрити поточний шаблон";;
        "is")
            echo "Opnaðu núverandi sniðmát";;
        "el")
            echo "Ανοίξτε το τρέχον πρότυπο";;
        "hu")
            echo "Nyissa meg az aktuális sablont";;
        "da")
            echo "Åbn den aktuelle skabelon";;
        *)
            echo "Open current template";;
    esac
}

function str_update_template()
{
    case "$first_locale" in
        "es")
            echo "Actualizar plantilla con un nuevo archivo o directorio";;
        "fr")
            echo "Mettre à jour le modèle avec un nouveau fichier ou répertoire";;
        "it")
            echo "Aggiorna il modello con un nuovo file o directory";;
        "de")
            echo "Vorlage mit neuer Datei oder Verzeichnis aktualisieren";;
        "pt")
            echo "Atualizar modelo com novo arquivo ou diretório";;
        "ru")
            echo "Обновить шаблон с новым файлом или каталогом";;
        "nl")
            echo "Sjabloon bijwerken met nieuw bestand of nieuwe map";;
        "cs")
            echo "Aktualizujte šablonu o nový soubor nebo adresář";;
        "pl")
            echo "Zaktualizuj szablon o nowy plik lub katalog";;
        "ro")
            echo "Actualizați șablonul cu fișier sau director nou";;
        "et")
            echo "Värskendage malli uue faili või kataloogiga";;
        "fi")
            echo "Päivitä malli uudella tiedostolla tai hakemistolla";;
        "sv")
            echo "Uppdatera mall med ny fil eller katalog";;
        "nb" | "nn" | "no")
            echo "Oppdater mal med ny fil eller katalog";;
        "tr")
            echo "Şablonu yeni dosya veya dizinle güncelleyin";;
        "uk")
            echo "Оновити шаблон новим файлом або каталогом";;
        "is")
            echo "Uppfærðu sniðmát með nýrri skrá eða möppu";;
        "el")
            echo "Ενημέρωση προτύπου με νέο αρχείο ή κατάλογο";;
        "hu")
            echo "Frissítse a sablont új fájllal vagy könyvtárral";;
        "da")
            echo "Opdater skabelon med ny fil eller mappe";;
        *)
            echo "Update template with new file or directory";;
    esac
}

function str_discard_new_template()
{
    case "$first_locale" in
        "es")
            echo "Descartar el nuevo archivo o directorio de plantilla";;
        "fr")
            echo "Supprimer le nouveau fichier modèle ou répertoire";;
        "it")
            echo "Elimina nuovo file modello o directory";;
        "de")
            echo "Neue Vorlagendatei oder neues Verzeichnis verwerfen";;
        "pt")
            echo "Descartar novo arquivo ou diretório de modelo";;
        "ru")
            echo "Отменить новый файл или каталог шаблона";;
        "nl")
            echo "Nieuw sjabloonbestand of nieuwe map verwijderen";;
        "cs")
            echo "Zlikvidujte nový soubor šablony nebo adresář";;
        "pl")
            echo "Odrzuć nowy plik szablonu lub katalog";;
        "ro")
            echo "Aruncați fișierul sau directorul șablon nou";;
        "et")
            echo "Visake uus mallifail või kataloog minema";;
        "fi")
            echo "Hylkää uusi mallitiedosto tai hakemisto";;
        "sv")
            echo "Kasta ny mallfil eller katalog";;
        "nb" | "nn" | "no")
            echo "Kast ny malfil eller katalog";;
        "tr")
            echo "Yeni şablon dosyasını veya dizini atın";;
        "uk")
            echo "Dobja el az új sablonfájlt vagy könyvtárat";;
        "is")
            echo "Fargaðu nýrri sniðmátaskrá eða möppu";;
        "el")
            echo "Απορρίψτε νέο αρχείο προτύπου ή κατάλογο";;
        "hu")
            echo "Dobja el az új sablonfájlt vagy könyvtárat";;
        "da")
            echo "Kasser ny skabelonfil eller mappe";;
        *)
            echo "Discard new template file or directory";;
    esac
}

function str_open_new_template()
{
    case "$first_locale" in
        "es")
            echo "Abrir nueva plantilla";;
        "fr")
            echo "Ouvrir nouveau modèle";;
        "it")
            echo "Apri nuovo modello";;
        "de")
            echo "Neue Vorlage öffnen";;
        "pt")
            echo "Abrir novo modelo";;
        "ru")
            echo "Открыть новый шаблон";;
        "nl")
            echo "Nieuwe sjabloon openen";;
        "cs")
            echo "Otevřít novou šablonu";;
        "pl")
            echo "Otwórz nowy szablon";;
        "ro")
            echo "Deschideți un șablon nou";;
        "et")
            echo "Ava uus mall";;
        "fi")
            echo "Avaa uusi malli";;
        "sv")
            echo "Öppna ny mall";;
        "nb" | "nn" | "no")
            echo "Åpne ny mal";;
        "tr")
            echo "Yeni şablon aç";;
        "uk")
            echo "Відкрити новий шаблон";;
        "is")
            echo "Opnaðu nýtt sniðmát";;
        "el")
            echo "Άνοιγμα νέου προτύπου";;
        "hu")
            echo "Új sablon megnyitása";;
        "da")
            echo "Åbn ny skabelon";;
        *)
            echo "Open new template";;
    esac
}

function str_select_new_template_type()
{
    case "$first_locale" in
        "es")
            echo "Seleccione el tipo de la nueva fuente de plantilla.";;
        "fr")
            echo "Sélectionnez le type de la nouvelle source de modèle.";;
        "it")
            echo "Seleziona il tipo della nuova origine del modello.";;
        "de")
            echo "Wählen Sie den Typ der neuen Vorlagenquelle aus.";;
        "pt")
            echo "Selecione o tipo da nova fonte de modelo.";;
        "ru")
            echo "Выберите тип нового источника шаблона.";;
        "nl")
            echo "Selecteer het type van de nieuwe sjabloonbron.";;
        "cs")
            echo "Vyberte typ nového zdroje šablony.";;
        "pl")
            echo "Wybierz typ nowego źródła szablonu.";;
        "ro")
            echo "Selectați tipul sursei noului șablon.";;
        "et")
            echo "Valige uue malli allika tüüp.";;
        "fi")
            echo "Valitse uuden mallilähteen tyyppi.";;
        "sv")
            echo "Välj typen av den nya mallkällan.";;
        "nb" | "nn" | "no")
            echo "Velg typen for den nye malkilden.";;
        "tr")
            echo "Yeni şablon kaynağının türünü seçin.";;
        "uk")
            echo "Виберіть тип нового джерела шаблону.";;
        "is")
            echo "Veldu gerð nýju sniðmátagjafans.";;
        "el")
            echo "Επιλέξτε τον τύπο της νέας πηγής προτύπου.";;
        "hu")
            echo "Válassza ki az új sablonforrás típusát.";;
        "da")
            echo "Vælg typen af den nye skabelonkilde.";;
        *)
            echo "Select the type of the new template source.";;
    esac
}

function str_file()
{
    case "$first_locale" in
        "es")
            echo "Archivo";;
        "fr")
            echo "Fichier";;
        "it")
            echo "File";;
        "de")
            echo "Datei";;
        "pt")
            echo "Arquivo";;
        "ru")
            echo "Файл";;
        "nl")
            echo "Het dossier";;
        "cs")
            echo "Soubor";;
        "pl")
            echo "Plik";;
        "ro")
            echo "Fişier";;
        "et")
            echo "Fail";;
        "fi")
            echo "Tiedosto";;
        "sv")
            echo "Fil";;
        "nb" | "nn" | "no")
            echo "Fil";;
        "tr")
            echo "Dosya";;
        "uk")
            echo "Файл";;
        "is")
            echo "Skrá";;
        "el")
            echo "Αρχείο";;
        "hu")
            echo "File";;
        "da")
            echo "Fil";;
        *)
            echo "File";;
    esac
}

function str_directory()
{
    case "$first_locale" in
        "es")
            echo "Directorio";;
        "fr")
            echo "Directoire";;
        "it")
            echo "Directory";;
        "de")
            echo "Verzeichnis";;
        "pt")
            echo "Diretório";;
        "ru")
            echo "Каталог";;
        "nl")
            echo "Directory";;
        "cs")
            echo "Adresář";;
        "pl")
            echo "Informator";;
        "ro")
            echo "Director";;
        "et")
            echo "Kataloog";;
        "fi")
            echo "Hakemisto";;
        "sv")
            echo "Katalog";;
        "nb" | "nn" | "no")
            echo "Katalog";;
        "tr")
            echo "Dizin";;
        "uk")
            echo "Каталог";;
        "is")
            echo "Mappa";;
        "el")
            echo "Ευρετήριο";;
        "hu")
            echo "Könyvtár";;
        "da")
            echo "Vejviser";;
        *)
            echo "Directory";;
    esac
}

function str_backup_confirmation()
{
    case "$first_locale" in
        "es")
            echo "¿Desearía hacer una copia de seguridad de la plantilla anterior?";;
        "fr")
            echo "Souhaitez-vous faire une sauvegarde du dernier modèle?";;
        "it")
            echo "Vuoi fare un backup dell'ultimo modello?";;
        "de")
            echo "Möchten Sie ein Backup der letzten Vorlage erstellen?";;
        "pt")
            echo "Você gostaria de fazer um backup do último modelo?";;
        "ru")
            echo "Хотите сделать резервную копию последнего шаблона?";;
        "nl")
            echo "Wilt u een back-up maken van het laatste sjabloon?";;
        "cs")
            echo "Chcete vytvořit zálohu poslední šablony?";;
        "pl")
            echo "Czy chcesz zrobić kopię zapasową ostatniego szablonu?";;
        "ro")
            echo "Doriți să faceți o copie de rezervă a ultimului șablon?";;
        "et")
            echo "Kas soovite teha viimase malli varukoopia?";;
        "fi")
            echo "Haluatko tehdä varmuuskopion viimeisestä mallista?";;
        "sv")
            echo "Vill du göra en säkerhetskopia av den sista mallen?";;
        "nb" | "nn" | "no")
            echo "Vil du ta en sikkerhetskopi av den siste malen?";;
        "tr")
            echo "Son şablonun bir yedeğini almak ister misiniz?";;
        "uk")
            echo "Хочете зробити резервну копію останнього шаблону?";;
        "is")
            echo "Viltu taka afrit af síðasta sniðmátinu?";;
        "el")
            echo "Θέλετε να δημιουργήσετε αντίγραφο ασφαλείας του τελευταίου προτύπου?";;
        "hu")
            echo "Szeretne biztonsági másolatot készíteni az utolsó sablonról?";;
        "da")
            echo "Vil du tage en sikkerhedskopi af den sidste skabelon?";;
        *)
            echo "Would you like to make a backup of the last template?";;
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
        "tr")
            echo "Kullanılabilir şablon yok.";;
        "uk")
            echo "Немає доступних шаблонів.";;
        "is")
            echo "Engin sniðmát eru til.";;
        "el")
            echo "Δεν υπάρχουν διαθέσιμα πρότυπα.";;
        "hu")
            echo "Nincsenek elérhető sablonok.";;
        "da")
            echo "Der er ingen tilgængelige skabeloner.";;
        *)
            echo "There are no available templates.";;
    esac
}

function str_select_templates_to_remove()
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
        "tr")
            echo "Kaldırmak istediğiniz şablonları seçin:";;
        "uk")
            echo "Виберіть шаблон (шаблони), який ви хочете видалити:";;
        "is")
            echo "Veldu sniðmátin sem þú vilt fjarlægja:";;
        "el")
            echo "Επιλέξτε τα πρότυπα που θέλετε να καταργήσετε:";;
        "hu")
            echo "Válassza ki az eltávolítani kívánt sablon (oka) t:";;
        "da")
            echo "Vælg den eller de skabeloner, du vil fjerne:";;
        *)
            echo "Select the template(s) you want to remove:";;
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
        "tr")
            echo "Sonraki şablonları kaldırmak istediğinizden emin misiniz? Bu işlem geri alınamaz.<br>";;
        "uk")
            echo "Ви впевнені, що хочете видалити наступні шаблони? Цю дію не можна скасувати.<br>";;
        "is")
            echo "Ertu viss um að þú viljir fjarlægja næstu sniðmát? Ekki er hægt að afturkalla þessa aðgerð.<br>";;
        "el")
            echo "Είστε βέβαιοι ότι θέλετε να καταργήσετε τα επόμενα πρότυπα? Δεν είναι δυνατή η αναίρεση αυτής της ενέργειας.<br>";;
        "hu")
            echo "Biztosan eltávolítja a következő sablonokat? Ezt a műveletet nem lehet visszavonni.<br>";;
        "da")
            echo "Er du sikker på, at du vil fjerne de næste skabeloner? Denne handling kan ikke fortrydes.<br>";;
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
        "tr")
            echo "Sonraki şablonlar kaldırıldı:<br>";;
        "uk")
            echo "Наступні шаблони були видалені:<br>";;
        "is")
            echo "Næstu sniðmát voru fjarlægð:<br>";;
        "el")
            echo "Τα επόμενα πρότυπα καταργήθηκαν:<br>";;
        "hu")
            echo "A következő sablonokat eltávolítottuk:<br>";;
        "da")
            echo "Næste skabeloner blev fjernet:<br>";;
        *)
            echo "Next templates were removed:<br>";;
    esac
}

# endregion