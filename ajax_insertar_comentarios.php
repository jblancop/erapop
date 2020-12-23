<?php

	/* Script PHP que procesa la petición AJaX para el envío y publicación de comentarios */

	session_start(); //Al estar fuera del circuito del controlador frontal, a los archivos AJaX no les afecta el inicio de sesión del index

	require_once("modelos/ComentariosM.php");
	require_once("auxiliares/reinicio.php");

	foreach($_POST as $clave => $valor) $$clave = $valor;

	$comentario = new ComentariosM; //Creación del objeto a partir del modelo de comentarios

	$comentario->establecer("inicio", $ano); //Caracterización del objeto para que pueda insertar el comentario en la BD
	$comentario->establecer("decada", $decada);
	$comentario->establecer("id_comentario_padre", $id_comentario_padre);
	$comentario->establecer("id_usuario", $_SESSION['id_usuario']);
	$comentario->establecer("texto", $texto);
	
	$resultado = $comentario->insertar();

	if($resultado != 1) echo 0; //Si la inserción no se realiza (no devuelve 1), imprimir un 0 (que el script de jQuery traduce en un mensaje de error)
	else //De lo contrario, se crea un array, codificado como JSON, con los datos del último comentario insertado para que lo procese el script de jQuery
	{
		$resultados = $comentario->listar_ultimo();

		while($fila = $resultados->fetch_object())
		{
			$nombre = $fila->nombre_usuario;
			$tiempo_pasado = $fila->tiempo_pasado;
			$texto = $fila->texto;

			require("auxiliares/tiempo_pasado.php");

			$json = array("nombre" => $nombre, "tiempoPasado" => $tiempo_pasado_form, "texto" => $texto);
		}

		echo json_encode($json);
	}

?>