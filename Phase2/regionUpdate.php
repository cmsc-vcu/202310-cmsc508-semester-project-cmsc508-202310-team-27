
<form method="post" action="" name="signup-form">
    <link rel="stylesheet" href="css/registrationstyle.css">
    <div class="form-element">
    <label>Region_country_code</label>
    <input type="text" name="Region_country_code" required />
    </div>
    <div class="form-element">
    <label>Update Region_Disease_ID</label>
    <input type="text" name="Region_Disease_ID" required />
    </div>
    <div class="form-element">
    <label>Update Region_country_short_name</label>
    <input type="text" name="Region_country_short_name" required />
    </div>
    <div class="form-element">
    <label>Update Region_nationality</label>
    <input type="text" name="Region_nationality" required />
    </div>
    <div class="form-element">
    <label>Update Region</label>
    <input type="text" name="Region" required />
    </div>
    <div class="form-element">
    <label>Update Region_environment</label>
    <input type="text" name="Region_environment" required />
    </div>
    <button type="submit" name="register" value="register">Update</button>
</form>
<?php
    include('Config.php');
    if (isset($_POST['register'])) {
        $Region_country_code =  $_POST['Region_country_code'];
        $Region_Disease_ID = $_POST['Region_Disease_ID'];
        $Region_country_short_name = $_POST['Region_country_short_name'];
        $Region_nationality = $_POST['Region_nationality'];
        $Region =  $_POST['Region'];
        $Region_environment = $_POST['Region_environment'];
        $query = $connection->prepare("SELECT * FROM Region WHERE Region_country_code=:Region_country_code");
        $query->bindParam("Region_country_code", $Region_country_code, PDO::PARAM_STR);
        $query->execute();
        $result = $query->fetch(PDO::FETCH_ASSOC);
        if ($result) {
            $query = $connection->prepare("UPDATE Region SET Region_Disease_ID=:Region_Disease_ID, Region_country_short_name=:Region_country_short_name, Region_nationality=:Region_nationality,Region=:Region,Region_environment=:Region_environment WHERE Region_country_code=:Region_country_code");
            $query->bindParam("Region_country_code", $Region_country_code, PDO::PARAM_STR);
            $query->bindParam("Region_Disease_ID", $Region_Disease_ID, PDO::PARAM_STR);
            $query->bindParam("Region_country_short_name", $Region_country_short_name, PDO::PARAM_STR);
            $query->bindParam("Region_nationality", $Region_nationality, PDO::PARAM_STR);
            $query->bindParam("Region", $Region, PDO::PARAM_INT);
            $query->bindParam("Region_environment", $Region_environment, PDO::PARAM_STR);
            $query->execute();
            echo '<p Patient Information sucessefully updated</p>';    
        }
        else {
            echo '<p class="error">Patient does not exist</p>';
        }
    }
?>