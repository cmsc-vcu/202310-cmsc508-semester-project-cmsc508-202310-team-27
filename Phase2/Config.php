<!-- Connect to the database -->

<?php
    define('USER', 'team27');
    define('PASSWORD', 'Shout4_team27_GOTEAM');
    define('HOST', 'cmsc508.com');
    define('DATABASE', '202310_teams_team27');
    try {
        $connection = new PDO("mysql:host=".HOST.";dbname=".DATABASE, USER, PASSWORD);
    } catch (PDOException $e) {
        exit("Error: " . $e->getMessage());
    }
?>