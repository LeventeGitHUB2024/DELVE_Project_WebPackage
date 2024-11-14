<?php
require 'db.php';
$errors = [];

// Ellenőrizzük, hogy POST kérés érkezett-e
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $username = $_POST['username'] ?? '';
    $email = $_POST['E_mail_address'] ?? '';  // Módosított mezőnév
    $password = $_POST['password'] ?? '';
    $password2 = $_POST['password2'] ?? '';

    // Felhasználónév validálása
    if (!preg_match('/[a-zA-Z0-9_]{6,20}/', $username)) {
        $errors[] = "The username can only consist of alphanumeric characters and underscores with the minimum length of at least 6 characters and a maximum of 20 characters!";
    }

    // Email validálása
    if (!filter_var($email, FILTER_VALIDATE_EMAIL)) {
        $errors[] = "Please enter a valid e-mail adress!";
    }

    // Jelszó validálása
    if (strlen($password) < 8 || strlen($password) > 255) {
        $errors[] = "The length of the password must be between 8 and 255 characters.";
    } elseif (!preg_match('/[A-Z]/', $password)) {
        $errors[] = "The password must contain  at least 1 uppercase letter";
    } elseif (!preg_match('/[a-z]/', $password)) {
        $errors[] = "The password must contain  at least 1 lowercase letter";
    } elseif (!preg_match('/[0-9]/', $password)) {
        $errors[] = "The password must contain  at least 1 number";
    } elseif (!preg_match('/[\W$_.-!@#$%^&*()]/', $password)) {
        $errors[] = "The password must contain  at least 1 special character.";
    } elseif ($password !== $password2) { 
        $errors[] = "Both passwords need to be the same!";
    }    
    
    // Ellenőrzés, hogy a felhasználónév és az e-mail cím egyedi-e
    $pdo = db();

    $stmt = $pdo->prepare("SELECT * FROM players_pyr WHERE username = :username OR E_mail_address = :email");     // Módosított mezőnév
    $stmt->execute(['username' => $username, 'email' => $email]);
    
    if ($stmt->fetch()) {
        $errors[] = "The username or the e-mail address is already taken!";
    }

    // Jelszó hash-elése
    $hashedPassword = password_hash($password, PASSWORD_DEFAULT);


    if (!empty($errors)) {
        session_start();
        $_SESSION['errors'] = $errors;
        $_SESSION['form_data'] = $_POST; // Űrlap adatok megőrzése
        header("Location: index.php");
        exit;
    }

    // Ha nincsenek hibák, folytatjuk a regisztrációval
    $stmt = $pdo->prepare("INSERT INTO players_pyr (username, E_mail_address, password) VALUES (:username, :email, :password)");
    $stmt->execute(['username' => $username, 'email' => $email, 'password' => $hashedPassword]);
    
    // Sikeres regisztráció után átirányítás
    header("Location: success.php");
    exit;
}

// Hibák megjelenítése
foreach ($errors as $error) {
    echo "<p style='color: red;'>$error</p>";
}
?>