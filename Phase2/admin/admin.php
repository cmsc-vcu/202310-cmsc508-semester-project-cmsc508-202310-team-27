<?php
session_start();

if(isset($_SESSION['id']) && isset($_SESSION['username'])) {
    ?>

    <!DOCTYPE html>
    <html>
    <head>

        <title>Welcome Admin</title>
        <link rel="stylesheet" type="text/css" href="style.css">
    </head>
    <body>
        <h1>Hello, <?php echo $_SESSION['user_name']; ?></h1>
        <a href="logout.php">Logout</a>
</body>
</html>

<?php
}
else {
    header("Location: index.php");
    exit;
}
?>