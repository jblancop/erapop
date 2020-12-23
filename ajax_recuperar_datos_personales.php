<?php

	/* Script PHP que procesa la petición AJaX para mostrar el modal con el perfil de usuario */

	session_start(); //Al estar fuera del circuito del controlador frontal, a los archivos AJaX no les afecta el inicio de sesión del index

	require_once("modelos/UsuariosM.php");
	require_once("auxiliares/reinicio.php");
	require_once("auxiliares/Utilidades.php");
	require_once("auxiliares/parametros.php");

	$usuario = new UsuariosM; //Creación del objeto a partir del modelo de usuarios

	$usuario->establecer("nombre_usuario", $_POST['nombre_usuario']); //Caracterización del objeto

	$resultados = $usuario->listar_datos_personales_nombre();

	while($fila = $resultados->fetch_object())
	{
		$formato = Utilidades::minusculas($fila->formato); //Parámetros obtenidos mediante $usuario->listar_datos_personales_nombre()
		$autor = Utilidades::reordenar($fila->autor);
		$subestilo = $fila->subestilo;
		$ciudad_favorita = $fila->ciudad_favorita;
		$ciudad_actual = $fila->ciudad_actual;

		$ruta_foto = url_base."recursos/imagenes/autores/$fila->autor.jpg"; //Parámetro derivado de transformaciones de los originales de la BD

		if(!$formato OR !$autor OR !$subestilo OR !$ciudad_favorita OR !$ciudad_actual) $json = array(); //Si falta algún parámetro devuelve un array vacío
		else $json = array("formato" => $formato, "autor" => $autor, "subestilo" => $subestilo, "ciudadFavorita" => $ciudad_favorita, "ciudadActual" => $ciudad_actual, "rutaFoto" => $ruta_foto); //De lo contrario, los carga todos	
	}

	echo json_encode($json); //Se tranforma el array a un formato JSON para que lo interprete el script de jQuery

?>