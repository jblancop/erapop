<?php

	/* Carga individual de controladores */

	function autocargar($controlador) {require_once("controladores/".$controlador.".php");}
	
	spl_autoload_register("autocargar");

?>