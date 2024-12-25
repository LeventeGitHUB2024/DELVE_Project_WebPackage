<?php
session_start();
require 'db.php';
$errors = [];

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $email = $_POST['email'] ?? '';

    // Ellenőrizd, hogy létezik-e a felhasználó az email cím alapján
    $pdo = db();
    $stmt = $pdo->prepare("SELECT * FROM players_pyr WHERE email = :email");
    $stmt->execute(['email' => $email]);
    $user = $stmt->fetch(PDO::FETCH_ASSOC);

    if ($user) {
        // Generálj egy egyedi token-t
        $token = bin2hex(random_bytes(16));

        // Tárold a token-t az adatbázisban
        $stmt = $pdo->prepare("UPDATE players_pyr SET reset_token = :token WHERE email = :email");
        $stmt->execute(['token' => $token, 'email' => $email]);

        // Küldj emailt a felhasználónak a linkkel
        $resetLink = "http://localhost/DELVE_Project_WebPackage/reset_password?token=" . $token;
        $subject = "Password Reset Request";
        $message = "To reset your password, click on the following link: " . $resetLink;
        mail($email, $subject, $message);

        echo "An email with password reset instructions has been sent.";
    } else {
        $errors[] = "No account found with that email.";
    }
}
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>DELVE Forgotten Password</title>
    <link rel="stylesheet" href="./css/forgotten.css">
    <link rel="shortcut icon" href="../favico2.png" type="image/png">
</head>
<body>


<div>
<h2>The first step to reset your password</h2>
  <form method="post" action="forgotten_password.php">
    <div class="input-field">
    <input type="email" name="email" id='email' required>
        <label for="email">Enter your email</label>
        <button type="submit">Submit</button>
    </div>  
</div>

    
</form>

</body>
</html>

<?php
      // Hibaüzenetek megjelenítése
    if (!empty($_SESSION['errors'])) {
    foreach ($_SESSION['errors'] as $error) {
        echo "<div class='alert alert-error'>
    <div class='closebtn' onclick='removeAlert(this)';'>
    &times;</div>$error</div>";
    }
     // Üresítsd ki a hibákat, hogy ne jelenjenek meg újra
     unset($_SESSION['errors']);
  }
?>