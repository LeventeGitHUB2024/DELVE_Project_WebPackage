<?php
session_start();
require 'db.php';

// Ellenőrizd, hogy a felhasználó be van-e jelentkezve
if (!isset($_SESSION['user_email'])) {
    header("Location: login.php");
    exit;
}

// Kiírhatod a felhasználó nevét vagy e-mail címét
$pdo = db();
$stmt = $pdo->prepare("SELECT * FROM users1 WHERE email = :email");
$stmt->execute(['email' => $_SESSION['user_email']]);
$user = $stmt->fetch(PDO::FETCH_ASSOC);
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>DELVE User Dashboard</title>
    <link rel="stylesheet" href="./css/welcomeStyle.css">
    <link rel="shortcut icon" href="../favico2.png" type="image/png">
    <link href="lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">
    <link href="lib/tempusdominus/css/tempusdominus-bootstrap-4.min.css" rel="stylesheet" />
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <script async src="./UCP_hez_template_files/js/main.js"></script>
</head>
<body>
<img src="./img/delve_logo.png" alt="Delve_logo" id="kep">
    
    <h1 id="wlc">Welcome <?php echo htmlspecialchars($user['username']); ?>!</h1>
    <a href="logout.php">
    <button>
    <span class="transition"></span>
    <span class="gradient"></span>
    <span class="label">Sign out</span>
    </button>
    </a>
    <p id="info">Here you can have a look at your statistics and your account settings.</p>
    <div id="hatter">
    </div>  
</body>
</html>
