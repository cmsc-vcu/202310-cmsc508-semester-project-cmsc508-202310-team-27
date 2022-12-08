<!-- 
    Logging users in.
    This checks the information in the 
    database to see if the username and password combination entered into the form 
    is correct.
-->
<?php
// Start the session
session_start();
?>


<div class="page-header">
	<h1 style=color:black >Login for database</h1>
    <link rel="stylesheet" href="css/loginstyle.css">
</div>
<form method="post" action="" name="signin-form">
  <div class="form-element">
    <label>Username</label>
    <input type="text" name="username" pattern="[a-zA-Z0-9]+" required />
  </div>
  <div class="form-element">
    <label>Password</label>
    <input type="password" name="password" required />
  </div>
  <button type="submit" name="login" value="login">Log In</button>

</form>


<?php
    include('Config.php');
    if (isset($_POST['login'])) {
        $username = $_POST['username'];
        $password = $_POST['password'];
        $query = $connection->prepare("SELECT * FROM Users WHERE username=:username");
        $query->bindParam("username", $username, PDO::PARAM_STR);
        $query->execute();
        $result = $query->fetch(PDO::FETCH_ASSOC);
        if (!$result) {
            echo '<p class="error">Username and password combination is wrong!</p>';
        } else {
            if ($password==$result['password']) {
                $_SESSION['role'] = $result['role'];
                echo '<p class="success">Congratulations, you are logged in!</p>';
                if($_SESSION['role']=='admin'){
                    header("Location: admin.php");
                }
                if($_SESSION['role']=='doctor'){
                    header("Location: doctor.php");
                 }
                if($_SESSION['role']=='patient'){
                    header("Location: patient.php");
                }
            } 
            else {
                echo '<p class="error">Username and password combination is wrong!</p>';
            }
        }
    }
?>



