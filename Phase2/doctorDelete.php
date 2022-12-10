
<form method="post" action="" name="signup-form">
    <link rel="stylesheet" href="css/registrationstyle.css">
    <div class="form-element">
    <label>Doctor_ID</label>
    <input type="text" name="Doctor_ID" required />
    </div>
    <button type="submit" name="register" value="register">Delete</button>
</form>
<?php
    include('Config.php');
    if (isset($_POST['register'])) {
        $Doctor_ID = (int) $_POST['Doctor_ID'];
        $query = $connection->prepare("SELECT * FROM Doctor WHERE Doctor_ID=:Doctor_ID");
        $query->bindParam("Doctor_ID", $Doctor_ID, PDO::PARAM_STR);
        $query->execute();
        $result = $query->fetch(PDO::FETCH_ASSOC);
        if ($result) {
            $query = $connection->prepare("DELETE FROM Doctor WHERE Doctor_ID=:Doctor_ID");
            $query->bindParam("Doctor_ID", $Doctor_ID, PDO::PARAM_STR);
            $query->execute();
            echo '<p Doctor Information sucessefully deleted</p>';    
        }
        else {
            echo '<p class="error">Doctor does not exist</p>';
        }
    }
?>