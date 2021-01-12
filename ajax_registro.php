<?php

	/* Script PHP que procesa la petición AJaX de registro de usuarios */

	session_start(); //Al estar fuera del circuito del controlador frontal, a los archivos AJax no les afecta el inicio de sesión del index

	require_once("autocargador.php");

	$usuario = new UsuariosC; //Instancia el controlador de usuarios 

	$respuesta = $usuario->registro(); //Llama al método de registro, que devuelve un entero de 0 a 3

	echo $respuesta; //El script de jQuery procesa la respuesta e indica si el registro se ha realizado correctamente o no

?>