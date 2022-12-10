
<form method="post" action="" name="signup-form">
    <link rel="stylesheet" href="css/registrationstyle.css">
    <div class="form-element">
    <label>Treatment_ID</label>
    <input type="text" name="Treatment_ID" required />
    </div>
    <button type="submit" name="register" value="register">Delete</button>
</form>
<?php
    include('Config.php');
    if (isset($_POST['register'])) {
        $Treatment_ID = (int) $_POST['Treatment_ID'];
        $query = $connection->prepare("SELECT * FROM Disease WHERE Treatment_ID=:Treatment_ID");
        $query->bindParam("Treatment_ID", $Treatment_ID, PDO::PARAM_STR);
        $query->execute();
        $result = $query->fetch(PDO::FETCH_ASSOC);
        if ($result) {
            $query = $connection->prepare("DELETE FROM Disease WHERE Treatment_ID=:Treatment_ID");
            $query->bindParam("Treatment_ID", $Treatment_ID, PDO::PARAM_STR);
            $query->execute();
            echo '<p Doctor Information sucessefully deleted</p>';    
        }
        else {
            echo '<p class="error">Doctor does not exist</p>';
        }
    }
?>