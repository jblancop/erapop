<?php

	/* Script PHP que procesa la petición AJaX para marcar mensajes como leídos */

	session_start(); //Al estar fuera del circuito del controlador frontal, a los archivos AJaX no les afecta el inicio de sesión del index

	require_once("modelos/MensajesM.php");
	require_once("auxiliares/reinicio.php");

	$mensaje = new MensajesM; //Creación del objeto a partir del modelo de mensajes

	$mensaje->establecer("id_mensaje", $_POST["id_mensaje"]); //Caracterización del objeto para que pueda marcar como leído el comentario en la BD

	$resultado = $mensaje->marcar_leidos();

	if($resultado == 1) echo 1;
	else echo 0; //Si la modificación no se realiza (no devuelve 1), imprimir un 0 (que el script de jQuery traduce en un mensaje de error)

?>