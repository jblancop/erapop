<?php  

	/* Script PHP que procesa la petición AJaX de votación */

	session_start(); //Al estar fuera del circuito del controlador frontal, a los archivos AJaX no les afecta el inicio de sesión del index

	require_once("modelos/UsuariosM.php");
	require_once("auxiliares/reinicio.php");

	foreach($_POST as $clave => $valor) $$clave = $valor;

	$votacion = new UsuariosM; //Creación del objeto a partir del modelo de usuarios

	$votacion->establecer("id_cancion", $id_cancion); //Caracterización del objeto
	$votacion->establecer("id_usuario", $_SESSION['id_usuario']);
	$votacion->establecer("voto", $voto);

	$resultados = $votacion->listar_nota();

	if($resultados->num_rows == 0) //Si no hay resultados, se requiere insertar la nota
	{
		$respuesta = $votacion->asignar_nota("insertar");

		echo $respuesta; //La respuesta es 1 si la consulta ha funcionado y nada si no
	} 
	else //Si los hay, en función del voto, se borrará o se actualizará el registro
	{
		if($voto == 0)
		{
			$respuesta = $votacion->asignar_nota("borrar");

			echo $respuesta;
		} 
		else
		{
			$respuesta = $votacion->asignar_nota("actualizar");

			echo $respuesta;
		} 
	}

?>