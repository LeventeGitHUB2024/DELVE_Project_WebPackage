<?php
require __DIR__ . '/../src/bootstrap.php';
require __DIR__ . '/../src/register.php';
?>

<link rel="stylesheet" href="../src/egyebek/style.css">
<script async src="../src/egyebek/script.js"></script>

<?php view('header', ['title' => 'DELVE Registration']) ?>

  <div class="wrapper">
    <form action="login.php" method="post" id="register">
      <h2>Register an account </h2>
      <div class="input-field">
        <input type="text" name="username" id="username" value="<?= $inputs['username'] ?? '' ?>" required
        class="<?= error_class($errors, 'username') ?>">
        <small><?= $errors['username'] ?? '' ?></small>
        <label for="username">Username:</label>
        </div>
      <div class="input-field">
        <input type="email" name="email" id="email" required value="<?= $inputs['email'] ?? '' ?>"
        class="<?= error_class($errors, 'email') ?>">
        <small><?= $errors['email'] ?? '' ?></small>
        <label for="email">Email:</label>
        </div>
      <div class="input-field">
        <input type="password" name="password" id="password" required value="<?= $inputs['password'] ?? '' ?>"
        class="<?= error_class($errors, 'password') ?>">
        <small><?= $errors['password'] ?? '' ?></small>
        <label for="password">Password:</label>
        </div>
      <div class="input-field">
        <input type="password" name="password2" id="password2" required value="<?= $inputs['password2'] ?? '' ?>"
               class="<?= error_class($errors, 'password2') ?>">
        <small><?= $errors['password2'] ?? '' ?></small> 
        <label for="password2">Password Again:</label>
      </div>
        
      <div id="tos">
      <label for="agree">  
      <input type="checkbox" name="agree" class="agree" id="box" value="checked" required <?= $inputs['agree'] ?? '' ?> /> 
        <p id="white-text">I agree with the            
        <a href="../src/egyebek/TOS.html" title="term of services">term of services</a></p>
        </label>
        <small><?= $errors['agree'] ?? '' ?></small>
      </div>

    <button type="submit" id="button">Register</button>
    <div class="register">
        <p>You already have an account? <a href="login.php">Log in</a></p>
      </div>
    </form>
  </div>
<?php view('footer') ?>