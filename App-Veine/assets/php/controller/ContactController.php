<?php
session_start();
if (!isset($_SESSION['User'])) {
    header('Location: index.php');
}
require_once 'assets/php/model/model_contact.php';

$contacts = new Contacts();
$contactsArray = $contacts->getContacts($_SESSION['User']['users_id']); 





?>