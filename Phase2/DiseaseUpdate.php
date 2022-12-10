
<form method="post" action="" name="signup-form">
    <link rel="stylesheet" href="css/registrationstyle.css">
    <div class="form-element">
    <label>Disease_ID</label>
    <input type="text" name="Disease_ID" required />
    </div>
    <div class="form-element">
    <label>Update Disease_name</label>
    <input type="text" name="Disease_name" required />
    </div>
    <div class="form-element">
    <label>Update Disease_type</label>
    <input type="text" name="Disease_type" required />
    </div>
    <div class="form-element">
    <label>Update Disease_stage</label>
    <input type="text" name="Disease_stage" required />
    </div>
    <div class="form-element">
    <label>Update Disease_transmission</label>
    <input type="text" name="Disease_transmission" required />
    </div>
    <div class="form-element">
    <label>Update Disease_communicable</label>
    <input type="text" name="Disease_communicable" required />
    </div>
    <div class="form-element">
    <label>Update Disease_fatality</label>
    <input type="text" name="Disease_fatality" required />
    </div>
    <button type="submit" name="register" value="register">Update</button>
</form>
<?php
    include('Config.php');
    if (isset($_POST['register'])) {
        $Disease_ID = (int) $_POST['Disease_ID'];
        $Disease_name = $_POST['Disease_name'];
        $Disease_type = $_POST['Disease_type'];
        $Disease_stage = $_POST['Disease_stage'];
        $Disease_transmission = (int) $_POST['Disease_transmission'];
        $Disease_communicable = $_POST['Disease_communicable'];
        $Disease_fatality = $_POST['Disease_fatality'];
        $query = $connection->prepare("SELECT * FROM Disease WHERE Disease_ID=:Disease_ID");
        $query->bindParam("Disease_ID", $Disease_ID, PDO::PARAM_STR);
        $query->execute();
        $result = $query->fetch(PDO::FETCH_ASSOC);
        if ($result) {
            $query = $connection->prepare("UPDATE Disease SET Disease_name=:Disease_name, Disease_type=:Disease_type, Disease_stage=:Disease_stage,Disease_transmission=:Disease_transmission,Disease_communicable=:Disease_communicable,Disease_fatality=:Disease_fatality WHERE Disease_ID=:Disease_ID");
            $query->bindParam("Disease_ID", $Disease_ID, PDO::PARAM_STR);
            $query->bindParam("Disease_name", $Disease_name, PDO::PARAM_STR);
            $query->bindParam("Disease_type", $Disease_type, PDO::PARAM_STR);
            $query->bindParam("Disease_stage", $Disease_stage, PDO::PARAM_STR);
            $query->bindParam("Disease_transmission", $Disease_transmission, PDO::PARAM_INT);
            $query->bindParam("Disease_communicable", $Disease_communicable, PDO::PARAM_STR);
            $query->bindParam("Disease_fatality", $Disease_fatality, PDO::PARAM_STR);
            $query->execute();
            echo '<p Patient Information sucessefully updated</p>';    
        }
        else {
            echo '<p class="error">Patient does not exist</p>';
        }
    }
?>