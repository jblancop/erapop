<?php

	/* Controlador de de la página inicial */

	require_once("modelos/CancionesM.php");

	class GeneralC
	{
		function indice()
		{
			/* Presentación de la web */

			require_once("vistas/general/inicio.php");

			/* Top 3 histórico */

			$general = new CancionesM; //Creación del objeto a partir del modelo de canciones

			$general->establecer("inicio", 1960); //Caracterización del objeto para que pueda reclamar información correspondiente al top 3
			$general->establecer("fin", 2009);
			$general->establecer("limite", 3);

			$resultados = $general->listar_todo(); //Reclamación de la información del top 3 a la BD

			while($fila = $resultados->fetch_object())
			{
				$titulo_cancion = $fila->titulo_cancion; //Datos de las canciones a mostrar en el top 3
				$nombre_autor = $fila->nombre_autor;
				$nota_media = $nota_media = Utilidades::formatear($fila->nota_media, true);
				$foto_autor = $fila->foto_autor;
				$ano = $fila->ano;

				$nombre_autor_orden = Utilidades::reordenar($nombre_autor);

				$recopilatorio = $ano; //El "value" del botón que enlaza al recopilatorio se llama $recopilatorio y no $ano

				$contador++; //Permite ordenar las canciones de 1 a 3

				require("vistas/general/top3.php");
			}

			/* Botonera para elegir década */

			$decadas = array(1960, 1970, 1980, 1990, 2000);

			require_once("vistas/general/boton.php");
		}
	}

?>