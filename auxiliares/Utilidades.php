<?php

	/* Clase con métodos estáticos de uso repetido */

	class Utilidades
	{
		/* Sitúa el "The" del nombre del autor al principio -en la BD viene al final para favorecer la ordenación alfabética- */

		static function reordenar($nombre)
		{
			if(strpos($nombre, ", The")) $nombre = "The ".substr($nombre, 0, strpos($nombre, ", The"));

			return $nombre;
		}

		/* Formatea números */

		static function formatear($numero, $decimales) //$numero hace referencia al valor que se quiere formatear y $decimales es un entero que indica el número de decimales
		{
			if($numero == null) $numero = 0; //En caso de que la BD no devuelva ningún valor
			
			$numero = number_format($numero, $decimales, ',', '.');

			return $numero;
		}

		/* Tiene en cuenta los caracteres prohibidos que pueden aparecer en los títulos de los discos pero no en los nombres de las fotos y corta la cadena por ese punto */

		static function recortar($titulo)
		{
			if(strpos($titulo, "/")) $titulo = substr($titulo, 0, strpos($titulo, "/"));
			elseif(strpos($titulo, ":")) $titulo = substr($titulo, 0, strpos($titulo, ":"));
			
			return $titulo;
		}

		/* Cambia voto a votos en función del número de ellos */

		static function coletilla($votos_web)
		{
			if($votos_web == 1) $coletilla = "voto";
			else $coletilla = "votos";

			return $coletilla;
		}

		/* Convierte a todo minúsculas */

		static function minusculas($palabra)
		{
			$excepciones = array("CD", "MP3", "LP", "EP");

			if(!in_array($palabra, $excepciones)) $palabra = strtolower($palabra);

			return $palabra;
		}

		/* Se obtiene la década -formato xxx0s- a partir de los tres primeros dígitos del año para localizar la portada del disco en el directorio de imágenes */

		static function decada($ano)
		{
			$decada = substr($ano, 0, 3)."0s";

			return $decada;
		}

		/* Evita que los usuarios conectados accedan a determinadas secciones, como la página de registro */

		static function rechazar_conectado()
		{
			if($_SESSION['conectado']) header("Location:".url_base."general/indice");
			else return true;
		}

		/* Evita que los usuarios no conectados accedan a determinadas secciones, como la página personal o la de desconexión */

		static function rechazar_desconectado()
		{
			if(!$_SESSION['conectado']) header("Location:".url_base."general/indice");
			else return true;
		}
	}

?>