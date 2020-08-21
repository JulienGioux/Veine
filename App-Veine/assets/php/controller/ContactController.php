<?php
session_start();
if (!isset($_SESSION['User'])) {
    header('Location: index.php');
}
require_once 'assets/php/model/model_contact.php';

$contacts = new Contacts();


if (isset($_POST['accepted'])) {

    $contactId = $_POST['accepted'];
    $contacts->validateContacts($contactId);
}

if (isset($_POST['bookmarked'])) {

    $contactId = $_POST['bookmarked'];
    $contacts->bookmarkedContacts($contactId);
}

if (isset($_POST['unmarked'])) {

    $contactId = $_POST['unmarked'];
    $contacts->unmarkedContacts($contactId);
}

$contactsArray = $contacts->getContacts($_SESSION['User']['users_id']);



?>
