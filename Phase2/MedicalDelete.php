
<form method="post" action="" name="signup-form">
    <link rel="stylesheet" href="css/registrationstyle.css">
    <div class="form-element">
    <label>Medical_Check_up_ID</label>
    <input type="text" name="Medical_Check_up_ID" required />
    </div>
    <button type="submit" name="register" value="register">Delete</button>
</form>
<?php
    include('Config.php');
    if (isset($_POST['register'])) {
        $Medical_Check_up_ID = (int) $_POST['Medical_Check_up_ID'];
        $query = $connection->prepare("SELECT * FROM Medical_Check_up WHERE Medical_Check_up_ID=:Medical_Check_up_ID");
        $query->bindParam("Medical_Check_up_ID", $Medical_Check_up_ID, PDO::PARAM_STR);
        $query->execute();
        $result = $query->fetch(PDO::FETCH_ASSOC);
        if ($result) {
            $query = $connection->prepare("DELETE FROM Medical_Check_up WHERE Medical_Check_up_ID=:Medical_Check_up_ID");
            $query->bindParam("Medical_Check_up_ID", $Medical_Check_up_ID, PDO::PARAM_STR);
            $query->execute();
            echo '<p Check up Information sucessefully deleted</p>';    
        }
        else {
            echo '<p class="error">Checkup does not exist</p>';
        }
    }
?>