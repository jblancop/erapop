<?php

	/* Índice de 50 Años de Era Pop */

	session_start();

	/* Archivos auxiliares */
	
	require_once("vistas/esquema/cabecera.php");
	require_once("autocargador.php");
	require_once("auxiliares/parametros.php");
	require_once("auxiliares/Utilidades.php");
	require_once("auxiliares/galletas.php");

	/* Controlador frontal */

	if($_GET['controlador']) $controlador_c = $_GET['controlador']."C"; //Si en la URL el controlador tiene algún valor, se carga en la variable añadiéndole la C final (todos los controladores vienen identificados a nivel de clase con esa C final)
	else $controlador_c = controlador_base; //De lo contrario, se usa el controlador por defecto (ver "auxiliares/parametros.php") 

	$controlador = new $controlador_c; //Se crea un objeto a partir del controlador cargado en la variable

	if($_GET['accion']) //Si en la URL la acción -es decir, el método- tiene algún valor
	{
		$accion = $_GET['accion']; //Se carga en la variable

		$controlador->$accion(); //Y se hace la llamada objeto->método
	}
	else //De lo contrario
	{
		$accion = accion_base; //Se carga el método por defecto (ver "auxiliares/parametros.php")

		$controlador->$accion(); //Y se hace la llamada objeto->método
	}

?>