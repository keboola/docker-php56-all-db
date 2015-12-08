<?php
/**
 * Created by PhpStorm.
 * User: miroslavcillik
 * Date: 07/12/15
 * Time: 17:42
 */

try {

    $pdo = new \PDO("odbc:DSN=MyImpala;","keboola",'PRaDe4$c');

    var_dump($pdo);

} catch (\Exception $e) {
    echo $e->getMessage();
    exit;
}
