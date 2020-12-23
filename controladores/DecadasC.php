<?php

	/* Controlador de las décadas */

	require_once("modelos/CancionesM.php");
	require_once("modelos/UsuariosM.php");
	require_once("modelos/ComentariosM.php");

	class DecadasC
	{
		function indice()
		{
			$inicio_decada = $_POST['inicio_decada']; //Delimitación temporal de la década
			$fin_decada = $inicio_decada + 9;

			setcookie("recopilatorio", "", time() - 1, "/"); //Destruye la cookie del recopilatorio
			setcookie("inicio_decada", $inicio_decada, time() + (60*60*24*365), "/"); //Permite que el botón volver sepa qué década fue la última visitada

			/* Cabecera */

			require_once("vistas/decadas/encabezado.php"); //La cabecera viene partida en dos archivos; éste muestra una vista correspondiente al lado izquierdo y el siguiente if, al derecho

			if($_SESSION['conectado']) require_once("vistas/usuarios/personal.php"); //Si hay una sesión creada para el usuario, le muestra el enlace de acceso a su página personal
			else require_once("vistas/usuarios/conexion.php"); //De lo contrario, muestra el menú de conexión/registro

			/* Botonera oculta */

			$decada_actual = $recopilatorio = $inicio_decada; //El "value" y el texto del botón que enlaza al recopilatorio se llaman $recopilatorio

			if($decada_actual == 1960) $decada_pasada = 2000; //Control de los botones para avanzar y retroceder de década
			else $decada_pasada = $decada_actual - 10;

			if($decada_actual == 2000) $decada_siguiente = 1960;
			else $decada_siguiente = $decada_actual + 10;

			require_once("vistas/decadas/botonera.php");

			/* Lista con las mejores 15 canciones de la década */
			
			$top15 = new CancionesM; //Creación del objeto a partir del modelo de canciones

			$top15->establecer("inicio", $inicio_decada); //Caracterización del objeto para que pueda reclamar la información correspondiente al top 15 de la década
			$top15->establecer("fin", $fin_decada);
			$top15->establecer("limite", 15);
			
			$resultados = $top15->listar_todo(); //Reclamación de la información del top 15 a la BD

			while($fila = $resultados->fetch_object())
			{
				$ano = $fila->ano; //Datos de las canciones a mostrar en el top 15
				$nombre_autor = Utilidades::reordenar($fila->nombre_autor);
				$nota_media = Utilidades::formatear($fila->nota_media, true);
				$titulo_cancion = $fila->titulo_cancion;
				$titulo_disco = $fila->titulo_disco;			
				$votos_web = Utilidades::formatear($fila->votos_web, false);

				$coletilla = Utilidades::coletilla($votos_web); //Parámetros derivados de transformaciones de los originales de la BD
				$decada = Utilidades::decada($ano);
				$nombre_foto = Utilidades::recortar($titulo_disco);
 
				$recopilatorio = $ano; //El "value" del botón que enlaza al recopilatorio se llama $recopilatorio pero el texto, $ano

				$contador++; //Permite ordenar las canciones de 1 a 15

				require("vistas/decadas/top15.php");
			}

			/* Tablón de comentarios */

			$comentarios = new ComentariosM; //Creación del objeto a partir del modelo de comentarios

			$comentarios->establecer("inicio", $inicio_decada); //Caracterización del objeto para que pueda reclamar la información correspondiente a los comentarios de la década en curso
			$comentarios->establecer("decada", 1); //Indica que se trata de una década -1- y no de un recopilatorio -0- (los años terminados en 00 pueden ser ambas cosas)

			require_once("controladores/comentarios.php");

			if($_SESSION['conectado']) require_once("vistas/modales/perfil.php"); //Sólo si el usuario está conectado se activa el modal con los perfiles personales

			/* Etiquetas de cierre y apertura que conectan una sección con la siguiente */

			require_once("vistas/decadas/retales1.php");

			/* Vídeos (top 3 de la década) */

			$videos = new CancionesM; //Creación del objeto a partir del modelo de canciones

			$videos->establecer("inicio", $inicio_decada); //Caracterización del objeto para que pueda reclamar la información correspondiente al top 3 de la década
			$videos->establecer("fin", $fin_decada);
			$videos->establecer("limite", 3);

			$condicion = true; //Regula la inclusión del año al lado del título del disco
			
			$contador = 0; //Resetea el contador del top 15 para poder ser usado en el top 3

			require_once("controladores/videos.php");

			/* Etiquetas de cierre antes del pie de página */

			require_once("vistas/decadas/retales2.php");

			/* Pie de página */

			require_once("vistas/esquema/pie.php");
			
		}
	}

?>