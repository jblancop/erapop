<?php

	/* Script PHP que procesa la petición AJaX para la modificación de un recopilatorio personalizado */

	session_start(); //Al estar fuera del circuito del controlador frontal, a los archivos AJaX no les afecta el inicio de sesión del index.php

	require_once("modelos/ListasM.php");
	require_once("auxiliares/reinicio.php");

	foreach($_POST as $clave => $valor) $$clave = $valor;

	$lista = new ListasM; //Creación del objeto a partir del modelo de listas

	$lista->establecer("nombre_lista", $nombre_lista); //Caracterización del objeto para que pueda modificar la lista en la BD
	$lista->establecer("descripcion", $descripcion);
	$lista->establecer("id_lista_youtube", $id_lista_youtube);
	
	$resultado = $lista->modificar();

	if($resultado == 1) echo 1; //Si la inserción se realiza, devuelve 1
	else echo 0 //De lo contrario, 0

?>