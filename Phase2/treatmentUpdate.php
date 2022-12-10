
<form method="post" action="" name="signup-form">
    <link rel="stylesheet" href="css/registrationstyle.css">
    <div class="form-element">
    <label>Treatment_ID</label>
    <input type="text" name="Treatment_ID" required />
    </div>
    <div class="form-element">
    <label>Update Treatment_stage</label>
    <input type="text" name="Treatment_stage" required />
    </div>
    <div class="form-element">
    <label>Update Treatment_cost</label>
    <input type="text" name="Treatment_cost" required />
    </div>
    <div class="form-element">
    <label>Update Treatment_option</label>
    <input type="text" name="Treatment_option" required />
    </div>
    <button type="submit" name="register" value="register">Update</button>
</form>
<?php
    include('Config.php');
    if (isset($_POST['register'])) {
        $Treatment_ID =  $_POST['Treatment_ID'];
        $Treatment_stage = $_POST['Treatment_stage'];
        $Treatment_cost = $_POST['Treatment_cost'];
        $Treatment_option = $_POST['Treatment_option'];
        $query = $connection->prepare("SELECT * FROM Treatment WHERE Treatment_ID=:Treatment_ID");
        $query->bindParam("Treatment_ID", $Treatment_ID, PDO::PARAM_STR);
        $query->execute();
        $result = $query->fetch(PDO::FETCH_ASSOC);
        if ($result) {
            $query = $connection->prepare("UPDATE Treatment SET Treatment_stage=:Treatment_stage, Treatment_cost=:Treatment_cost, Treatment_option=:Treatment_option WHERE Treatment_ID=:Treatment_ID");
            $query->bindParam("Treatment_ID", $Treatment_ID, PDO::PARAM_STR);
            $query->bindParam("Treatment_stage", $Treatment_stage, PDO::PARAM_STR);
            $query->bindParam("Treatment_cost", $Treatment_cost, PDO::PARAM_STR);
            $query->bindParam("Treatment_option", $Treatment_option, PDO::PARAM_STR);
            $query->execute();
            echo '<p Patient Information sucessefully updated</p>';    
        }
        else {
            echo '<p class="error">Patient does not exist</p>';
        }
    }
?>