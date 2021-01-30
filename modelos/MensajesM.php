<?php

	/* Modelo de mensajes privados */

	require_once('ModeloBase.php');

	class MensajesM extends ModeloBase
	{
		private $id_emisor, $id_receptor, $texto_mensaje;

		function __construct() {parent::__construct();}

		function establecer($parametro, $valor) {$this->$parametro = $valor;}
		function obtener($parametro) {return $this->$parametro;}

		/* Cuenta el número de mensajes (enviados y recibidos) que tiene un usuario */

		function contar()
		{
			$sql = "SELECT 
						count(id_mensaje) AS mensajes
					FROM 
						mensajes
					WHERE
						id_emisor = {$this->obtener("id_emisor")} 
						OR id_receptor = {$this->obtener("id_receptor")}";

			$consulta = $this->conexion->query($sql);

			return $consulta;
		}

		/* Cuenta el número de mensajes recibidos no leídos que tiene un usuario */

		function contar_leidos()
		{
			$sql = "SELECT 
						count(id_mensaje) AS no_leidos
					FROM 
						mensajes
					WHERE 
						id_receptor = {$this->obtener("id_receptor")}
						AND leido = 0";

			$consulta = $this->conexion->query($sql);

			return $consulta;
		}

		/* "Eliminación" de mensajes */

		function eliminar()
		{
			$sql = "UPDATE 
						mensajes 
					SET 
						eliminado = 1 #En realidad no los elimina, sino que los marca para que PHP sepa que no ha de mostrarlos
					WHERE 
						id_mensaje = {$this->obtener("id_mensaje")}";

			$consulta = $this->conexion->query($sql);

			return $consulta;
		}

		/* Método para insertar mensajes privados */

 		function insertar() 
		{
			$sql = "INSERT 
						mensajes
						(
							id_mensaje,
							id_emisor,
							id_receptor, 
							texto_mensaje, 
							fecha_mensaje
						) 
					VALUES
						(
							NULL,
							{$this->obtener("id_emisor")},
							{$this->obtener("id_receptor")},  
							?, 
							now()
						)";

			$sentencia = $this->conexion->stmt_init(); //Inicia la sentencia (opcional, hace el código más robusto)

			$sentencia->prepare($sql); //Envía la plantilla de la sentencia a la BD

			$sentencia->bind_param("s", $this->obtener("texto_mensaje")); //Liga el texto (de tipo cadena, "string") a la sentencia

			$resultado = $sentencia->execute(); //Si la inserción es un éxito devuelve "1"

			$sentencia->close();

			return $resultado;
		}

		/* Lita todos los mensajes -enviados y recibidos- de un usuario */

		function listar_todo()
		{
			$sql = "SELECT
						m.id_mensaje,
						m.id_emisor,
						u1.nombre_usuario AS emisor,
						m.id_receptor,
					    u2.nombre_usuario AS receptor,
						m.texto_mensaje,
					    timestampdiff(second, m.fecha_mensaje, now()) AS tiempo_pasado,
					    m.eliminado,
					    m.leido
					FROM 
						mensajes AS m
							INNER JOIN usuarios AS u1 ON m.id_emisor = u1.id_usuario
					        INNER JOIN usuarios AS u2 ON m.id_receptor = u2.id_usuario
					WHERE
						id_emisor = {$this->obtener("id_emisor")} 
						OR id_receptor = {$this->obtener("id_receptor")}
					ORDER BY
						tiempo_pasado ASC";

			$consulta = $this->conexion->query($sql);

			return $consulta;
		}

		/* Marcar mensajes como leídos */

		function marcar_leidos()
		{
			$sql = "UPDATE 
						mensajes 
					SET 
						leido = 1
					WHERE 
						id_mensaje = {$this->obtener("id_mensaje")}";

			$consulta = $this->conexion->query($sql);

			return $consulta;
		}
	}

?>