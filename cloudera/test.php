<?php
/**
 * Created by PhpStorm.
 * User: miroslavcillik
 * Date: 07/12/15
 * Time: 17:42
 */

try {

    $host = '';
    $port = '';
    $database = '';
    $username = '';
    $password = '';

    $pdo = new \PDO("odbc:DSN=MyImpala;HOST=$host;PORT=$port;Database=$database;UID=$username;PWD=$password", $username, $password);

    var_dump($pdo);

} catch (\Exception $e) {
    echo $e->getMessage();
    exit;
}
