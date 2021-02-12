<?php

	/* Modelo de listas de reproducción */

	require_once('ModeloBase.php');

	class ListasM extends ModeloBase
	{
		private $descripcion, $id_usuario, $nombre_lista;

		function __construct() {parent::__construct();}

		function establecer($parametro, $valor) {$this->$parametro = $valor;}
		function obtener($parametro) {return $this->$parametro;} 

		/* Recuento del número de listas */

		function contar()
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

		/* Información a presentar en el modal para añadir canciones a los recopilatorios */

		function informacion_modal()
		{
			$sql = "SELECT
						ly.id_lista_youtube,
						ly.nombre_lista,
						count(i.id_cancion) AS numero_canciones,
						if(max(i.fecha_inclusion) IS NOT NULL, timestampdiff(second, max(i.fecha_inclusion), now()), timestampdiff(second, ly.fecha_lista, now())) AS tiempo_pasado
					FROM 
						listas_youtube AS ly
							LEFT JOIN incluidas AS i ON ly.id_lista_youtube = i.id_lista_youtube
					WHERE
						id_usuario = {$this->obtener("id_usuario")}
					GROUP BY
						id_lista_youtube";

			$consulta = $this->conexion->query($sql);

			return $consulta;
		}

		/* Método para insertar los datos de una lista mediante una sentencia preparada para evitar posibles inyecciones SQL */

		function crear() 
		{
			$sql = "INSERT 
						listas_youtube
						(
							id_lista_youtube, 
							nombre_lista, 
							descripcion, 
							fecha_lista, 
							id_usuario
						) 
					VALUES
						(
							NULL, 
							?, 
							?, 
							now(), 
							{$this->obtener("id_usuario")}
						)";

			$sentencia = $this->conexion->stmt_init(); //Inicia la sentencia (opcional, hace el código más robusto)

			$sentencia->prepare($sql); //Envía la plantilla de la sentencia a la BD

			$sentencia->bind_param("ss", $this->obtener("nombre_lista"), $this->obtener("descripcion")); //Liga los datos de la lista (los dos de tipo cadena, "string") a la sentencia

			$resultado = $sentencia->execute(); 

			$sentencia->close();

			if($resultado == 1) return 1; //El script de jQuery procesa un valor de 1 como éxito
		}
	}

?>