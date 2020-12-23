<?php

	/* Controlador de usuarios */

	require_once("modelos/UsuariosM.php");
	require_once("modelos/MensajesM.php");
	require_once("modelos/CancionesM.php");
	require_once("auxiliares/Utilidades.php");
	//require_once("auxiliares/parametros.php");

	class UsuariosC
	{
		/* Gestión del registro de usuarios */

		function registro() 
		{
			Utilidades::rechazar_conectado();

			if($_POST) //Si detecta un envío POST procede a registrar al usuario
			{	
				foreach($_POST as $clave => $valor) $$clave = $valor;

				$usuario = new UsuariosM; //Se crea un objeto de tipo usuario

				$usuario->establecer("nombre_usuario", $nombre); //Se le asignan sus atributos a partir de las variables POST
				$usuario->establecer("correo", $correo);
				$usuario->establecer("contrasena", $contrasena);

				$resultados = $usuario->listar_datos_registro(); //Se obtienen los datos de los usuarios registrados

				while($fila = $resultados->fetch_object()) //Se comprueba si el nombre y el correo ya están en uso
				{
					if($usuario->obtener("nombre_usuario") == $fila->nombre_usuario) 
					{
						$respuesta = 2;
						
						break; //El break es necesario para que dé prioridad a la alerta de nombre repetido sobre la de correo repetido
					} 
					elseif($usuario->obtener("correo") == $fila->correo) $respuesta = 3;
				}

				if($respuesta) return $respuesta; //La respuesta se procesa desde el archivo ajax_insertar_datos_personales.php para evitar problemas con el HTML de la cabecera y el pie
				else 
				{
					$respuesta = $usuario->registrar(); //Si no están en uso, se procede a su registro
					
					return $respuesta;
				}
			}
			else require_once("vistas/usuarios/registro.php"); //Si no hay envío POST, visualiza el formulario de registro 
		}

		/* Gestión del fin de sesión */

		function desconexion() 
		{
			Utilidades::rechazar_desconectado();

			session_destroy(); //Destruye la sesión

			setcookie("nombre_usuario", false, time() - 1, "/"); //Elimina las cookies asociadas a ese usuario (si las hubiere)
			setcookie("id_usuario", false, time() - 1, "/");

			require_once("vistas/usuarios/desconexion.php");
		}

		/* Gestión de la página personal */

		function personal()
		{
			Utilidades::rechazar_desconectado();

			$nombre_usuario = $_SESSION['conectado'];
			$id_usuario = $_SESSION['id_usuario']; 

			/* Cabecera */

			require_once("vistas/usuarios/personal/encabezado.php"); //La cabecera viene partida en dos archivos; éste muestra una vista correspondiente al lado izquierdo y el siguiente, al derecho

			$mensajes = new MensajesM; //Creación del objeto a partir del modelo de mensajes

			$mensajes->establecer("id_emisor", $id_usuario); //Caracterización del objeto para que reclame a la BD la información pertinente
			$mensajes->establecer("id_receptor", $id_usuario);

			$resultados = $mensajes->contar();

			while($fila = $resultados->fetch_object()) $numero_mensajes = $fila->mensajes; //Número total de mensajes en su bandeja de entrada y salida

			$resultados = $mensajes->contar_leidos();

			while($fila = $resultados->fetch_object()) $no_leidos = $fila->no_leidos; //Número total de mensajes no leídos en su bandeja de entrada

			require_once("vistas/usuarios/personal/mensajes/acceso.php");

			/* Carruseles */

			$personal = new UsuariosM; //Creación del objeto a partir del modelo de usuarios

			$personal->establecer("id_usuario", $id_usuario); //Caracterización del objeto para que reclame a la BD el número de canciones votadas con nota igual o superior a 3 por el usuario

			$notas = array(5, 4, 3, "NULL", "NULL"); //Sólo se tienen en cuenta las canciones aprobadas

			$resultados = $personal->metricas($notas, NULL);

			while($fila = $resultados->fetch_object()) $numero_aprobados = $fila->canciones_votadas;

			if($numero_aprobados > 0) //Si el usuario ha votado al menos una canción con al menos un tres, se muestran los carruseles
			{
				$nota = 5;
				require("controladores/carrusel.php");

				$nota = 4;
				require("controladores/carrusel.php");

				$nota = 3;
				require("controladores/carrusel.php");
			}
			else //De lo contrario, se muestra la vista animándolo a que vote por primera vez
			{
				$decadas = array(1960, 1970, 1980, 1990, 2000); //Necesario para el modal de décadas

				require_once("vistas/usuarios/personal/sin_carrusel.php"); 
			} 

			/* Estadísticas */

			$notas = array(5, 4, 3, 2, 1); //En esta ocasión se requieren todas las votaciones para el encabezado de las estadísticas

			$resultados = $personal->metricas($notas, NULL);

			while($fila = $resultados->fetch_object())
			{
				$numero_canciones = $fila->canciones_votadas; //Se obtiene el número de canciones votadas y su nota media
				$nota_media_global = $fila->nota_media;
			}

			$nota_media_global = Utilidades::formatear($nota_media_global, 2); //Se formatea apropiadamente la nota media
			$una_nota = Utilidades::formatear($nota_media_global, 0); //En caso de que sólo se haya votado una canción no se dan decimales

			$resultados = $personal->metricas($notas, "GROUP BY nota"); //En esta ocasión se cuentan las canciones pero agrupándolas por nota (tantas con 5, tantas con 4, etc.) para usarlas en el gráfico de barras

			while($fila = $resultados->fetch_object())
			{
				$nota = $fila->nota; //Se obtiene el número de canciones votadas agrupadas por su nota
				$canciones_agrupadas = $fila->canciones_votadas;

				require("vistas/usuarios/personal/datos_histograma.php"); //Se han de proporcionar los valores al script de jQuery que dibuja el histograma haciendo uso del atributo HTML "data"
			}

			$resultados = $personal->favoritos("ano", NULL); //Se determina el año favorito del usuario

			while($fila = $resultados->fetch_object())
			{
				$ano = $fila->ano;
				$nota_media_anual = $fila->nota_media;
			}

			$nota_media_anual = Utilidades::formatear($nota_media_anual, 2); //Se formatea apropiadamente la nota media

			$resultados = $personal->favoritos("decada", "substring(ano, 3, 1) AS "); //Se determina la década favorita del usuario

			while($fila = $resultados->fetch_object())
			{
				$decada = $fila->decada;
				$nota_media_decada = $fila->nota_media;
			}

			switch($decada) //Se transforma la década a texto por una cuestión estética
			{
				case "6": $decada = "sesenta"; break;
				case "7": $decada = "setenta"; break;
				case "8": $decada = "ochenta"; break;
				case "9": $decada = "noventa"; break;
				case "0": $decada = "dos mil"; break;
				default: $decada;
			}

			$nota_media_decada = Utilidades::formatear($nota_media_decada, 2); //Se formatea apropiadamente la nota media

			require_once("vistas/usuarios/personal/estadisticas.php");

			/* Datos personales */

			require_once("vistas/usuarios/personal/datos/encabezado.php");

			$resultados = $personal->listar_datos_personales_id(); //Se obtienen los datos personales del usuario

			while($fila = $resultados->fetch_object())
			{
				$formato_fav = $fila->formato; 
				$id_autor_fav = $fila->id_autor;
				$id_subestilo_fav = $fila->id_subestilo;
				$id_ciudad_fav = $fila->id_ciudad;
				$id_ciudad_actual = $fila->id_ciudad_actual;
			}

			$resultados = $personal->listar("autores", NULL, NULL, "nombre_autor"); //Llamada al método transversal del modelo base para obtener información sobre la tabla autores

			while($fila = $resultados->fetch_object())
			{
				$id_autor = $fila->id_autor;
				$nombre_autor = $fila->nombre_autor;

				require("vistas/usuarios/personal/datos/autores.php");
			}

			require_once("vistas/usuarios/personal/datos/estilos1.php");

			$resultados = $personal->listar("subestilos", NULL, NULL, "nombre_subestilo"); //Llamada al método transversal del modelo base para obtener información sobre la tabla subestilos

			while($fila = $resultados->fetch_object())
			{
				$id_subestilo = $fila->id_subestilo;
				$nombre_subestilo = $fila->nombre_subestilo;

				require("vistas/usuarios/personal/datos/estilos2.php");
			}

			require_once("vistas/usuarios/personal/datos/formatos1.php");

			$formatos = array("Casete", "CD", "MP3", "Vinilo"); //Lista de los formatos posibles

			for($i = 0; $i < sizeof($formatos); $i++) require("vistas/usuarios/personal/datos/formatos2.php");

			require_once("vistas/usuarios/personal/datos/ciudades1.php");

			$resultados = $personal->listar("ciudades", "NATURAL JOIN paises", "WHERE artista = 1", "nombre_ciudad"); //Llamada al método transversal del modelo base para obtener información sobre la tabla ciudades: ciudades de origen de los artistas

			while($fila = $resultados->fetch_object())
			{
				$id_ciudad = $fila->id_ciudad;
				$nombre_ciudad = $fila->nombre_ciudad;
				$nombre_pais = $fila->nombre_pais;

				require("vistas/usuarios/personal/datos/ciudades2.php");
			}
			
			require_once("vistas/usuarios/personal/datos/residencia1.php");

			$resultados = $personal->listar("ciudades", "NATURAL JOIN paises", "WHERE usuario = 1", "nombre_ciudad"); //Llamada al método transversal del modelo base para obtener información sobre la tabla ciudades: ciudades de origen de los usuarios

			while($fila = $resultados->fetch_object())
			{
				$id_ciudad = $fila->id_ciudad;
				$nombre_ciudad = $fila->nombre_ciudad;
				$nombre_pais = $fila->nombre_pais;

				require("vistas/usuarios/personal/datos/residencia2.php");
			}

			/* Botones */

			require_once("vistas/usuarios/personal/botones.php");

			/* Pie de página */

			require_once("vistas/esquema/pie.php");
		}

		/* Gestión de los mensajes privados */

		function mensajes()
		{
			Utilidades::rechazar_desconectado();
			
			$nombre_usuario = $_SESSION['conectado'];
			$id_usuario = $_SESSION['id_usuario'];

			$mensajes = new MensajesM; //Creación del objeto a partir del modelo de mensajes

			$mensajes->establecer("id_emisor", $id_usuario); //Caracterización del objeto para que reclame a la BD la información pertinente
			$mensajes->establecer("id_receptor", $id_usuario);

			$resultados = $mensajes->listar_todo(); //Se listan todos los mensajes enviados y recibidos

			require_once("vistas/usuarios/personal/mensajes/encabezado.php");

			$recibidos = array();
			$enviados = array();

			while($fila = $resultados->fetch_object())
			{
				if($fila->receptor == $nombre_usuario) array_push($recibidos, $fila);
				else array_push($enviados, $fila);
			}

			foreach($recibidos as $clave => $mensaje)
			{
				$id = $mensaje->id_mensaje;
				$id_emisor = $mensaje->id_emisor;
				$emisor = $mensaje->emisor;
				$texto = $mensaje->texto;
				$tiempo_pasado = $mensaje->tiempo_pasado;
				$eliminado = $mensaje->eliminado;
				$leido = $mensaje->leido;

				require("auxiliares/tiempo_pasado.php"); //Le da un formato apropiado el tiempo transcurrido
				require("vistas/usuarios/personal/mensajes/recibidos.php");
			}

			require_once("vistas/usuarios/personal/mensajes/retal.php");

			foreach($enviados as $clave => $mensaje)
			{
				$id = $mensaje->id_mensaje;
				$id_receptor = $mensaje->id_receptor;
				$receptor = $mensaje->receptor;
				$texto = $mensaje->texto;
				$tiempo_pasado = $mensaje->tiempo_pasado;
				$eliminado = $mensaje->eliminado;

				require("auxiliares/tiempo_pasado.php"); //Le da un formato apropiado el tiempo transcurrido
				require("vistas/usuarios/personal/mensajes/enviados.php");
			}

			require_once("vistas/modales/perfil.php");  

			require_once("vistas/usuarios/personal/mensajes/pie.php");
		}
	}

?>