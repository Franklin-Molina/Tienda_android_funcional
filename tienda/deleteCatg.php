<?php
    include 'conexion.php';include 'conexion.php';
	$id=$_POST['id'];
	$connect->query("DELETE FROM categoria WHERE id=".$id);
?>