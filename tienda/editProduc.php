<?php

	include 'conexion.php';
	
	$id = $_POST['id'];
    $nombre = $_POST['nombre'];
    $precio = $_POST['precio'];
    $descripcion = $_POST['descripcion'];
    $categoria = $_POST['id_categoria_produto'];
   // $imagen=addslashes(file_get_contents($_FILES['imagen']['tmp_name']));
//Por agregar imagen

	
	
	$connect->query("UPDATE productos SET nombre='".$nombre."', precio='".$precio."', 
    descripcion='".$descripcion."',id_categoria_produto='".$categoria."'   WHERE id=". $id);

?>