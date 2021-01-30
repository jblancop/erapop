<?php

	/* Modelo de listas de reproducción */

	require_once('ModeloBase.php');

	class ListasM extends ModeloBase
	{
		private $id_usuario;

		function __construct() {parent::__construct();}

		function establecer($parametro, $valor) {$this->$parametro = $valor;}
		function obtener($parametro) {return $this->$parametro;} 

		/* Recuento del número de canciones agrupadas por lista */

		function informacion_modal()
		{
			$sql = "SELECT
						id_lista_youtube,
						nombre_lista,
						count(id_cancion) AS numero_canciones,
						timestampdiff(second, max(fecha_inclusion), now()) AS tiempo_pasado
					FROM 
						listas_youtube
							NATURAL JOIN incluidas
					WHERE
						id_usuario = {$this->obtener("id_usuario")}
					GROUP BY
						id_lista_youtube";

			$consulta = $this->conexion->query($sql);

			return $consulta;
		}

		/* Recuento del número de listas */

		function contar_listas()
		{
			$sql = "SELECT
						count(id_usuario) AS numero_listas 
					FROM 
						listas_youtube
					WHERE
						id_usuario = {$this->obtener("id_usuario")}";

			$consulta = $this->conexion->query($sql);

			return $consulta;
		}
	}

?>