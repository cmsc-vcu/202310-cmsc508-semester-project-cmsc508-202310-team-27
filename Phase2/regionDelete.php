
<form method="post" action="" name="signup-form">
    <link rel="stylesheet" href="css/registrationstyle.css">
    <div class="form-element">
    <label>Region_country_code</label>
    <input type="text" name="Region_country_code" required />
    </div>
    <button type="submit" name="register" value="register">Delete</button>
</form>
<?php
    include('Config.php');
    if (isset($_POST['register'])) {
        $Region_country_code =  $_POST['Region_country_code'];
        $query = $connection->prepare("SELECT * FROM Region WHERE Region_country_code=:Region_country_code");
        $query->bindParam("Region_country_code", $Region_country_code, PDO::PARAM_STR);
        $query->execute();
        $result = $query->fetch(PDO::FETCH_ASSOC);
        if ($result) {
            $query = $connection->prepare("DELETE FROM Region WHERE Region_country_code=:Region_country_code");
            $query->bindParam("Region_country_code", $Region_country_code, PDO::PARAM_STR);
            $query->execute();
            echo '<p Region Information sucessefully deleted</p>';    
        }
        else {
            echo '<p class="error">Region does not exist</p>';
        }
    }
?>