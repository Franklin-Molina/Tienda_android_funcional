<?php

require_once "conexion.php";
$conexion=conexion();
 

  //  $nombre = $_POST['nombre'];
    $img = $_POST['img'];
  
    $sql="INSERT INTO imagen (img)VALUES ('".$img."')";
  /*   $nombre = $_POST['nombre'];
    $img = $_POST['img'];
    

	
	
	$connect->query("INSERT INTO imagen (nombre,img) 
                        VALUES ('".$nombre."','".$img."')");
                         */

                        $image = $_POST['img'];
                        $name = $_POST['nombre'];
                        $realImage = base64_decode($image);
                        
                        file_put_contents($name,$realImage);
                        echo "OK";

?>