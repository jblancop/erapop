<?php

	/* Modelo de usuarios */

	require_once("modelos/ModeloBase.php");

	class UsuariosM extends ModeloBase
	{
		private $nombre_usuario, $correo, $contrasena, $id_usuario, $voto; //Sólo accesibles a través de los métodos públicos "establecer()" y "obtener()""

		function __construct() {parent::__construct();} //Permite la conexión a la BD

		function establecer($parametro, $valor) {$this->$parametro = $valor;}
		function obtener($parametro) {return $this->$parametro;}

		/* Método con distintas posibilidades -$acción- para registrar las votaciones en la BD */

		function asignar_nota($accion) 
		{
			if($accion == "insertar") //En caso de que haya que insertar la nota por primera vez -o porque previamente se haya borrado-
			{
				$sql = "INSERT 
							votan
							(
								id_usuario, 
								id_cancion, 
								nota, 
								fecha_voto
							) 
						VALUES
							(
								'{$this->obtener('id_usuario')}', 
								'{$this->obtener('id_cancion')}', 
								'{$this->obtener('voto')}', 
								now()
							)";

				$consulta = $this->conexion->query($sql);

				return $consulta; //Si la consulta es exitosa devolverá un 1; nada en caso contrario
			}
			else
			{
				if($accion == "borrar") //En caso de que haya que borrarla
				{
					$sql = "DELETE FROM 
								votan 
							WHERE 
								id_usuario = '{$this->obtener('id_usuario')}' 
								AND id_cancion = '{$this->obtener('id_cancion')}'";

					$consulta = $this->conexion->query($sql);

					return $consulta; //Si la consulta es exitosa devolverá un 1; nada en caso contrario
				}
				elseif($accion == "actualizar") //En caso de que haya simplemente que actualizarla
				{
					$sql = "UPDATE 
								votan 
							SET 
								nota = '{$this->obtener('voto')}' 
							WHERE 
								id_usuario = '{$this->obtener('id_usuario')}' 
								AND id_cancion = '{$this->obtener('id_cancion')}'";

					$consulta = $this->conexion->query($sql);

					return $consulta; //Si la consulta es exitosa devolverá un 1; nada en caso contrario
				}
			}
		}

		/* Método para el inicio de sesión */

		function conectar() 
		{
			$sql = "SELECT 
						id_usuario, 
						contrasena 
					FROM 
						usuarios 
					WHERE 
						nombre_usuario = ?";

			$sentencia = $this->conexion->stmt_init(); //Inicia la sentencia (opcional, hace el código más robusto)

			$sentencia->prepare($sql); //Envía la plantilla de la sentencia a la BD

			$sentencia->bind_param("s", $this->obtener("nombre_usuario")); //Liga el nombre del usuario (tipo cadena, "string") a la sentencia

			$sentencia->execute(); //La ejecuta (¿y recupera el id y la contraseña ligados a ese nombre? Parece hacerlo luego)

			$sentencia->bind_result($id_usuario, $hash); //Vincula los resultados de la consulta a las variables $id_usuario y $hash

			while($sentencia->fetch()) //Obtiene el id y el hash ligados al nombre de usuario
			{
				if(password_verify($this->obtener("contrasena"), $hash)) //Comprueba que el hash corresponde a la contraseña recibida vía POST
				{
					$_SESSION['conectado'] = $this->obtener("nombre_usuario"); //Crea una sesión para el usuario con su id y su nombre
					$_SESSION['id_usuario'] = $id_usuario;

					if($_POST['recordar'] == "on") setcookie("nombre_usuario", password_hash($this->obtener("nombre_usuario"), PASSWORD_DEFAULT), time() + (60*60*24*365), "/"); //Si el usuario ha marcado la opción de "recordarme" al conectarse, se crea una cookie encriptada con el nombre del usuario con una duración de un año 

					return "1"; //Se devuelve un 1 (éxito) para que el script de jQuery lo procese
				}
				else return "2"; //Si la contraseña es incorrecta, devuelve un 2
			}
		}

		/* Método para determinar el año y la década favoritos */

		function favoritos($periodo, $consulta) //$periodo puede ser "ano" o "decada" y consulta NULL o "substring(ano, 3, 1) AS ", respectivamente
		{
			$sql = "SELECT 
						avg(nota) AS nota_media,
						$consulta $periodo
					FROM 
						votan
							NATURAL JOIN canciones
								NATURAL JOIN listas
					WHERE 
						id_usuario = {$this->obtener('id_usuario')}
					GROUP BY
						$periodo
					ORDER BY
						nota_media DESC
					LIMIT 1";

			$consulta = $this->conexion->query($sql);

			return $consulta;
		} 

		/* Método para insertar los datos personales de un usuario */

		function insertar_datos_personales($clave, $valor) //La $clave va a ser, por ejemplo, id_autor, y el $valor, 7; funcionamiento análogo para el resto de datos personales
		{
			$sql = "UPDATE 
						usuarios 
					SET 
						$clave = $valor 
					WHERE 
						id_usuario = {$this->obtener('id_usuario')}";

			$consulta = $this->conexion->query($sql);

			return $consulta; //Si la consulta es exitosa devolverá un 1; nada en caso contrario
		}

		/* Método para recabar los datos personales de un usuario en concreto mediante su id */

		function listar_datos_personales_id() 
		{
			$sql = "SELECT
						formato, 
						id_autor,
						id_ciudad, 
						id_ciudad_actual, 
						id_subestilo
					FROM 
						usuarios
					WHERE
						id_usuario = {$this->obtener('id_usuario')}";

			$consulta = $this->conexion->query($sql);

			return $consulta;
		}

		/* Método para recabar los datos personales de un usuario en concreto mediante su nombre */

		function listar_datos_personales_nombre()
		{
			$sql = "SELECT
						u.formato AS formato,
					    a.nombre_autor AS autor,
					    c1.nombre_ciudad AS ciudad_favorita,
					    c2.nombre_ciudad AS ciudad_actual,
					    s.nombre_subestilo AS subestilo
					FROM
						usuarios AS u
							INNER JOIN autores AS a ON u.id_autor = a.id_autor
					        INNER JOIN subestilos AS s ON u.id_subestilo = s.id_subestilo
					        INNER JOIN ciudades AS c1 ON u.id_ciudad = c1.id_ciudad
					        INNER JOIN ciudades AS c2 ON u.id_ciudad_actual = c2.id_ciudad
					WHERE
						u.nombre_usuario = '{$this->obtener('nombre_usuario')}'";

			$consulta = $this->conexion->query($sql);

			return $consulta;
		}

		/* Método para recabar los datos de registro de los usuarios */

		function listar_datos_registro() 
		{
			$sql = "SELECT
						correo, 
						id_usuario,
						nombre_usuario
					FROM 
						usuarios";

			$consulta = $this->conexion->query($sql); //El atributo "conexion", que almacena el objeto MYSQLi de conexión a la BD, se hereda del modelo base

			return $consulta;
		}

		/* Método para determinar si un usuario ha votado o no una determinada canción */

		function listar_nota() 
		{
			$sql = "SELECT 
						nota 
					FROM 
						votan 
					WHERE 
						id_usuario = {$this->obtener('id_usuario')} 
						AND id_cancion = {$this->obtener('id_cancion')}";

			$consulta = $this->conexion->query($sql);

			return $consulta;
		}

		/* Método para listar todas las votaciones de un usuario */

		function listar_notas() 
		{
			$sql = "SELECT 
						id_cancion, 
						nota,
						ano 
					FROM 
						votan
							NATURAL JOIN canciones
								NATURAL JOIN listas
					WHERE 
						id_usuario = {$this->obtener('id_usuario')}";

			$consulta = $this->conexion->query($sql);

			return $consulta;
		}
		
		/* Método para la obtención de algunas métricas: recuentos de canciones y notas medias */

		function metricas($array, $agrupar_por) //Permite agrupar por nota 
		{
			$sql = "SELECT
						nota,
						count(id_cancion) AS canciones_votadas,
						avg(nota) AS nota_media 
					FROM 
						votan
					WHERE 
						id_usuario = {$this->obtener('id_usuario')} 
						AND nota IN ($array[0], $array[1], $array[2], $array[3], $array[4])
					$agrupar_por";

			$consulta = $this->conexion->query($sql);

			return $consulta;
		}

		/* Método para insertar los datos de usuario en la BD mediante una sentencia preparada para evitar posibles inyecciones SQL */

		function registrar() 
		{
			$sql = "INSERT 
						usuarios
						(
							id_usuario, 
							nombre_usuario, 
							correo, 
							contrasena, 
							formato, 
							id_autor, 
							id_subestilo, 
							id_ciudad, 
							id_ciudad_actual
						) 
					VALUES
						(
							NULL, 
							?, 
							?, 
							?, 
							NULL, 
							NULL, 
							NULL, 
							NULL, 
							NULL
						)";

			$sentencia = $this->conexion->stmt_init(); //Inicia la sentencia (opcional, hace el código más robusto)

			$sentencia->prepare($sql); //Envía la plantilla de la sentencia a la BD

			$hash = password_hash($this->obtener("contrasena"), PASSWORD_DEFAULT); //Encripta la contraseña

			$sentencia->bind_param("sss", $this->obtener("nombre_usuario"), $this->obtener("correo"), $hash); //Liga las credenciales del usuario (las tres de tipo cadena, "string") a la sentencia

			$resultado = $sentencia->execute(); 

			$sentencia->close();

			$this->conexion->close();

			if($resultado == 1) return 1; //El script de jQuery procesa valores de 1 a 3
		}
	}

?>