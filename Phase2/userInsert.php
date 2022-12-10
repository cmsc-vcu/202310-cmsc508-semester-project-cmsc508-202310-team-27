
<form method="post" action="" name="signup-form">
<link rel="stylesheet" href="css/registrationstyle.css">
<div class="form-element">
<label>Username</label>
<input type="text" name="username" pattern="[a-zA-Z0-9]+" required />
</div>
<div class="form-element">
<label>Role</label>
<input type="text" name="role" required />
</div>
<div class="form-element">
<label>Password</label>
<input type="password" name="password" required />
</div>
<button type="submit" name="register" value="register">Register</button>
</form>
<?php
    include('Config.php');
    if (isset($_POST['register'])) {
        $username = $_POST['username'];
        $role = $_POST['role'];
        $password = $_POST['password'];
        $query = $connection->prepare("SELECT * FROM Users WHERE username=:username");
        $query->bindParam("username", $username, PDO::PARAM_STR);
        $query->execute();
        if ($query->rowCount() > 0) {
            echo '<p class="error">This username is already exists!</p>';
        }
        if ($query->rowCount() == 0) {
            $query = $connection->prepare("INSERT INTO Users(username,password,role) VALUES (:username,:password,:role)");
            $query->bindParam("username", $username, PDO::PARAM_STR);
            $query->bindParam("password", $password, PDO::PARAM_STR);
            $query->bindParam("role", $role, PDO::PARAM_STR);
            $result = $query->execute();
            if ($result) {
                echo '<p class="error">It worked</p>';
            } 
            else {
                echo '<p class="error">Something went wrong!</p>';
            }
        }
    }
?>
