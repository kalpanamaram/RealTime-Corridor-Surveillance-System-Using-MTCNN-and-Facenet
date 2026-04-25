<?php 
session_start();

$conn = new mysqli("localhost","root","","face_surveillance");

if($conn->connect_error){
    die("Connection failed");
}

if(isset($_POST['login'])){
    $username = $_POST['username'];
    $password = $_POST['password'];

    $query = "SELECT * FROM users WHERE username='$username' AND password='$password'";
    $result = $conn->query($query);

    if($result->num_rows > 0){
        $_SESSION['user'] = $username;
        header("Location: dashboard.php");
        exit();
    }else{
        $error = "Invalid Username or Password!";
    }
}
?>

<!DOCTYPE html>
<html>
<head>
<title>Login</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">

<style>
body{
    background:#f4f6f8;
}

.header{
    background:#2c3e50;
    color:white;
    padding:15px;
    text-align:center;
}

.footer{
    background:#2c3e50;
    color:white;
    text-align:center;
    padding:10px;
    position:fixed;
    bottom:0;
    width:100%;
}

.login-box{
    width:100%;
    max-width:350px;
    padding:30px;
    border-radius:12px;
    box-shadow:0 10px 25px rgba(0,0,0,0.1);
    background:white;
}
</style>

</head>

<body>

<!-- HEADER -->
<div class="header">
    <h4>AI Corridor Monitoring System</h4>
</div>

<!-- LOGIN -->
<div class="d-flex justify-content-center align-items-center" style="height:80vh;">
    <div class="login-box">

        <h5 class="text-center mb-3">Login into your account</h5>

        <?php if(isset($error)) echo "<p class='text-danger'>$error</p>"; ?>

        <form method="POST">
            <input class="form-control mb-3" type="text" name="username" placeholder="Username" required>
            <input class="form-control mb-3" type="password" name="password" placeholder="Password" required>
            <button class="btn btn-dark w-100" name="login">Login</button>
        </form>

    </div>
</div>

<!-- FOOTER -->
<div class="footer">
    Final Year Project — AI Based Corridor Surveillance
</div>

</body>
</html>