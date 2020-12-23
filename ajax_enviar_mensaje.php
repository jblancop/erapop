<?php

	/* Script PHP que procesa la petición AJaX para enviar mensajes privados */

	session_start(); //Al estar fuera del circuito del controlador frontal, a los archivos AJax no les afecta el inicio de sesión del index

	require_once("modelos/MensajesM.php");

	foreach($_POST as $clave => $valor) $$clave = $valor;

	$mensaje = new MensajesM; //Creación del objeto a partir del modelo de mensajes

	$mensaje->establecer("id_emisor", $id_emisor); //Caracterización del objeto para que pueda insertar el mensaje en la BD
	$mensaje->establecer("id_receptor", $id_receptor);
	$mensaje->establecer("texto", $texto);
	
	$resultado = $mensaje->insertar();

	if($resultado == 1) echo 1;
	else echo 0; //Si la inserción no se realiza (no devuelve 1), imprimir un 0 (que el script de jQuery traduce en un mensaje de error)

?>