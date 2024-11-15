<?php
session_start();
session_destroy(); // Lejáratjuk a munkamenetet

header("Location: login.php"); // Visszairányítjuk a bejelentkezési oldalra
exit;
?>
