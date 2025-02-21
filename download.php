<?php

$file = 'importált_masikbol/Delve_BETA.zip';

if(file_exists($file)){
    header('Content-Description: File Transfer');
    header('Content-Type: application/zip');
    header('Content-Disposition: attachment; filename="' . basename($file) .'"');
    header('Content-Length: ' . filesize($file));
    header('Cache-Control: no-cache, no-store, must-revalidate');
    header('Pragma: no-cache');
    header('Expires: 0');

    readfile($file);
    exit;

} else {
echo 'A fájl nem található';
}

?>