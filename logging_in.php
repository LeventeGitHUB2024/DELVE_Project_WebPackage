<?php
session_start();
require 'db.php';
$errors = [];

$prefilledUsername = ''; // Alapértelmezett üres felhasználónév

// Ellenőrizzük, hogy POST kérés érkezett-e
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $usernameOrEmail = $_POST['username'] ?? '';
    $password = $_POST['password'] ?? '';

    // Kapcsolódás az adatbázishoz
    $pdo = db();

    // Ellenőrizzük, hogy a felhasználónév vagy e-mail cím létezik-e
    $stmt = $pdo->prepare("SELECT * FROM players_pyr WHERE username = :usernameOrEmail OR email = :usernameOrEmail");
    $stmt->execute(['usernameOrEmail' => $usernameOrEmail]);
    $user = $stmt->fetch(PDO::FETCH_ASSOC);

    // Ha nincs találat
    if (!$user) {
            $errors[] = "You don't have an account, create one before logging in, it might just help! 😉";
    }
    
    else {
        if (password_verify($password, $user['password']) && $user['deactivated'] != 1) {
            // Jelszó helyes, felhasználó belép
            $_SESSION['user_email'] = $user['email'];

            // Átirányítás a dashboardra
            header("Location: UCP.php");
            exit;
        

        } else {
            // Helytelen jelszó
            $errors[] = "Wrong password! \n Are you sure you didn't mistyped it?, Or maybe is your account deactivated?";
        }
    }

    // Ha vannak hibák, tároljuk őket a session-ben, majd irányítsuk át
    if (!empty($errors)) {
        $_SESSION['errors'] = $errors;
        header("Location: login.php");
        exit;
    }
}
?>
