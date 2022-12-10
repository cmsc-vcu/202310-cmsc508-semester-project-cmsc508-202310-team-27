
<?php
    $USER = 'team27';
    $PASSWORD = 'Shout4_team27_GOTEAM';
    $HOST = 'cmsc508.com';
    $DATABASE = '202310_teams_team27';
    try {
        $connection = mysqli_connect($HOST,$USER, $PASSWORD, $DATABASE);
    } catch (PDOException $e) {
        exit("Error: " . $e->getMessage());
    }
?>