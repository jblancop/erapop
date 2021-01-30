<?php

	/* Modelo de comentarios */

	require_once('ModeloBase.php');

	class ComentariosM extends ModeloBase
	{
		private $decada, $id_usuario, $id_comentario, $id_comentario_padre, $inicio, $texto_comentario;

		function __construct() {parent::__construct();}

		function establecer($parametro, $valor) {$this->$parametro = $valor;}
		function obtener($parametro) {return $this->$parametro;} 

		/* "Eliminación" de comentarios */

		function eliminar()
		{
			$sql = "UPDATE 
						comentarios 
					SET 
						eliminado = 1 #En realidad no los elimina, sino que los marca para que PHP sepa que no ha de mostrarlos
					WHERE 
						id_comentario = {$this->obtener("id_comentario")}";

			$consulta = $this->conexion->query($sql);

			return $consulta;
		}

		/* Método para insertar un comentario en la BD mediante una sentencia preparada */

		function insertar() 
		{
			$sql = "INSERT 
						comentarios
						(
							id_comentario, 
							texto_comentario, 
							fecha_comentario, 
							ano, 
							decada,
							eliminado, 
							id_usuario, 
							id_comentario_padre
						) 
					VALUES
						(
							NULL, 
							?, 
							now(), 
							{$this->obtener("inicio")}, 
							{$this->obtener("decada")},
							0, 
							{$this->obtener("id_usuario")}, 
							{$this->obtener("id_comentario_padre")}
						)";

			$sentencia = $this->conexion->stmt_init(); //Inicia la sentencia (opcional, hace el código más robusto)

			$sentencia->prepare($sql); //Envía la plantilla de la sentencia a la BD

			$sentencia->bind_param("s", $this->obtener("texto_comentario")); //Liga el texto (de tipo cadena, "string") a la sentencia

			$resultado = $sentencia->execute(); 

			$sentencia->close();

			return $resultado;
		}

		/* Método para listar todos los comentarios -padres e hijos- de cada recopilatorio o década */

		function listar_todo() 
		{
			$sql = "SELECT 
						id_comentario,
						id_comentario_padre,
						id_usuario,
						eliminado,
						nombre_usuario, 
						texto_comentario, 
						timestampdiff(second, fecha_comentario, now()) AS tiempo_pasado
					FROM 
						comentarios 
							NATURAL JOIN usuarios
					WHERE 
						(ano = {$this->obtener("inicio")} AND decada = {$this->obtener("decada")}) #Esto permite extraer los comentarios padre
						OR id_comentario_padre IN #Y esto los comentarios hijo -no tienen referencia temporal, sino que se relacionan con el año o década a través de su padre-
						(
							SELECT 
								id_comentario 
							FROM 
								comentarios 
							WHERE 
								ano = {$this->obtener("inicio")} 
								AND decada = {$this->obtener("decada")}
						)
					ORDER BY 
						tiempo_pasado ASC"; #Los comentarios más recientes -menor tiempo pasado-, los primeros

			$consulta = $this->conexion->query($sql);

			return $consulta;
		}

		/* Recupera el último comentario insertado */

		function listar_ultimo() 
		{
			$ultima_id = $this->conexion->insert_id; //Se obtiene el id de la última inserción

			$sql = "SELECT 
						texto_comentario, 
						timestampdiff(second, fecha_comentario, now()) AS tiempo_pasado, 
						nombre_usuario 
					FROM 
						comentarios 
							NATURAL JOIN usuarios
					WHERE 
						id_usuario = {$this->obtener("id_usuario")} 
						AND id_comentario = $ultima_id";

			$consulta = $this->conexion->query($sql);

			return $consulta;
		}
	}

?>