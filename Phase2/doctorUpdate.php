
<form method="post" action="" name="signup-form">
<link rel="stylesheet" href="css/registrationstyle.css">
<div class="form-element">
<label>Doctor_ID</label>
<input type="text" name="Doctor_ID" required />
</div>
<div class="form-element">
<label>Update Doctor_name</label>
<input type="text" name="Doctor_name" required />
</div>
<div class="form-element">
<label>Update Doctor_start_date</label>
<input type="text" name="Doctor_start_date" required />
</div>
<button type="submit" name="register" value="register">Update</button>
</form>
<?php
    include('Config.php');
    if (isset($_POST['register'])) {
        $Doctor_ID = $_POST['Doctor_ID'];
        $Doctor_name = $_POST['Doctor_name'];
        $Doctor_start_date = $_POST['Doctor_start_date'];
        $query = $connection->prepare("SELECT * FROM Doctor WHERE Doctor_ID=:Doctor_ID");
        $query->bindParam("Doctor_ID", $Doctor_ID, PDO::PARAM_STR);
        $query->execute();
        if ($query->rowCount() > 0) {
            $query = $connection->prepare("UPDATE Doctor SET Doctor_name=:Doctor_name,Doctor_start_date=:Doctor_start_date WHERE Doctor_ID=:Doctor_ID");
            $query->bindParam("Doctor_ID", $Doctor_ID, PDO::PARAM_STR);
            $query->bindParam("Doctor_name", $Doctor_name, PDO::PARAM_STR);
            $query->bindParam("Doctor_start_date", $Doctor_start_date, PDO::PARAM_STR);
            $result = $query->execute();
            if ($result) {
                echo '<p class="error">It worked</p>';
            } 
            else {
                echo '<p class="error">Something went wrong!</p>';
            }
        }
        
        }
?>
