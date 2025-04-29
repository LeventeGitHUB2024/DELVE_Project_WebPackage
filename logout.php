<?php
session_start();
require 'db.php';

$pdo = db();


// Ellnőrizzük, hogy a felhasználó be van-e jelentkezve
if (isset($_SESSION['user_email'])) {
    $userEmail = $_SESSION['user_email'];

    // Megnézzük, hogy be van-e jelölve a "Remember Me"
    $rememberMe = isset($_COOKIE['remember_me']) && $_COOKIE['remember_me'] === '1';

    if(!$rememberMe){
        $stmt = $pdo->prepare("UPDATE players_pyr SET remember_token = NULL WHERE email = :email");
        $stmt->execute(['email' => $userEmail]);

        //Itt töröljük a cookie-kat, mert nincs "Remember Me"
        setcookie('remember_me', '', [
            'expires' => time() - 3600,
            'path' => '/',
            'secure' => false,
            'httponly' => true,
            'samesite' => 'Lax'
        ]);

        setcookie('remember_email', '', [
            'expires' => time() - 3600,
            'path' => '/',
            'secure' => true,
            'httponly' => true,
            'samesite' => 'Lax'
        ]);

        setcookie('remember_user', '', [
            'expires' => time() - 3600,
            'path' => '/',
            'secure' => true,
            'httponly' => false,
            'samesite' => 'Lax'
        ]);
    }
}

// Session törlése
$_SESSION = [];
session_unset();
session_destroy();

// Átirányítás a bejelentkezési oldalra
header("Location: login.php");
exit;
?>