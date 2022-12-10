
<form method="post" action="" name="signup-form">
<link rel="stylesheet" href="css/registrationstyle.css">
<div class="form-element">
<label>Medical_Check_up_ID</label>
<input type="text" name="Medical_Check_up_ID" required />
</div>
<div class="form-element">
<label>Medical_Check_up_date</label>
<input type="text" name="Medical_Check_up_date" required />
</div>
<div class="form-element">
<label>Medical_Check_up_time</label>
<input type="text" name="Medical_Check_up_time" required />
</div>
<div class="form-element">
<label>Medical_Check_up_reason</label>
<input type="text" name="Medical_Check_up_reason" required />
</div>
<div class="form-element">
<label>Medical_Check_up_documentation</label>
<input type="text" name="Medical_Check_up_documentation" required />
</div>
<button type="submit" name="register" value="register">Insert</button>
</form>
<?php
    include('Config.php');
    if (isset($_POST['register'])) {
        $Medical_Check_up_ID = $_POST['Medical_Check_up_ID'];
        $Medical_Check_up_date = $_POST['Medical_Check_up_date'];
        $Medical_Check_up_time = $_POST['Medical_Check_up_time'];
        $Medical_Check_up_reason = $_POST['Medical_Check_up_reason'];
        $Medical_Check_up_documentation = $_POST['Medical_Check_up_documentation'];
        $query = $connection->prepare("SELECT * FROM Medical_Check_up WHERE Medical_Check_up_ID=:Medical_Check_up_ID");
        $query->bindParam("Medical_Check_up_ID", $Medical_Check_up_ID, PDO::PARAM_STR);
        $query->execute();
        if ($query->rowCount() > 0) {
            echo '<p class="error">This Medical_Check_up_ID already exists!</p>';
        }
        if ($query->rowCount() == 0) {
            $query = $connection->prepare("INSERT INTO Medical_Check_up(Medical_Check_up_ID, Medical_Check_up_date, Medical_Check_up_time, Medical_Check_up_reason, Medical_Check_up_documentation) VALUES (:Medical_Check_up_ID,:Medical_Check_up_date,:Medical_Check_up_time,:Medical_Check_up_reason,:Medical_Check_up_documentation)");
            $query->bindParam("Medical_Check_up_ID", $Medical_Check_up_ID, PDO::PARAM_STR);
            $query->bindParam("Medical_Check_up_date", $Medical_Check_up_date, PDO::PARAM_STR);
            $query->bindParam("Medical_Check_up_time", $Medical_Check_up_time, PDO::PARAM_STR);
            $query->bindParam("Medical_Check_up_reason", $Medical_Check_up_reason, PDO::PARAM_STR);
            $query->bindParam("Medical_Check_up_documentation", $Medical_Check_up_documentation, PDO::PARAM_STR);
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
