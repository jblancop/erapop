<?php

	/* Script PHP que procesa la petición AJaX para la inserción de los datos personales (autor, estilo, formato y ciudades favoritos) del usuario */

	session_start(); //Al estar fuera del circuito del controlador frontal, a los archivos AJaX no les afecta el inicio de sesión del index

	require_once("modelos/UsuariosM.php");
	require_once("auxiliares/reinicio.php");

	$usuario = new UsuariosM; //Creación del objeto a partir del modelo de usuarios

	$usuario->establecer("id_usuario", $_SESSION['id_usuario']); //Caracterización del objeto

	foreach($_POST as $clave => $valor)
	{
		$resultado = $usuario->insertar_datos_personales($clave, $valor);

		if($resultado == 1) echo 1;
		else echo 0; //Si la modificación no se realiza (no devuelve 1), imprimir un 0 (que el script de jQuery traduce en un mensaje de error)
	}

?>