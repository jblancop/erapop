<?php

		/* Script PHP que procesa la petición AJaX de inicio de sesión */

		session_start(); //Al estar fuera del circuito del controlador frontal, a los archivos AJax no les afecta el inicio de sesión del index
		
		require_once("modelos/UsuariosM.php");

		foreach($_POST as $clave => $valor) $$clave = $valor;

		$usuario = new UsuariosM; //Se crea un objeto de tipo usuario

		$usuario->establecer("nombre_usuario", $nombre); //Se le asignan sus atributos a partir de las variables POST
		$usuario->establecer("contrasena", $contrasena);

		$resultados = $usuario->listar_datos_registro(); //Recupera todos los nombres (y correos e ids, aunque en este caso no interesan) de usuario de la BD

		$usuarios = array();
		
		while($fila = $resultados->fetch_object()) array_push($usuarios, $fila->nombre_usuario); //Se vuelcan todos los nombres en el array $usuarios

		if(!in_array($nombre, $usuarios)) echo "0"; //Comprueba si el nombre recibido a través del formulario se encuentra en el array; si no lo está, devuelve un 0, que es procesado por el script de jQuery
		else //Si el nombre existe, comprueba que la contraseña sea correcta
		{
			$resultado = $usuario->conectar();

			echo $resultado; //Puede ser 1 (éxito) o 2 (contraseña incorrecta)
		}

?>