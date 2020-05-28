<?php

	include 'conexion.php';
	
   
    $categoria = $_POST['nombre'];

	
	
	$connect->query("INSERT INTO categoria (nombre) 
                        VALUES ('".$categoria."')")

?>