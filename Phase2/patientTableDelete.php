
<form method="post" action="" name="signup-form">
    <link rel="stylesheet" href="css/registrationstyle.css">
    <div class="form-element">
    <label>Patient_ID</label>
    <input type="text" name="Patient_ID" required />
    </div>
    <button type="submit" name="register" value="register">Delete</button>
</form>
<?php
    include('Config.php');
    if (isset($_POST['register'])) {
        $Patient_ID = (int) $_POST['Patient_ID'];
        $query = $connection->prepare("SELECT * FROM Patient WHERE Patient_ID=:Patient_ID");
        $query->bindParam("Patient_ID", $Patient_ID, PDO::PARAM_STR);
        $query->execute();
        $result = $query->fetch(PDO::FETCH_ASSOC);
        if ($result) {
            $query = $connection->prepare("DELETE FROM Patient WHERE Patient_ID=:Patient_ID");
            $query->bindParam("Patient_ID", $Patient_ID, PDO::PARAM_STR);
            $query->execute();
            echo '<p Patient Information sucessefully deleted</p>';    
        }
        else {
            echo '<p class="error">Patient does not exist</p>';
        }
    }
?>