<?php

	include 'conexion.php';
	
	$id = $_POST['id'];
    $nombre = $_POST['nombre'];
   

	
	
	$connect->query("UPDATE categoria SET nombre='".$nombre."'  WHERE id=". $id);

?>