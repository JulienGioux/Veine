<?php
session_start();

if (!isset($_SESSION['User'])) {
    header('Location: index.php');
}else {
    // var_dump($_SESSION['User']);
}

?>


<!DOCTYPE html>
<html lang="fr">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="assets/style/style.css">
</head>

<body>

    <?php include 'assets/php/include/include_navbar.php' ?>

    <div>
        <h1 style="text-align: center; padding-top:25px;">HOME</h1>
    </div>


    <script src="https://kit.fontawesome.com/2edc250389.js" crossorigin="anonymous"></script>
</body>

</html>