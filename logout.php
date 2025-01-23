<?php
session_start();
require 'db.php';

$rememberMeSet = isset($_COOKIE['remember_me']) && isset($_COOKIE['remember_user']);

// Ha a felhasználó be van jelentkezve, töröljük a tokent az adatbázisból
if (isset($_SESSION['user_email'])) {
    $pdo = db();

    // Ha a "remember me" aktív volt, akkor megtartjuk a felhasználó nevét
    if (isset($_COOKIE['remember_me']) && $_COOKIE['remember_me'] == '1') {
        // Az email és a felhasználónevet itt kezelheted
        $_SESSION['user_email'] = $_SESSION['user_email'];

    } else {
        // Ha nincs "remember me", töröljük a felhasználó nevet a session-ből
        unset($_SESSION['user_email']);
        
        // Ezt kiírjuk a felhasználónév mezőben
        $username = ''; // Üres string, ha nem emlékezünk rá

        // Ha a token is felesleges, töröljük az adatbázisból
        $stmt = $pdo->prepare("UPDATE players_pyr SET remember_token = NULL WHERE email = :email");
        $stmt->execute(['email' => $_SESSION['user_email']]); //még mindig nem tökéletes
    }
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