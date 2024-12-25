<?php
session_start();
require 'db.php';
$errors = [];

if (isset($_GET['token'])) {
    $token = $_GET['token'];

    // Ellenőrizd, hogy a token létezik-e
    $pdo = db();
    $stmt = $pdo->prepare("SELECT * FROM players_pyr WHERE reset_token = :token");
    $stmt->execute(['token' => $token]);
    $user = $stmt->fetch(PDO::FETCH_ASSOC);

    if ($user) {
        if ($_SERVER['REQUEST_METHOD'] === 'POST') {
            $password = $_POST['password'] ?? '';
            $confirmPassword = $_POST['confirm_password'] ?? '';

            // Ellenőrizd, hogy a két jelszó megegyezik
            if ($password === $confirmPassword) {
                // Hasheljük a jelszót
                $hashedPassword = password_hash($password, PASSWORD_BCRYPT);

                // Frissítsük a jelszót az adatbázisban
                $stmt = $pdo->prepare("UPDATE players_pyr SET password = :password, reset_token = NULL WHERE reset_token = :token");
                $stmt->execute(['password' => $hashedPassword, 'token' => $token]);

                echo "Your password has been successfully reset.";
            } else {
                $errors[] = "Passwords do not match.";
            }
        }
    } else {
        $errors[] = "Invalid token.";
    }
} else {
    $errors[] = "No token provided.";
}
?>

<form method="POST" action="reset_password.php?token=<?php echo $_GET['token']; ?>">
    <input type="password" name="password" required placeholder="New password">
    <input type="password" name="confirm_password" required placeholder="Confirm new password">
    <button type="submit">Reset Password</button>
</form>

<?php
if (!empty($errors)) {
    foreach ($errors as $error) {
        echo "<div class='alert alert-error'>$error</div>";
    }
}
?>