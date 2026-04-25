<?php
session_start();
if(!isset($_SESSION['user'])){
    header("Location: login.php");
    exit();
}

$conn = new mysqli("localhost","root","","face_surveillance");

if($conn->connect_error){
    die("Database connection failed");
}

$result = $conn->query("SELECT * FROM corridor_violations ORDER BY detected_time DESC");
?>

<!DOCTYPE html>
<html>
<head>
<title>Corridor Monitoring Dashboard</title>

<style>

body{
font-family: Arial;
background:#f4f6f8;
margin:0;
}

.header{
background:#2c3e50;
color:white;
padding:15px;
display:flex;
align-items:center;
justify-content:center;
}

.header img{
height:50px;
margin-right:15px;
}

h1{
text-align:center;
margin:20px 0;
color:#2c3e50;
}

table{
margin:auto;
border-collapse: collapse;
width:90%;
background:white;
box-shadow:0px 0px 10px rgba(0,0,0,0.1);
}

th, td{
border:1px solid #ddd;
padding:12px;
text-align:center;
}

th{
background:#2c3e50;
color:white;
}

img{
border-radius:6px;
}

.count-box{
margin:20px auto;
padding:10px;
background:#3498db;
color:white;
display:block;
width:200px;
text-align:center;
border-radius:8px;
}

.footer{
margin-top:40px;
background:#2c3e50;
color:white;
text-align:center;
padding:10px;
font-size:14px;
}

</style>

</head>

<body>

<!-- HEADER -->
<div class="header">
<img src="logo.png" alt="Logo">
<h2>AI Corridor Monitoring System</h2>
</div>

<h1>Corridor Monitoring Dashboard</h1>

<?php
$count = $conn->query("SELECT COUNT(*) as total FROM corridor_violations");
$row = $count->fetch_assoc();
?>

<div class="count-box">
Total Violations: <?php echo $row['total']; ?>
</div>
<div style="text-align:center; margin:20px;">
<a href="timetable.php">
<button style="padding:10px 20px; background:#e67e22; color:white; border:none; border-radius:6px;">
📅 Manage Timetable
</button>
</a>
</div>

<table>

<tr>
<th>Original Photo</th>
<th>Roll No</th>
<th>Name</th>
<th>Subject</th>
<th>Detected Time</th>
<th>Annoted Frame</th>
</tr>

<?php while($r=$result->fetch_assoc()){ ?>

<tr>

<td>
<img src="<?php echo $r['image_path']; ?>" width="80">
</td>

<td><?php echo $r['roll_no']; ?></td>
<td><?php echo $r['name']; ?></td>
<td><?php echo $r['subject']; ?></td>
<td><?php echo $r['detected_time']; ?></td>

<td>
<?php if(!empty($r['augmented_path'])) { ?>
    <a href="<?php echo $r['augmented_path']; ?>" target="_blank">
        <img src="<?php echo $r['augmented_path']; ?>" width="80">
    </a>
<?php } else { ?>
    No Image
<?php } ?>
</td>

</tr>

<?php } ?>

</table>

<!-- FOOTER -->
<div class="footer">
Final Year Project — AI Based Corridor Surveillance | Developed for Monitoring Student Movement
</div>

</body>
</html>
