<?php 

require_once 'assets/php/model/model_users.php';

$NameRegex = "/[a-zA-Z0-9ÀÁÂÃÄÅàáâãäåÒÓÔÕÖØòóôõöøÈÉÊËèéêëÇçÌÍÎÏìíîïÙÚÛÜùúûüÿÑñ]{2,12}$/";
$BirthDateRegex = "/([12]\d{3}-(0[1-9]|1[0-2])-(0[1-9]|[12]\d|3[01]))/";
$PasswordRegex = "/^(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*#?&])[A-Za-z\d@$!%*#?&]{8,}$/";

$error = [];

if (isset($_POST['Pseudo'])) {

    if (!preg_match($NameRegex, $_POST['Pseudo'])) {
        $error['Pseudo'] = 'Mauvais Format';
    };
    if (empty($_POST['Pseudo'])) {
        $error['Pseudo'] = 'Veuillez Renseigner le champ';
    };
}

if (isset($_POST['Mail'])) {
    $Users = new Users();
    if (!filter_var($_POST['Mail'], FILTER_VALIDATE_EMAIL)) {
        $error['Mail'] = 'Mauvais Format';
    };
    if ($Users->VerifyMailExist($_POST['Mail'])) {
        $error['Mail'] = 'Le mail existe déja';
    }
    if (empty($_POST['Mail'])) {
        $error['Mail'] = 'Veuillez Renseigner le champ';
    };
}

if (isset($_POST['BirthDate'])) {

    if (!preg_match($BirthDateRegex, $_POST['BirthDate'])) {
        $error['BirthDate'] = 'Mauvais Format';
    };
    if (empty($_POST['BirthDate'])) {
        $error['BirthDate'] = 'Veuillez Renseigner le champ';
    };
}

// if (isset($_POST['Password']) ) {

//     if (!preg_match($PasswordRegex, $_POST['Password'])) {
//         $error['Password'] = 'Mauvais Format';
//     };
//     if (empty($_POST['Password'])) {
//         $error['Password'] = 'Veuillez Renseigner le champ';
//     };
// }

// if (isset($_POST['VerifPassword']) ) {

//     if ($_POST['VerifPassword'] != $_POST['Password'] ) {
//         $error['VerfifPassword'] = 'Les mots de passe ne sont pas identiques';
//     };
//     if (empty($_POST['VerifPassword'])) {
//         $error['VerifPassword'] = 'Le champ n\'est pas identique au mot de passe ';
//     };
// }
// };


if (isset($_POST['Password']) && isset($_POST['VerifPassword'])) {

        if (!preg_match($PasswordRegex, $_POST['Password'])) {
            $error['Password'] = 'Mauvais Format';
        };
        if (empty($_POST['Password'])) {
            $error['Password'] = 'Veuillez Renseigner le champ';
        };
            
        if ($_POST['VerifPassword'] != $_POST['Password'] ) {
            $error['VerfifPassword'] = 'Les mots de passe ne sont pas identiques';
        };
        if (empty($_POST['VerifPassword'])) {
            $error['VerifPassword'] = 'Le champ n\'est pas identique au mot de passe ';
        };
    
    };

    
    






?>

