<?php

	/* Gestión de las cookies de permanencia de la sesión del usuario*/

	require_once("modelos/UsuariosM.php");

	if($_COOKIE['nombre_usuario']) //Si existe la galleta de usuario
	{
		if(!$_SESSION['conectado']) //Pero no hay sesión de usuario
		{
			$usuario = new UsuariosM; //Se crea un objeto de tipo usuario

			$resultados = $usuario->listar_datos_registro(); //Se obtienen los datos de los usuarios registrados

			while($fila = $resultados->fetch_object()) //Se comprueba si la galleta encriptada corresponde con algún nombre de usuario
			{
				if(password_verify($fila->nombre_usuario, $_COOKIE['nombre_usuario'])) //Si hay concordancia, se crea una sesión para ese usuario
				{
					$_SESSION['conectado'] = $fila->nombre_usuario;
					$_SESSION['id_usuario'] = $fila->id_usuario;

					break;
				}
			}
		}

		if(!password_verify($_SESSION['conectado'], $_COOKIE['nombre_usuario'])) //Si la galleta existe pero no hay coincidencia -lo que indicaría que ha sido modificada-
		{
			setcookie("nombre_usuario", false, time() - 1, "/"); //Se elimina la galleta
			
			session_destroy(); //Se elimina la sesión
			
			require_once("recursos/js/advertencia.php"); //Y se advierte al usuario
		}
	}
	else //En caso de que el usuario no haya pedido que se le recuerde al iniciar sesión
	{
		$limite = 3600; //Se establece un límite de 3.600 s (1 h)

	    if(isset($_SESSION["reinicio"])) //Si existe la sesión "reinicio"
	    {
	        $inactividad = time() - $_SESSION["reinicio"]; //Se calcula el tiempo de inactividad, entendido como el tiempo que ha transcurrido entre el momento actual y el último en que se refrescó la página

	        if($inactividad > $limite) //Si el tiempo de inactividad supera el límite
	        {
	        	setcookie("fin_sesion", "1", time() + 10, "/"); //Se crea una galleta de fin de sesión con el valor 1 (indica que la sesión ha expirado automáticamente y no por deseo del usuario) 

	        	header("Location:".url_base."usuarios/desconexion"); //Se redirige la página a la sección de fin de sesión
	        } 
	    }
	}

	require_once("auxiliares/reinicio.php");

?>