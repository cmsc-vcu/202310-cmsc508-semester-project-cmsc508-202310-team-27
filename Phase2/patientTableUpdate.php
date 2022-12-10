
<form method="post" action="" name="signup-form">
    <link rel="stylesheet" href="css/registrationstyle.css">
    <div class="form-element">
    <label>Patient_ID</label>
    <input type="text" name="Patient_ID" required />
    </div>
    <div class="form-element">
    <label>Update Patient_first_name</label>
    <input type="text" name="Patient_first_name" required />
    </div>
    <div class="form-element">
    <label>Update Patient_last_name</label>
    <input type="text" name="Patient_last_name" required />
    </div>
    <div class="form-element">
    <label>Update Patient_gender</label>
    <input type="text" name="Patient_gender" required />
    </div>
    <div class="form-element">
    <label>Update Patient_age</label>
    <input type="text" name="Patient_age" required />
    </div>
    <div class="form-element">
    <label>Update Patient_ethnicity</label>
    <input type="text" name="Patient_ethnicity" required />
    </div>
    <div class="form-element">
    <label>Update Patient_socioeconomic_status</label>
    <input type="text" name="Patient_socioeconomic_status" required />
    </div>
    <button type="submit" name="register" value="register">Update</button>
</form>
<?php
    include('Config.php');
    if (isset($_POST['register'])) {
        $Patient_ID = (int) $_POST['Patient_ID'];
        $Patient_first_name = $_POST['Patient_first_name'];
        $Patient_last_name = $_POST['Patient_last_name'];
        $Patient_gender = $_POST['Patient_gender'];
        $Patient_age = (int) $_POST['Patient_age'];
        $Patient_ethnicity = $_POST['Patient_ethnicity'];
        $Patient_socioeconomic_status = $_POST['Patient_socioeconomic_status'];
        $query = $connection->prepare("SELECT * FROM Patient WHERE Patient_ID=:Patient_ID");
        $query->bindParam("Patient_ID", $Patient_ID, PDO::PARAM_STR);
        $query->execute();
        $result = $query->fetch(PDO::FETCH_ASSOC);
        if ($result) {
            $query = $connection->prepare("UPDATE Patient SET Patient_first_name=:Patient_first_name, Patient_last_name=:Patient_last_name, Patient_gender=:Patient_gender,Patient_age=:Patient_age,Patient_ethnicity=:Patient_ethnicity,Patient_socioeconomic_status=:Patient_socioeconomic_status WHERE Patient_ID=:Patient_ID");
            $query->bindParam("Patient_ID", $Patient_ID, PDO::PARAM_STR);
            $query->bindParam("Patient_first_name", $Patient_first_name, PDO::PARAM_STR);
            $query->bindParam("Patient_last_name", $Patient_last_name, PDO::PARAM_STR);
            $query->bindParam("Patient_gender", $Patient_gender, PDO::PARAM_STR);
            $query->bindParam("Patient_age", $Patient_age, PDO::PARAM_INT);
            $query->bindParam("Patient_ethnicity", $Patient_ethnicity, PDO::PARAM_STR);
            $query->bindParam("Patient_socioeconomic_status", $Patient_socioeconomic_status, PDO::PARAM_STR);
            $query->execute();
            echo '<p Patient Information sucessefully updated</p>';    
        }
        else {
            echo '<p class="error">Patient does not exist</p>';
        }
    }
?>