<?php
require 'db.php';
$errors = [];

// Ellenőrizzük, hogy POST kérés érkezett-e
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $username = $_POST['username'] ?? '';
    $email = $_POST['email'] ?? '';  // Módosított mezőnév
    $password = $_POST['password'] ?? '';
    $password2 = $_POST['password2'] ?? '';

    // Felhasználónév validálása
    if (!preg_match('/[a-zA-Z0-9_]{6,20}/', $username)) {
        $errors[] = "The username can only consist of alphanumeric characters and underscores with the minimum length of at least 6 characters and a maximum of 20 characters!";
    }

    // Listát alkothatsz az ismert trashmail szolgáltatókról
    $trashmail_domains = [
    '10minutemail.com', 'guerrillamail.com', 'sharklasers.com', 'getairmail.com', 'spamgourmet.com', 'temp-mail.org', 'discard.email', 'getnada.com', 'protonmail.com', 'mailnesia.com', 'yopmail.com', 'dropmail.me', 'mailcatch.com', 'tempmailaddress.com', 'moakt.com', 'onboxed.com', 'dispostable.com', 'tempmailaddress.net', 'throwawaymail.net', 'mail-temp.com', 'jetable.org', 'guerrillamail.org', 'fakeinbox.net', 'spamex.com', 'mailinator.org', 'mailfa.tk', 'quickfakes.com', 'spambog.com', 'spamsurf.com', 'inboxbear.com', 'disposemail.com', 'trashymail.com', 'spamcatcher.com', 'mailtome.com', 'spamfree24.com', 'discardmail.com', 'slopsbox.com', 'yourmail.fun', 'byom.de', 'throwawaymailbox.com', 'tempinbox.com', 'nomail.ga', 'lastmail.com', 'privatmail.com', 'inboxdrop.com', 'dmail.org', 'instant-mail.net', 'spamsave.com', 'onlyonetime.com', 'onetimeemail.com', 'gettempmail.com', 'tmailbox.com', 'noemail.ga', 'fakee-mail.com', 'itismymail.com', 'temporarymail.org', 'safe-mail.net', 'takeemail.com', 'newtempmail.com', 'maildrop.cc', 'tempmail.org', 'fakemail.org', 'tempinbox.net', 'tempmail.io', 'disposablemail.org', 'throwawayemail.com', 'spamfilter.com', 'nospam.email', 'quicktempmail.com', 'tempinbox.co', 'dodgeit.com', 'spambob.com', 'yopmail.org', 'onetimeemailaddress.com', 'gettempmail.net', 'nomail.com', 'tempxmail.com', 'fakemailbox.net', 'webmailgenerator.com', 'tempmail.us', 'throwawayemail.net', 'yourtempemail.com', 'inbox4.me', 'spamblocker.com', 'fakeaddress.com', 'getafakeemail.com', 'spammymail.com', 'tmail.co', 'notmail.com', 'postinbox.com', 'temporaryemail.me', 'thrownmail.com', 'tempmailr.com', 'foreveremail.com', 'junkmailbox.com', 'fake-mailbox.net', 'tempmailbox.com', 'emptyemail.com', 'spamali.com', 'trashmail.de', 'mail-dump.com', 'temp-email.com', 'discardableemail.com', 'mailcatcher.com', 'inboxgenerator.com', 'spamenvoy.com','envoes.com'
    ];

    // Email validálása
    if (!filter_var($email, FILTER_VALIDATE_EMAIL)) {
        $errors[] = "Please enter a valid e-mail address format.";
    }else{
        // Email domain lekérése
        $email_domain = substr(strrchr($email, "@"), 1); // Kivágja a domain-t az email cím végéből

        // Ellenőrizze, hogy a domain szerepel-e a trashmail listában
        if (in_array($email_domain, $trashmail_domains)) {
            $errors[] = "The email address is from a disposable email provider. Please use a valid email address.";
        }

        // DNS ellenőrzés: megnézi, hogy létezik-e MX rekord a domainhez
        if (!checkdnsrr($email_domain, "MX")) {
            $errors[] = "The domain of the email address does not exist, please use an existing and valid email address.";
        }   
    }

    // Jelszó validálása
    if ($password !== $password2) { 
        $errors[] = "Both passwords need to be the same!";
    }  elseif (strlen($password) < 8 || strlen($password) > 255) {
        $errors[] = "The length of the password must be between 8 and 255 characters.";
    }  elseif (!preg_match('/[A-Z]/', $password)) {
        $errors[] = "The password must contain  at least 1 uppercase letter";
    } elseif (!preg_match('/[a-z]/', $password)) {
        $errors[] = "The password must contain  at least 1 lowercase letter";
    } elseif (!preg_match('/[0-9]/', $password)) {
        $errors[] = "The password must contain  at least 1 number";
    } elseif (!preg_match('/[^\w\s]/', $password)) {
        $errors[] = "The password must contain  at least 1 special character.";
    } 
    
    // Ellenőrzés, hogy a felhasználónév és az e-mail cím egyedi-e
    $pdo = db();

    $stmt = $pdo->prepare("SELECT * FROM players_pyr WHERE username = :username OR email = :email");     // Módosított mezőnév
    $stmt->execute(['username' => $username, 'email' => $email]);
    
    if ($stmt->fetch()) {
        $errors[] = "The username or the e-mail address is already taken!";
    }

    // Jelszó hash-elése
    $hashedPassword = password_hash($password, PASSWORD_DEFAULT);


    if (!empty($errors)) {
        session_start();
        $_SESSION['errors'] = $errors;
        $_SESSION['form_data'] = $_POST; // Űrlap adatok megőrzése
        header("Location: index.php");
        exit;
    }

    // Ha nincsenek hibák, folytatjuk a regisztrációval
    $stmt = $pdo->prepare("INSERT INTO players_pyr (username, email, password) VALUES (:username, :email, :password)");
    $stmt->execute(['username' => $username, 'email' => $email, 'password' => $hashedPassword]);
    
    // Sikeres regisztráció után átirányítás
    header("Location: login.php");
    exit;
}

// Hibák megjelenítése
foreach ($errors as $error) {
    echo "<p style='color: red;'>$error</p>";
}
?>