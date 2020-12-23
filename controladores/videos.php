<?php

	/* Parte común al controlador de las décadas y los recopilatorios que muestra los vídeos de YouTube */

	$resultados = $videos->listar_todo(); //Reclamación de la información sobre las canciones a la BD

	$canciones = array();

	while($canciones[] = $resultados->fetch_object()); //Volcado de la información en el array para no depender de la llamada a la BD

	array_pop($canciones); //Por alguna razón se crea una fila adicional vacía que hay que eliminar

	if($_SESSION['id_usuario']) //Si hay un usuario conectado, se reclama a la BD la información sobre sus votaciones
	{
		$id_usuario = $_SESSION['id_usuario'];

		$usuario = new UsuariosM; //Se crea un objeto de tipo usuario

		$usuario->establecer("id_usuario", $id_usuario); //Caracterización del objeto para que sepa de qué usuario ha de reclamar la información

		$resultados = $usuario->listar_notas(); //Reclamación de la información sobre votaciones a la BD

		$notas = array();

		while($notas[] = $resultados->fetch_object()); //Volcado de la información en el array para no depender de la llamada a la BD

		$provisional = array(); //Array provisional en el que volcar cada $fila de $canciones tras incluirle su votación  

		foreach($canciones as $clave => $fila) 
		{
			foreach($notas as $clave2 => $fila2) if($fila->id_cancion == $fila2->id_cancion) $fila->nota = $fila2->nota; //Cada vez que se encuentra una equivalencia entre los id de las canciones, se le agrega la votación que le ha dado el usuario

			array_push($provisional, $fila); //Se construye un array análogo a $canciones pero con un parámetro adicional para las votaciones
		}

		$canciones = $provisional; //Se sustituye el contenido del array maestro por el de $provisional para poder añadirle más información a $canciones en el siguiente paso
	}

	foreach($canciones as $clave => $valor) //Bucle para combinar la información ya existente con la de los subestilos
	{
		$id_disco = $canciones[$clave]->id_disco; 

		$videos->establecer("id_disco", $id_disco); //Caracterización del objeto para que sepa de qué disco ha de reclamar la información sobre subestilos a la BD 

		$resultados = $videos->listar_subestilos(); //Reclamación de la información sobre subestilos a la BD

    	$subestilos = array();

    	while($fila = $resultados->fetch_object())
    	{
    		$subestilo = $fila->nombre_subestilo;
    		
    		array_push($subestilos, $subestilo); //Creación de un array con los subestilos del disco
    	}
 
    	for($i = 0; $i < count($canciones); $i++) if($canciones[$i]->id_disco == $id_disco) $canciones[$i]->subestilos = $subestilos; //Inclusión del array de subestilos en la fila correspondiente del array con toda la información sobre las canciones
	}

	foreach($canciones as $clave => $fila) 
	{
		$ano = $fila->ano; //Parámetros obtenidos mediante $videos->listar_todo()
		$enlace_rym = $fila->enlace_rym;
		$enlace_youtube = $fila->enlace_youtube;
		$id_autor = $fila->id_autor;
		$id_cancion = $fila->id_cancion;
		$nombre_autor = Utilidades::reordenar($fila->nombre_autor);
		$nombre_ciudad = $fila->nombre_ciudad;
		$nombre_pais = $fila->nombre_pais;
		$nota_media = Utilidades::formatear($fila->nota_media, 2);
		$tipo = Utilidades::minusculas($fila->tipo);
		$titulo_cancion = $fila->titulo_cancion;
		$titulo_disco = $fila->titulo_disco;
		$votos_web = Utilidades::formatear($fila->votos_web, 0);
		
		$nota = $fila->nota; //Parámetro obtenido mediante $usuario->listar_notas()

		$subestilos = array();
		$subestilos = $fila->subestilos; //Parámetro obtenido mediante $videos->listar_subestilos()

		$coletilla = Utilidades::coletilla($votos_web); //Parámetros derivados de transformaciones de los originales de la BD
		$decada = Utilidades::decada($ano);
		$nombre_foto = Utilidades::recortar($titulo_disco);

		$inicio = strpos($enlace_youtube, "watch?v="); //Prepara los vídeos de YouTube para que se puedan visualizar embebidos
		$enlace_youtube = substr_replace($enlace_youtube, "embed/", $inicio, 8);

		if($condicion == true) $ano_disco = '('.$ano.')'; //Permite incluir el año al lado del título del disco en la página sobre las décadas
		else $ano_disco = null;

		$contador++; //Posición en la clasificación de cada canción

		require("vistas/videos.php");
	}

?>