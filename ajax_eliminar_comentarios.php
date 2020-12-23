<?php

	/* Script PHP que procesa la petición AJaX para la eliminación de comentarios ya publicados */

	session_start(); //Al estar fuera del circuito del controlador frontal, a los archivos AJaX no les afecta el inicio de sesión del index

	require_once("modelos/ComentariosM.php");
	require_once("auxiliares/reinicio.php");

	$comentario = new ComentariosM; //Creación del objeto a partir del modelo de comentarios

	$comentario->establecer("id_comentario", $_POST["id_comentario"]); //Caracterización del objeto para que pueda marcar como eliminado el comentario en la BD

	$resultado = $comentario->eliminar();

	if($resultado == 1) echo 1;
	else echo 0; //Si la modificación no se realiza (no devuelve 1), imprimir un 0 (que el script de jQuery traduce en un mensaje de error)

?>