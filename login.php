<?php
session_start();
require 'db.php';
$errors = [];

// Ellenőrizzük, hogy POST kérés érkezett-e
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $usernameOrEmail = $_POST['username'] ?? '';
    $password = $_POST['password'] ?? '';
    $rememberMe = isset($_POST['remember_me']); // Ellenőrizzük a checkbox állapotát

    // Kapcsolódás az adatbázishoz
    $pdo = db();

    // Ellenőrizd, hogy a felhasználónév vagy e-mail cím létezik-e
    $stmt = $pdo->prepare("SELECT * FROM users WHERE username = :usernameOrEmail OR email = :usernameOrEmail");
    $stmt->execute(['usernameOrEmail' => $usernameOrEmail]);
    $user = $stmt->fetch(PDO::FETCH_ASSOC);

    // Ha nincs találat
    if (!$user) {
        $errors[] = "Nincs fiókod, regisztrálj először!";
    } else {
        if (password_verify($password, $user['password'])) {
            $_SESSION['user_id'] = $user['id'];

            // Emlékezz rám: süti beállítása
            if ($rememberMe) {
                setcookie('username', $usernameOrEmail, time() + (86400 * 7), "/"); // 7 napig él
                setcookie('password', $password, time() + (86400 * 7), "/"); // 7 napig él (kevésbé biztonságos)
                
                header("Location: dashboard.php");
                exit;
            } else {
                $errors[] = "Hibás jelszó!";}
        }   
   }
}

// Hibaüzenetek megjelenítése
if ($errors) {
    foreach ($errors as $error) {
        echo "<p style='color: red;'>$error</p>";
    }
}

$username = isset($_COOKIE['username']) ? $_COOKIE['username'] : '';
$password = isset($_COOKIE['password']) ? $_COOKIE['password'] : '';
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>DELVE Login</title>
    <link rel="stylesheet" href="./css/style.css">
    <link rel="shortcut icon" href="../favico2.png" type="image/png">
</head>
<body>
  <div class="wrapper">
    <form action="login.php" method="post">
    <h2>Log into your account</h2>
    <div class="input-field">
        <input type="text" name="username" id="username" value="<?php echo htmlspecialchars($username); ?>" required>
        <label for="username">Username or E-mail:</label>
        </div>
    <div class="input-field">
        <input type="password" name="password" id="password" value="<?php echo htmlspecialchars($password); ?>" required>
        <label for="password">Password:</label>
        </div>    
    <div id="cetli">
      <label for="forgot">             
        <a href="#" title="forgotten_password">Forgot your password?</a>
      </label>
    </div>
    <div id="remember">
      <label for="remember_me">  
      <input type="checkbox" name="remember_me" class="remember" id="remember_me" value="checked" <?php if(isset($_COOKIE['username'])) echo 'checked'; ?>/> 
        <p id="white-text2">Remember me</p>
      </label>
    </div>
        <button type="submit" id="gomb">Log in</button>
    <p id="white-text3">Don't have an account? <a href="index.php">Register here</a></p>
    </form>
  </div>
</body>
</html>
