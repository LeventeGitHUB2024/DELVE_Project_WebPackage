<?php
session_start(); // Indítsd el a session-t
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1.5">
    <title>DELVE Registration</title>
    <link rel="stylesheet" href="./css/style.css">
    <script async src="./importált_masikbol/script.js"></script>
    <link rel="shortcut icon" href="../favico2.png" type="image/png">
</head>
<body>
  <div class="wrapper">
    <form action="register.php" method="post" id="register">
    <h2>Register an account </h2>
    <div class="input-field">
        <input type="text" name="username" id="username" required>
        <label for="username">Username:</label>
        </div>
      <div class="input-field">
        <input type="email" name="email" id="email" required>
        <label for="email">Email:</label>
        </div>
      <div class="input-field">
        <input type="password" name="password" id="password" required>
        <label for="password">Password:</label>
        </div>
      <div class="input-field">
        <input type="password" name="password2" id="password2" required>
        <label for="password2">Password Again:</label>
      </div>    
      <div id="tos">
      <label for="agree">  
      <input type="checkbox" name="agree" class="agree" id="box" value="checked" required/> 
        <p id="white-text">I agree with the            
        <a href="./importált_masikbol/TOS.html" title="term of services">term of services</a></p>
        </label>
      </div>

    <button type="submit" onclick="passwordChecker()" id="button">Register</button>
    <div class="register">
        <p>You already have an account? <a href="login.php">Log in here</a></p>
      </div>
    </form>

    <!-- Hibák megjelenítése -->
    <?php
    if (isset($_SESSION['errors'])) {
        foreach ($_SESSION['errors'] as $error) {
            echo "<div class='alert alert-error'>
            <p id='pwcheck'></p>
    <div class='closebtn' onclick='removeAlert(this)';'>
    &times;</div>$error</div>";
        }
        // Üresítsd ki a hibákat, hogy ne jelenjenek meg újra
        unset($_SESSION['errors']);
    }
    ?>
  </div>
</body>
</html>
