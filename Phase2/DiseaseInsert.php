
<form method="post" action="" name="signup-form">
    <link rel="stylesheet" href="css/registrationstyle.css">
    <div class="form-element">
    <label>Disease_ID</label>
    <input type="text" name="Disease_ID" required />
    </div>
    <div class="form-element">
    <label>Disease_name</label>
    <input type="text" name="Disease_name" required />
    </div>
    <div class="form-element">
    <label>Disease_type</label>
    <input type="text" name="Disease_type" required />
    </div>
    <div class="form-element">
    <label>Disease_stage</label>
    <input type="text" name="Disease_stage" required />
    </div>
    <div class="form-element">
    <label>Disease_transmission</label>
    <input type="text" name="Disease_transmission" required />
    </div>
    <div class="form-element">
    <label>Disease_communicable</label>
    <input type="text" name="Disease_communicable" required />
    </div>
    <div class="form-element">
    <label>Disease_fatality</label>
    <input type="text" name="Disease_fatality" required />
    </div>
    <button type="submit" name="register" value="register">Insert</button>
</form>
<?php
    include('Config.php');
    if (isset($_POST['register'])) {
        $Disease_ID = (int) $_POST['Disease_ID'];
        $Disease_name = $_POST['Disease_name'];
        $Disease_type = $_POST['Disease_type'];
        $Disease_stage = (int) $_POST['Disease_stage'];
        $Disease_transmission =  $_POST['Disease_transmission'];
        $Disease_communicable = $_POST['Disease_communicable'];
        $Disease_fatality = $_POST['Disease_fatality'];
        $query = $connection->prepare("SELECT * FROM Disease WHERE Disease_ID=:Disease_ID");
        $query->bindParam("Disease_ID", $Disease_ID, PDO::PARAM_STR);
        $query->execute();
        if ($query->rowCount() > 0) {
            echo '<p class="error">This patient is already in the databse!</p>';
        }
        if ($query->rowCount() == 0) {
            $query = $connection->prepare("INSERT INTO Disease(Disease_ID, Disease_name, Disease_type, Disease_stage, Disease_transmission, Disease_communicable, Disease_fatality)Values (:Disease_ID, :Disease_name, :Disease_type, :Disease_stage, :Disease_transmission, :Disease_communicable, :Disease_fatality)");
            $query->bindParam("Disease_ID", $Disease_ID, PDO::PARAM_INT);
            $query->bindParam("Disease_name", $Disease_name, PDO::PARAM_STR);
            $query->bindParam("Disease_type", $Disease_type, PDO::PARAM_STR);
            $query->bindParam("Disease_stage", $Disease_stage, PDO::PARAM_STR);
            $query->bindParam("Disease_transmission", $Disease_transmission, PDO::PARAM_INT);
            $query->bindParam("Disease_communicable", $Disease_communicable, PDO::PARAM_STR);
            $query->bindParam("Disease_fatality", $Disease_fatality, PDO::PARAM_STR);
            $result = $query->execute();
            if ($result) {
                echo '<p class="error">Data inserted!</p>';
            } else {
                echo '<p class="error">Something went wrong!</p>';
            }
        }
    }
?>