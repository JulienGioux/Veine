<?php 

$PasswordRegex = "/^(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*#?&])[A-Za-z\d@$!%*#?&]{8,}$/";

$error = [];

if (isset($_POST['Mail'])) {

    if (!filter_var($_POST['Mail'], FILTER_VALIDATE_EMAIL)) {
        $error['Mail'] = 'Mauvais Format';
    };
    if (empty($_POST['Mail'])) {
        $error['Mail'] = 'Veuillez Renseigner le champ';
    };
}


if (isset($_POST['Password']) ) {

    if (!preg_match($PasswordRegex, $_POST['Password'])) {
        $error['Password'] = 'Mauvais Format';
    };
    if (empty($_POST['Password'])) {
        $error['Password'] = 'Veuillez Renseigner le champ';
    };
}



?>

