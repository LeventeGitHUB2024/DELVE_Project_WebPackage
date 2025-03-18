<?php
session_start(); 
require 'db.php';
$errors = [];

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $username = $_POST['username'] ?? '';
    $email = $_POST['email'] ?? '';  // Módosított mezőnév
            
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>DELVE-PCG User Settings</title>
    <link rel="stylesheet" href="./css/TOSstyle.css">
    <link rel="shortcut icon" href="./img/favico2.png" type="image/png">
</head>
<body>
    <div class="container">
        <h1>Account Settings</h1>
        
        <h3>Change your username:</h3>
        <p>You will be able to change it here: (still creating)</p>
        <form action="settings.php" method="post">
            <input type="text" name="usernameChange" id="usernameChange">
            <label for="usernameChange">Enter your new username:</label>
            <button type="submit">Submit your new username</button>
        </form>
        
        <h3>Change your email:</h3>
        <p>You will be able to change it here: (still creating)</p>
        <form action="settings.php" method="post">
            <input type="email" name="emailChange" id="emailChange">
            <label for="emailChange">Enter your new email address:</label>
            <button type="submit">Submit your new email address</button>
        </form>
        
        <h3>Change your password</h3>
        <p>You can change your password <a href="reset_password.php" class="links">here</a>.</p>
        

        <h3>Deactivate your account:</h3>
        <p>You can deactive your account, and it will not be deleted, but you will lose all access to it. So think twice before doing it so.</p>
        <button onclick="">Deactivate my account</button>

        <?php
        if (!empty($errors)) {
        foreach ($errors as $error) {
            echo "<div class='alert alert-error' style='color: red'><div class='closebtn' onclick='removeAlert(this)';'>
            &times;</div>$error</div>";}
        }
        // Hibaüzenetek megjelenítése
?>
    </div>
</body>
</html>
