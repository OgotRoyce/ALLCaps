<?php

include 'db_connect.php';

$id = isset($_POST['id']) ? $_POST['id'] : '';
$name = isset($_POST['name']) ? $_POST['name'] : '';
$due_date = isset($_POST['due_date']) ? date('Y-m-d', strtotime($_POST['due_date'])) : '';
$description = isset($_POST['description']) ? $_POST['description'] : '';
$user_ids = isset($_POST['user_ids']) ? implode(',', $_POST['user_ids']) : '';

$file_uploaded = 0;
if (isset($_FILES['file']) && $_FILES['file']['size'] > 0) {
  $ext = strtolower(pathinfo($_FILES['file']['name'], PATHINFO_EXTENSION));
  $allowed_exts = ['pdf', 'doc', 'docx', 'xls', 'xlsx', 'ppt', 'pptx', 'jpg', 'jpeg', 'png'];
  if (in_array($ext, $allowed_exts)) {
    $target_dir = "uploads/";
    $target_file = $target_dir . basename($_FILES["file"]["name"]);
    $uploadOk = 1;
    if (move_uploaded_file($_FILES["file"]["tmp_name"], $target_file)) {
      $file_uploaded = 1;
      $description .= "\n\nFile: " . $target_file;
    } else {
      echo "Sorry, there was an error uploading your file.";
      exit();
    }
  } else {
    echo "Sorry, only PDF, Word, Excel, PowerPoint, and image files are allowed.";
    exit();
  }
}


// Update task in the database
$sql = "UPDATE `task_list` SET `name`='$name',`due_date`='$due_date',`description`='$description',`user_ids`='$user_ids' WHERE `id`='$id';";
if ($conn->query($sql) === TRUE) {
  echo "Task updated successfully.";

  // Fetch all tasks from the database and display them
  $sql = "SELECT * FROM `task_list`;";
  $result = $conn->query($sql);

  if ($result->num_rows > 0) {
    // output data of each row
    while ($row = $result->fetch_assoc()) {
      echo "id: " . $row["id"] . " - Name: " . $row["name"] . " - Due Date: " . $row["due_date"] . "<br>";
    }
  } else {
    echo "0 results";
  }
} else {
  echo "Error updating task: " . $conn->error;
}

$conn->close();
include 'new_task.php';
?>