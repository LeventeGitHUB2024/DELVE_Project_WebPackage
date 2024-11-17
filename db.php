<?php

const DB_HOST = 'localhost';
const DB_NAME = 'auth'; // Az adatbázis neve
const DB_USER = 'root'; // Az adatbázis felhasználó
const DB_PASSWORD = ''; // Az adatbázis jelszava

function db(): PDO
{
    static $pdo;

    if (!$pdo) {
        $pdo = new PDO(
            sprintf("mysql:host=%s;dbname=%s;charset=UTF8", DB_HOST, DB_NAME),
            DB_USER,
            DB_PASSWORD,
            [PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION]
        );
    }

    return $pdo;
}
?>