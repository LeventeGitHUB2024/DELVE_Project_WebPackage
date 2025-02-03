<?php

const DB_HOST = 'https://mysqladmin-pub.nethely.hu/';
const DB_NAME = 'delvemain'; // Az adatbázis neve
const DB_USER = 'delvemain'; // Az adatbázis felhasználó
const DB_PASSWORD = 'swaws123//'; // Az adatbázis jelszava

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