<?php

	/* Controlador de los recopilatorios */

	require_once("modelos/CancionesM.php");
	require_once("modelos/UsuariosM.php");
	require_once("modelos/ComentariosM.php");
	require_once("modelos/ListasM.php");

	class RecopilatoriosC
	{
		function indice()
		{
			$ano_actual = $_POST['recopilatorio'];

			setcookie("inicio_decada", "", time() - 1, "/"); //Destruye la cookie de la década
			setcookie("recopilatorio", $ano_actual, time() + (60*60*24*365), "/"); //Permite que el botón volver sepa qué año fue el último visitado

			/* Cabecera */

			require_once("vistas/recopilatorios/encabezado.php"); //La cabecera viene partida en dos archivos; éste muestra una vista correspondiente al lado izquierdo y el siguiente if, al derecho
			
			if($_SESSION['conectado']) require_once("vistas/usuarios/personal.php"); //Si hay una sesión creada para el usuario, le muestra el enlace de acceso a su página personal
			else require_once("vistas/usuarios/conexion.php"); //De lo contrario, muestra el menú de conexión/registro

			/* Botonera oculta */

			if($ano_actual == 1960) $ano_pasado = 2009; //Control de los botones para avanzar y retroceder de año
			else $ano_pasado = $ano_actual - 1;

			if($ano_actual == 2009) $ano_siguiente = 1960;
			else $ano_siguiente = $ano_actual + 1;

			$decadas = array(1960, 1970, 1980, 1990, 2000); //Array para mostrar la botonera de décadas

			require_once("vistas/recopilatorios/botonera.php");

			/* Vídeos (top 15 del año) */

			$videos = new CancionesM; //Creación del objeto a partir del modelo de canciones

			$videos->establecer("inicio", $ano_actual); //Caracterización del objeto para que pueda reclamar la información correspondiente al top 15 del año
			$videos->establecer("fin", $ano_actual);
			$videos->establecer("limite", 15);

			$condicion = false; //Regula la inclusión del año al lado del título del disco

			require_once("controladores/videos.php");

			/* Lista de Spotify */

			$spotify = new CancionesM; //Creación del objeto a partir del modelo de canciones

			$spotify->establecer("inicio", $ano_actual); //Caracterización para que sepa de qué año reclamar la lista

			$resultados = $spotify->listar_spotify();

			while($fila = $resultados->fetch_object())
			{
				$enlace_spotify = $fila->enlace_spotify;

				require_once("vistas/recopilatorios/spotify.php");
			}

			/* Tablón de comentarios */

			$comentarios = new ComentariosM; //Creación del objeto a partir del modelo de comentarios

			$comentarios->establecer("inicio", $ano_actual); //Caracterización del objeto para que pueda reclamar la información correspondiente a los comentarios del recopilatorio en curso
			$comentarios->establecer("decada", 0); //Indica que se trata de un recopilatorio -0- y no de una década -1- (los años terminados en 00 pueden ser ambas cosas)

			require_once("controladores/comentarios.php");

			if($_SESSION['conectado']) require_once("vistas/modales/perfil.php"); //Sólo si el usuario está conectado se activa el modal con los perfiles personales

			/* Etiquetas de cierre antes del pie de página */

			require_once("vistas/recopilatorios/retales.php");

			/* Pie de página */

			require_once("vistas/esquema/pie.php");
		}
	}

?>