
<form method="post" action="" name="signup-form">
    <link rel="stylesheet" href="css/registrationstyle.css">
    <div class="form-element">
    <label>Username</label>
    <input type="text" name="username" required />
    </div>
    <button type="submit" name="register" value="register">Delete</button>
</form>
<?php
    include('Config.php');
    if (isset($_POST['register'])) {
        $username =  $_POST['username'];
        $query = $connection->prepare("SELECT * FROM Users WHERE username=:username");
        $query->bindParam("username", $username, PDO::PARAM_STR);
        $query->execute();
        $result = $query->fetch(PDO::FETCH_ASSOC);
        if ($result) {
            $query = $connection->prepare("DELETE FROM Users WHERE username=:username");
            $query->bindParam("username", $username, PDO::PARAM_STR);
            $query->execute();
            echo '<p User sucessefully deleted</p>';    
        }
        else {
            echo '<p class="error">User does not exist</p>';
        }
    }
?>