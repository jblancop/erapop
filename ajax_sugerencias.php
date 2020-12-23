<?php

	/* Script PHP que procesa la petición AJaX cada vez que se hace clic en el nombre de un subestilo */

	session_start(); //Al estar fuera del circuito del controlador frontal, a los archivos AJax no les afecta el inicio de sesión del index

	require_once("modelos/CancionesM.php");
	require_once("auxiliares/Utilidades.php");
	require_once("auxiliares/parametros.php");
	require_once("auxiliares/reinicio.php");

	foreach($_POST as $clave => $valor) $$clave = $valor;

	$sugerencias = new CancionesM; //Creación del objeto a partir del modelo de canciones

	$sugerencias->establecer("id_cancion", $id_cancion); //Caracterización del objeto
	$sugerencias->establecer("nombre_subestilo", $nombre_subestilo);
	$sugerencias->establecer("voto", $voto);

	$json = array(); //Creación del array donde se guardará la información, que el script jQuery espera en formato JSON

	$resultados = $sugerencias->listar_sugerencias();
	
	while($fila = $resultados->fetch_object())
	{
		$ano = $fila->ano; //Información directamente obtenida de la BD
		$nombre_autor = Utilidades::reordenar($fila->nombre_autor); 
		$titulo_cancion = $fila->titulo_cancion;
		$titulo_disco = $fila->titulo_disco;

		$decada = Utilidades::decada($ano); //Información procesada a partir de la obtenida de la BD
		$nombre_foto = Utilidades::recortar($titulo_disco);

		$ruta_foto = url_base."/recursos/imagenes/".$decada."/".$ano."/".$nombre_foto.".jpg"; //Información procesada a partir de las dos etapas previas

		$cuarteto = array("rutaFoto" => $ruta_foto, "nombreAutor" => $nombre_autor, "tituloCancion" => $titulo_cancion, "ano" => $ano); //Información relevante a mostrar para cada canción

		array_push($json, $cuarteto);
	}
	
	echo json_encode($json); //Codificación  en formato JSON del array con las canciones (entre 1 y 5)

?>