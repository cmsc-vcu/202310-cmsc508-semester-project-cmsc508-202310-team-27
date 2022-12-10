
<form method="post" action="" name="signup-form">
    <link rel="stylesheet" href="css/registrationstyle.css">
    <div class="form-element">
    <label>Disease_ID</label>
    <input type="text" name="Disease_ID" required />
    </div>
    <button type="submit" name="register" value="register">Delete</button>
</form>
<?php
    include('Config.php');
    if (isset($_POST['register'])) {
        $Disease_ID = (int) $_POST['Disease_ID'];
        $query = $connection->prepare("SELECT * FROM Disease WHERE Disease_ID=:Disease_ID");
        $query->bindParam("Disease_ID", $Disease_ID, PDO::PARAM_STR);
        $query->execute();
        $result = $query->fetch(PDO::FETCH_ASSOC);
        if ($result) {
            $query = $connection->prepare("DELETE FROM Disease WHERE Disease_ID=:Disease_ID");
            $query->bindParam("Disease_ID", $Disease_ID, PDO::PARAM_STR);
            $query->execute();
            echo '<p Doctor Information sucessefully deleted</p>';    
        }
        else {
            echo '<p class="error">Doctor does not exist</p>';
        }
    }
?>