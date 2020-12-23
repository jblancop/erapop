<?php

	/* Script PHP que procesa la petición AJaX de registro de usuarios */

	require_once("autocargador.php");

	$usuario = new UsuariosC; //Instancia el controlador de usuarios 

	$respuesta = $usuario->registro(); //Llama al método de registro, que devuelve un entero de 0 a 3

	echo $respuesta; //El script de jQuery procesa la respuesta e indica si el registro se ha realizado correctamente o no

?>