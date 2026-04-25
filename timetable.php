<?php
$conn = new mysqli("localhost","root","","face_surveillance");

if(isset($_POST['update'])){
    $id = $_POST['id'];
    $subject = $_POST['subject'];
    $start = $_POST['start_time'];
    $end = $_POST['end_time'];

    $conn->query("UPDATE timetable SET 
        subject='$subject',
        start_time='$start',
        end_time='$end'
        WHERE id=$id");
}

$result = $conn->query("SELECT * FROM timetable ORDER BY department, year");
?>

<!DOCTYPE html>
<html>
<head>
<title>Timetable</title>

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
    margin-top:30px;
}
</style>

</head>

<body>

<!-- HEADER -->
<div class="header">
    <h4>AI Corridor Monitoring System</h4>
</div>

<div class="container mt-4">

    <!-- BACK BUTTON -->
    <a href="dashboard.php" class="btn btn-secondary mb-3">
        ← Back to Dashboard
    </a>

    <h3 class="text-center">Editable Timetable</h3>

    <div class="table-responsive mt-3">
        <table class="table table-bordered text-center align-middle">

            <thead class="table-dark">
                <tr>
                    <th>Dept</th>
                    <th>Year</th>
                    <th>Section</th>
                    <th>Subject</th>
                    <th>Start</th>
                    <th>End</th>
                    <th>Action</th>
                </tr>
            </thead>

            <tbody>
            <?php while($row = $result->fetch_assoc()){ ?>
            <form method="POST">
                <tr>
                    <td><?php echo $row['department']; ?></td>
                    <td><?php echo $row['year']; ?></td>
                    <td><?php echo $row['section']; ?></td>

                    <td><input class="form-control" type="text" name="subject" value="<?php echo $row['subject']; ?>"></td>
                    <td><input class="form-control" type="time" name="start_time" value="<?php echo $row['start_time']; ?>"></td>
                    <td><input class="form-control" type="time" name="end_time" value="<?php echo $row['end_time']; ?>"></td>

                    <td>
                        <input type="hidden" name="id" value="<?php echo $row['id']; ?>">
                        <button class="btn btn-success" name="update">Update</button>
                    </td>
                </tr>
            </form>
            <?php } ?>
            </tbody>

        </table>
    </div>

</div>

<!-- FOOTER -->
<div class="footer">
    Final Year Project — AI Based Corridor Surveillance
</div>

</body>
</html>