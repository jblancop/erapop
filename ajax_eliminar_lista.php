<?php

	/* Script PHP que procesa la petición AJaX para la eliminación de listas */

	session_start(); //Al estar fuera del circuito del controlador frontal, a los archivos AJaX no les afecta el inicio de sesión del index

	require_once("modelos/ListasM.php");
	require_once("auxiliares/reinicio.php");

	$lista = new ListasM; //Creación del objeto a partir del modelo de listas

	$lista->establecer("id_lista_youtube", $_POST["id_lista_youtube"]); //Caracterización del objeto para que pueda eliminar tanto las canciones de la lista como la lista en sí

	$resultado = $lista->eliminar_canciones();

	if($resultado == 1) //Si se eliminan todas las canciones
	{
		$resultado = $lista->eliminar(); //Se procede a eliminar la lista en sí

		if($resultado == 1) echo 1;
		else echo 0; //Si la eliminación no se realiza (no devuelve 1), imprimir un 0 (que el script de jQuery traduce en un mensaje de error)

	}
	else echo 0;

?>