
<?php
    $USER = 'cameroruizla';
    $PASSWORD = 'Shout4_cameroruizla_GOME';
    $HOST = 'cmsc508.com';
    $DATABASE = '202310_users_cameroruizla';
    try {
        $connection = mysqli_connect($HOST,$USER, $PASSWORD, $DATABASE);
    } catch (PDOException $e) {
        exit("Error: " . $e->getMessage());
    }
?>