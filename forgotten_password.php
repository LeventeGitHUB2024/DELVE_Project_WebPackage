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
        $resetLink = "http://temesiszabolcsistvan.hu/reset_password.php?token=" . $token;
        $subject = "Password Reset Request";
        $message = "To reset your password, click on the following link: " . $resetLink;
        $headers = "From: delve.project@temesiszabolcsistvan.hu";
        mail($email, $subject, $message, $headers);

        echo "<div style='color: green; position:fixed; border: 1px solid green; border-radius: 5px; margin-top: -20em; font-weight: bold; background-color: #fff; width:35%; text-align:center'>
            An email with password reset instructions has been sent.
          </div>";
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
    <link rel="shortcut icon" href="./img/favico2.png" type="image/png">
    <script async src="./js/alertRemover.js"></script>
</head>
<body>
    <a class="link" href="http://temesiszabolcsistvan.hu/login.php">Back to login page</a>

<div>
<h2>The first step to reset your password</h2>
  <form method="post" action="forgotten_password.php">
    <div class="input-field">
    <input type="email" name="email" id='email' required>
        <label for="email">Enter your email</label>
        <button type="submit">Submit</button>
    </div>  
    </form>


<?php
      // Hibaüzenetek megjelenítése
      if (!empty($errors)) {
        foreach ($errors as $error) {
            echo "<div class='alert alert-error'><div class='closebtn' onclick='removeAlert(this)';'>
            &times;</div>$error</div>";}
        }
?>
    
</div>
</body>
</html>