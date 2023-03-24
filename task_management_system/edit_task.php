<?php
include 'db_connect.php';
$id = $_GET['id'];
$qry = $conn->query("SELECT * FROM task_list where id = ".$id)->fetch_array();
foreach($qry as $k => $v){
	$$k = $v;
}
include 'new_task.php';
?>
