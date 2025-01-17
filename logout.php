<?php
session_start();
require 'db.php';

$rememberMeSet = isset($_COOKIE['remember_me']) && isset($_COOKIE['remember_user']);

// Ha a felhasználó be van jelentkezve, töröljük a tokent az adatbázisból
if (isset($_SESSION['user_email'])) {
    $pdo = db();
    // $stmt = $pdo->prepare("UPDATE players_pyr SET remember_token = NULL WHERE email = :email");
    //$stmt->execute(['email' => $_SESSION['user_email']]); ezen még finomítani kell.  
}

// Csak akkor töröljük a cookie-kat, ha nincs "Remember Me" funkcióhoz kötve
if (!$rememberMeSet) {
    setcookie('remember_me', '', time() - 3600, '/', '', false, true);
    setcookie('remember_user', '', time() - 3600, '/', '', false, true);
}

// Session törlése
session_destroy();

// Átirányítás a bejelentkezési oldalra
header("Location: login.php");
exit;
?>