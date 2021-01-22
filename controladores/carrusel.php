<?php

	/* Carrusel con las canciones votadas por el usuario, que se presentan en diapositivas sucesivas de 5 canciones cada una */

	$carrusel = new CancionesM; //Creación del objeto a partir del modelo de usuarios

	$carrusel->establecer("id_usuario", $id_usuario); //Caracterización del objeto para que reclame a la BD las canciones
	$carrusel->establecer("nota", $nota);

	$resultados = $carrusel->listar_votadas(); //Reclamación de la información sobre las canciones a la BD 

	$canciones = array();

	while($canciones[] = $resultados->fetch_object()); //Volcado de la información en el array para no depender de la llamada a la BD

	array_pop($canciones); //Por alguna razón se crea una fila adicional vacía que hay que eliminar

	$maximo = sizeof($canciones); //Recuento del número de canciones
	$contador = 0; //Inicia la cuenta de las diapositivas (la primera correspondería a las últimas 5 canciones votadas por el usuario), que dependen del bucle externo; las canciones se cuentan en el bucle interno
	$romper = false; //Controla si se ha de romper o no el bucle externo

	if($maximo > 0) //Si hay al menos una canción, muestra el carrusel
	{
		require("vistas/usuarios/personal/carrusel/encabezado.php");

		foreach($canciones as $clave => $valor) //Bucle externo: cada $valor sería un array con la información de cada canción: (titulo_cancion => "Villa Rosie", ..., ano=> 1993)
		{
			$clave = $contador * 5; //Las canciones se presentan en lotes (lote como sinónimo de diapositiva) de 5, por lo que en el 1er ciclo del foreach se pintan las canciones que van de la 0 * 5 a la 4, luego las que van de la 1 * 5 a la 9, luego de la 2 * 5 a la 14 y así sucesivamente hasta llegar al final 

			require("vistas/usuarios/personal/carrusel/retal1.php");

			for($i = $clave; $i <= $clave + 4; $i++) //Bucle interno: se pintan cada una de las 5 canciones de cada diapositiva: de 0 a 4, luego de 5 a 9, etc.
			{
				$titulo_cancion = $canciones[$i]->titulo_cancion; //Parámetros obtenidos mediante $carrusel->listar_votadas()
				$titulo_disco = $canciones[$i]->titulo_disco;
				$nombre_autor = Utilidades::reordenar($canciones[$i]->nombre_autor);
				$ano = $canciones[$i]->ano;

				$decada = Utilidades::decada($ano); //Parámetros derivados de transformaciones de los originales de la BD
				$nombre_foto = Utilidades::recortar($titulo_disco);

				$recopilatorio = $ano; //El "value" del botón que enlaza al recopilatorio se llama $recopilatorio y no $ano
		
				require("vistas/usuarios/personal/carrusel/cuerpo.php");

				if($i == $maximo - 1) //Si se alcanza el final del array de canciones (sizeof() no cuenta desde 0 como $contador sino desde 1, de ahí que se reste 1)
				{
					$romper = true; //Se indica que se ha de romper el bucle externo
					break; //Se rompe el bucle interno
				} 
			}
			
			if($romper) break; //Si $romper es verdadero, se rompe el bucle externo

			$contador++; //Se suma una unidad al contador para que el bucle externo presente la siguiente diapositiva (o lote de 5 canciones)
				
			require("vistas/usuarios/personal/carrusel/retal2.php");
		}

		require("vistas/usuarios/personal/carrusel/controladores.php");
	}



?>