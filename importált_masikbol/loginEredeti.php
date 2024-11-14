<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>DELVE Login</title>
  <link rel="stylesheet" href="style.css">
</head>
<body>
  <div class="wrapper">
    <form action="welcome.php" method="post">
      <h2>Login</h2>
        <div class="input-field">
        <input type="text" required>
        <label>Username:</label>
      </div>
      <div class="input-field">
        <input type="password" required>
        <label>Password:</label>
      </div>
      <div class="forget">
        <label for="remember">
          <input type="checkbox" id="remember">
          <p>Remember me</p>
        </label>
        <a href="#">Forgot password?</a>
      </div>
      <button type="submit">Log In</button>
      <div class="register">
        <p>Don't have an account? <a href="register.php">Register now!</a></p>
      </div>
    </form>
  </div>
</body>
</html>