<!-- Connect to the database -->

<?php
    define('USER', 'alimm3');
    define('PASSWORD', 'password');
    define('HOST', 'cmsc508.com');
    define('DATABASE', '202310_users_alimm3');
    try {
        $connection = new PDO("mysql:host=".HOST.";dbname=".DATABASE, USER, PASSWORD);
    } catch (PDOException $e) {
        exit("Error: " . $e->getMessage());
    }
?>
