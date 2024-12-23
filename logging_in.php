<?php
session_start();
require 'db.php';
$errors = [];

// Ellenőrizzük, hogy POST kérés érkezett-e
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $usernameOrEmail = $_POST['username'] ?? '';
    $password = $_POST['password'] ?? '';

    // Kapcsolódás az adatbázishoz
    $pdo = db();

    // Ellenőrizd, hogy a felhasználónév vagy e-mail cím létezik-e
    $stmt = $pdo->prepare("SELECT * FROM players_pyr WHERE username = :usernameOrEmail OR email = :usernameOrEmail");
    $stmt->execute(['usernameOrEmail' => $usernameOrEmail]);
    $user = $stmt->fetch(PDO::FETCH_ASSOC);

    // Ha nincs találat
    if (!$user) {
        $errors[] = "You don't have an account, create one before logging in, it might just help! 😉";
    } else {
        if (password_verify($password, $user['password'])) {
            $_SESSION['user_email'] = $user['email'];

            //Token felépítése és működése
            if (isset($_POST['remember_me'])) {
                // Generáljunk egy véletlenszerű tokent
                $token = bin2hex(random_bytes(16));
            
                // Tároljuk a tokent az adatbázisban
                $stmt = $pdo->prepare("UPDATE players_pyr SET remember_token = :token WHERE email = :email");
                $stmt->execute(['token' => $token, 'email' => $user['email']]);
            
                // Állítsunk be cookie-kat a tokennel és a felhasználóval
                setcookie('remember_me', $token, time() + 600, '/', '', false, true); // 10 perc
                setcookie('remember_user', $user['username'], time() + 600, '/', '', false, true);
          
            header("Location: dashboard.php");
            exit;
            } else {
                $errors[] = "Wrong or just simply incorrect password!";}
                //var_dump($user['password']);
    }

    // Ha vannak hibák, tároljuk őket a session-ben, majd irányítsuk át
    if (!empty($errors)) {
        $_SESSION['errors'] = $errors;
        header("Location: login.php");
        exit;
    }

}
?>