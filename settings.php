<?php
session_start(); 
require_once 'db.php';
$errors = [];
$success = [];

if (!isset($_SESSION['user_email'])) {
    header('Location: login.php');
    exit;
}

$pdo = db();

if ($_SERVER['REQUEST_METHOD'] === 'POST') {

    // Felhasználónév módosítása
    if (!empty($_POST['usernameChange'])) {
        $newUsername = trim($_POST['usernameChange']);
        
        if (!preg_match('/^[a-zA-Z0-9_]{6,20}$/', $newUsername)) {
            $errors[] = "The username needs to be between 6 and 20 characters, and only letters, numbers and underscore is allowed.";
        } else {
            $stmt = $pdo->prepare("UPDATE players_pyr SET username = :username WHERE id = :id");
            $stmt->execute(['username' => $newUsername, 'id' => $_SESSION['user_id']]);
            $success[] = "Username successfully updated.";
        }
    }

    // Email módosítása
    if (!empty($_POST['emailChange'])) {
        $newEmail = trim($_POST['emailChange']);

        if (!filter_var($newEmail, FILTER_VALIDATE_EMAIL)) {
            $errors[] = "Wrong e-mail address.";
        } else {
            $stmt = $pdo->prepare("UPDATE players_pyr SET email = :email WHERE id = :id");
            $stmt->execute(['email' => $newEmail, 'id' => $_SESSION['user_id']]);
            $success[] = "E-mail successfully updated.";
        }
    }

    // Jelszó módosítása
    if (!empty($_POST['passwordChange']) && !empty($_POST['passwordChange2'])) {
        $password = $_POST['passwordChange'];
        $password2 = $_POST['passwordChange2'];

        if ($password !== $password2) {
            $errors[] = "Both passwords need to be the same.";
        } elseif (strlen($password) < 8 || strlen($password) > 255) {
            $errors[] = "The password's lenght needs to be between 8 and 255 characters.";
        } else {
            $hashedPassword = password_hash($password, PASSWORD_DEFAULT);
            $stmt = $pdo->prepare("UPDATE players_pyr SET password = :password WHERE id = :id");
            $stmt->execute(['password' => $hashedPassword, 'id' => $_SESSION['user_id']]);
            $success[] = "Password successfully updated.";
        }
    }

    // Fiók deaktiválása
    if (isset($_POST['deactivateAccount'])) {
        if (isset($_POST['confirmText']) && $_POST['confirmText'] === 'DEACTIVATE') {
            $stmt = $pdo->prepare("UPDATE players_pyr SET deactivated = 1 WHERE id = :id");
            $stmt->execute(['id' => $_SESSION['user_id']]);

            // (opcionális) Jelszó véletlenszerű módosítása
            
            $newPass = bin2hex(random_bytes(3));
            $hashedPass = password_hash($newPass, PASSWORD_DEFAULT);
            $stmt = $pdo->prepare("UPDATE players_pyr SET password = :password WHERE id = :id");
            $stmt->execute(['password' => $hashedPass, 'id' => $_SESSION['user_id']]);

            session_destroy();
            header('Location: deactivated.html');
            exit;
        } else {
            $errors[] = "The confirmation word is incorrect. Please type it exactly as: DEACTIVATE.";
        }
    }
}
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>DELVE-PCG User Settings</title>
    <link rel="stylesheet" href="./css/Settings_style.css">
    <link rel="shortcut icon" href="./img/favico2.png" type="image/png">
    <script async src="./js/deactivateButtonWarning.js"></script>
</head>
<body>
    <div class="container">
        <h1>Account Settings</h1>
        
        <h3>Change your username:</h3>
        <p>You will be able to change it here:</p>
        <form action="settings.php" method="post">
            <input type="text" name="usernameChange" class="Change" placeholder="New Username" required> 
            <button type="submit">
                <span class="transition"></span>
                <span class="gradient"></span>
                <span class="label">Submit your new username</span> 
            </button>
        </form>
        
        <h3>Change your email:</h3>
        <p>You will be able to change it here:</p>
        <form action="settings.php" method="post">
            <input type="email" name="emailChange" class="Change" placeholder="New email address" required>
            <button type="submit">
                <span class="transition"></span>
                <span class="gradient"></span>
                <span class="label">Submit your new email address</span>    
            </button>
        </form>
        
        <h3>Change your password</h3>
        <p>You will be able to change it here:</p>
        <form action="settings.php" method="post">
            <input type="password" name="passwordChange" class="Change" placeholder="New password" required>
            <input type="password" name="passwordChange2" class="Change" placeholder="New password again" required>
            <button type="submit">
                <span class="transition"></span>
                <span class="gradient"></span>
                <span class="label">Submit your new password</span>    
            </button>
        </form>
        
        <h3>Deactivate your account:</h3>
        <p>You can deactive your account, and it will not be deleted, but you will lose all access to it. 
           <br> So think twice before doing it so.</p>
        <form action="settings.php" method="post" onsubmit="return confirmDeactivation();">
            <label for="confirmText">Type <strong>DEACTIVATE</strong> to confirm the deactivation of your account.</label>
            <input type="text" name="confirmText" id="confirmText" required class="Change">
            <input type="hidden" name="deactivateAccount" value="1">
            <button type="submit">
                    <span class="transition2"></span>
                    <span class="gradient2"></span>
                    <span class="label2">Deactivate my account</span>
                </button>
        </form>

        <?php
        if (!empty($errors)) {
            foreach ($errors as $error) {
                echo "<div class='alert alert-error' style='color: red'><div class='closebtn' onclick='removeAlert(this)';'>&times;</div>$error</div>";}
        }

        if (!empty($success)) {
            foreach ($success as $message) {
                echo "<div class='alert alert-success' style='color: green'><div class='closebtn' onclick='removeAlert(this)';'>&times;</div>$message</div>";
            }
        }

        // Hibaüzenetek megjelenítése
?>
    </div>
</body>
</html>