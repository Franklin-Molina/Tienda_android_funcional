<?php


require_once "conexion.php";
$conexion=conexion();

$image= $_FILES['image']['name'];
$nombre = $_POST['nombre']; //Nombre de la img
$imagePath = "imgsave/".$image; //Ubicacion

move_uploaded_file($_FILES['image']['tmp_name'],$imagePath);
$conexion->query(("INSERT INTO imagen (nombre,img)VALUES ('".$nombre."','".$image."')"));
?>