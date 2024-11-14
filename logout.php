<?php
session_start();
session_destroy(); // Lejáratjuk a munkamenetet

// Süti törlése
setcookie('username', '', time() - 3600, "/");
setcookie('password', '', time() - 3600, "/");

header("Location: login.php"); // Visszairányítjuk a bejelentkezési oldalra
exit;
?>
