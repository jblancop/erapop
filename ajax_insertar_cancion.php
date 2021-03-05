<?php

	/* Script PHP que procesa la petición AJaX para la inserción de canciones en los recopilatorios personalizados */

	session_start(); //Al estar fuera del circuito del controlador frontal, a los archivos AJaX no les afecta el inicio de sesión del index.php

	require_once("modelos/ListasM.php");
	require_once("auxiliares/reinicio.php");

	foreach($_POST as $clave => $valor) $$clave = $valor;

	$lista = new ListasM; //Creación del objeto a partir del modelo de listas

	$lista->establecer("id_lista_youtube", $id_lista_youtube); //Caracterización del objeto para que pueda comprobar si la canción ya está incluida en la lista y, de lo contrario, insertarla
	$lista->establecer("id_cancion", $id_cancion);
	
	$resultado = $lista->listar("incluidas", NULL, "WHERE id_lista_youtube = $id_lista_youtube AND id_cancion = $id_cancion", "id_cancion");

	if($resultado->num_rows != 0) echo 2; //Si la canción ya está en la lista, el número de filas será distinto de cero (en concreto, 1); el script jQuery advierte de ello
	else //Si no lo está
	{
		$resultado = $lista->contar_canciones();

		while($fila = $resultado->fetch_object()) $numero_canciones = $fila->numero_canciones; //Se determina cuántas canciones hay en la lista

		if($numero_canciones > 14) echo 3; //Si se ha llegado al límite de canciones, el script jQuery advierte de ello
		else
		{
			$lista->establecer("orden", $numero_canciones + 1); //Y se le asigna el orden a la nueva

			$resultado = $lista->insertar_cancion(); 

			echo $resultado; //Si se produce la isnerción, devuelve 1
		}

	}



?>