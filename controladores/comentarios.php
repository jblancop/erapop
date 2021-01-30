<?php

	/* Sistema de comentarios */

	$resultados = $comentarios->listar_todo();

	$filas = array(); //Array en el que volcar los resultados para no depender de la llamada a la BD

	while($filas[] = $resultados->fetch_object());

	array_pop($filas); //Por alguna razón se crea una fila adicional vacía que hay que eliminar

	$padres = array(); //Creación de arrays para separar comentarios padres de comentarios hijos
	$hijos = array();  

	foreach($filas as $clave => $valor) 
	{
		if($valor->id_comentario_padre) array_push($hijos, $valor); //Si existe el campo id_comentario_padre, la fila -el $valor- se mete en el array $hijos
		else array_push($padres, $valor); //Si no, en $padres
	}

	$hijos = array_reverse($hijos); //Invierte el orden de los comentarios hijos, para que los más antiguos aparezcan los primeros

	require_once("vistas/comentarios/formulario.php"); //Vista del formulario para introducir los comentarios

	foreach($padres as $clave => $valor_padre) //Se recorre el array y se van mostrando los comentarios padres
	{
		$eliminado = $valor_padre->eliminado;
		$id = $valor_padre->id_comentario;
		$id_usuario = $valor_padre->id_usuario;
		$nombre = $valor_padre->nombre_usuario;
		$texto = $valor_padre->texto_comentario;
		$tiempo_pasado = Utilidades::tiempo_pasado($valor_padre->tiempo_pasado);

		if($eliminado) $texto = "Mensaje borrado por el usuario"; //En caso de que el mensaje esté marcado como eliminado, se sustituye el texto

		require("vistas/comentarios/padres.php"); //Vista de los comentarios padre

		foreach($hijos as $clave => $valor_hijo) //Por cada comentario padre, se recorre el array de comentarios hijos
		{
			if($valor_hijo->id_comentario_padre == $valor_padre->id_comentario) //Si hay coincidencia entre ids, se muestran los comentarios hijo
			{
				$eliminado = $valor_hijo->eliminado;
				$id = $valor_hijo->id_comentario;
				$id_usuario = $valor_hijo->id_usuario;
				$nombre = $valor_hijo->nombre_usuario;
				$texto = $valor_hijo->texto_comentario;
				$tiempo_pasado = Utilidades::tiempo_pasado($valor_hijo->tiempo_pasado);

				if($eliminado) $texto = "Mensaje borrado por el usuario";

				require("vistas/comentarios/hijos.php"); //Vista de los comentarios hijo
			}
		}
	}

?>