<?php

require_once "conexion.php";
	$conexion=conexion();

$queryResult=$conexion->query("SELECT * FROM categoria");

$result=array();

while($fetchData=$queryResult->fetch_assoc()){
	$result[]=$fetchData;
}

echo json_encode($result);

?>
