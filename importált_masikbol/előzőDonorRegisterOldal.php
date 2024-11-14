<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>DELVE Registration</title>
  <link rel="stylesheet" href="style.css">
  <script async src="script.js"></script>
</head>
<body>
<main>
  <div class="wrapper">
    <form action="login.php" method="post" id="register">
      <h2>Register an account </h2>
        <div class="input-field">
        <input type="text" name="username" id="username" required>
        <label>Username:</label>
        </div>
      <div class="input-field">
        <input type="email" name="email" id="email"  required>
        <label>Email:</label>
        </div>
      <div class="input-field">
        <input type="password" name="password" id="password" required>
        <label>Password:</label>
        </div>
      <div class="input-field">
        <input type="password" name="password2" id="password2" required>
        <label>Password Again:</label>
        </div>
        <div class="forget">
      <label for="remember">
        <input type="checkbox" id="remember">
      <p>I agree with the term of services</p>
            </label>
        </div>
      <button type="submit">Register now!</button>
      <div class="register">
        <p>You already have an account? <a href="login.php">Log in</a></p>
      </div>
    </form>
  </div>
</main>
</body>
</html>