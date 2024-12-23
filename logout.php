<?php
session_start();
require 'db.php';

// Ha a felhasználó be van jelentkezve, töröljük a tokent az adatbázisból
if (isset($_SESSION['user_email'])) {
    $pdo = db();
    $stmt = $pdo->prepare("UPDATE players_pyr SET remember_token = NULL WHERE email = :email");
    $stmt->execute(['email' => $_SESSION['user_email']]);
}

// Töröljük a cookie-kat
setcookie('remember_me', '', time() - 3600, '/');
setcookie('remember_user', '', time() - 3600, '/');

// Session törlése
session_destroy();

// Átirányítás a bejelentkezési oldalra
header("Location: login.php");
exit;
?>
