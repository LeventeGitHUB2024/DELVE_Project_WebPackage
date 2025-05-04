<?php
session_start();
require 'db.php';

$pdo = db();


// Ellnőrizzük, hogy a felhasználó be van-e jelentkezve
if (isset($_SESSION['user_email'])) {
    $userEmail = $_SESSION['user_email'];
}

// Session törlése
$_SESSION = [];
session_unset();
session_destroy();

// Átirányítás a bejelentkezési oldalra
header("Location: login.php");
exit;
?>