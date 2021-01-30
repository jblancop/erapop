<?php

	/* Modelo de canciones */

	require_once('ModeloBase.php');

	class CancionesM extends ModeloBase
	{
		private $inicio, $fin, $limite, $id_disco, $nombre_subestilo, $id_cancion, $id_usuario, $nota;

		function __construct() {parent::__construct();}

		function establecer($parametro, $valor) {$this->$parametro = $valor;} //Método "set"
		function obtener($parametro) {return $this->$parametro;} //Método "get"

		/* Método para obtener información sobre las canciones */

		function listar_todo() 
		{
			$sql = "SELECT
						ano,
						enlace_rym, 
						enlace_youtube,
						foto_autor,
						id_autor,
						id_cancion,
						id_disco,
						nombre_autor,
						nombre_ciudad,
						nombre_pais,
						nota_media,
						tipo, 
						titulo_cancion,
						titulo_disco,   
						votos_web	 
					FROM 
						listas_spotify 
							NATURAL JOIN canciones 
								NATURAL JOIN discos 
									NATURAL JOIN publican 
										NATURAL JOIN autores 
											NATURAL JOIN ciudades 
												NATURAL JOIN paises 
					WHERE 
						ano BETWEEN {$this->obtener('inicio')} AND {$this->obtener('fin')} 
					ORDER BY 
						nota_media DESC, 
						votos_web DESC 
					LIMIT 
						{$this->obtener('limite')}";

			$consulta = $this->conexion->query($sql);

			return $consulta;
		}

		/* Método para obtener información sobre las listas de Spotify */

		function listar_spotify() 
		{
			$sql = "SELECT 
						enlace_spotify 
					FROM 
						listas_spotify 
					WHERE 
						ano = {$this->obtener('inicio')}";

			$consulta = $this->conexion->query($sql);

			return $consulta;
		}

		/* Método para obtener información sobre los subestilos asociados a un disco */

		function listar_subestilos() 
		{
			$sql = "SELECT 
						nombre_subestilo 
					FROM 
						subestilos 
							NATURAL JOIN relacionados 
					WHERE 
						id_disco = {$this->obtener('id_disco')}";

			$consulta = $this->conexion->query($sql);

			return $consulta;
		}

		/* Método para obtener información sobre canciones del mismo subestilo a la seleccionada */

		function listar_sugerencias() 
		{
			$sql = "SELECT 
						ano,
						nombre_autor, 
						titulo_cancion, 
						titulo_disco  
					FROM 
						listas_spotify 
							NATURAL JOIN canciones 
								NATURAL JOIN discos 
									NATURAL JOIN relacionados 
										NATURAL JOIN subestilos 
									NATURAL JOIN publican 
										NATURAL JOIN autores
    				WHERE 
    					nombre_subestilo = '{$this->obtener('nombre_subestilo')}' 
    					AND id_cancion != {$this->obtener('id_cancion')}
    				ORDER BY 
    					rand()
    				LIMIT 5";

    		$consulta = $this->conexion->query($sql);

			return $consulta;
		}

		/* Método para obtener información sobre las canciones votadas por un usuario */

		function listar_votadas()
		{
			$sql = "SELECT 
						titulo_cancion, 
						titulo_disco, 
						nombre_autor, 
						ano  
					FROM 
						listas_spotify 
							NATURAL JOIN canciones  
								NATURAL JOIN discos 
									NATURAL JOIN publican 
										NATURAL JOIN autores
								NATURAL JOIN votan
					WHERE 
						id_usuario = {$this->obtener('id_usuario')} 
						AND nota = {$this->obtener('nota')}
					ORDER BY 
						fecha_voto DESC";

			$consulta = $this->conexion->query($sql);

			return $consulta;
		}
	}

?>