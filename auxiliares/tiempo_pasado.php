<?php

	/* Da formato al tiempo transcurrido desde la creación del comentario */

	if($tiempo_pasado < 60) $tiempo_pasado_form = "hace menos de un minuto"; //Hasta un minuto
	elseif($tiempo_pasado < 3600) //Hasta una hora
	{
		$minutos = floor($tiempo_pasado/60);

		if($minutos == 1) $tiempo_pasado_form = "hace un minuto";
		else $tiempo_pasado_form = "hace ".$minutos." minutos";
	}
	elseif($tiempo_pasado < 86400) //Hasta un día
	{
		$horas = floor($tiempo_pasado/3600);

		if($horas == 1) $tiempo_pasado_form = "hace una hora";
		else $tiempo_pasado_form = "hace ".$horas." horas";
	}
	elseif($tiempo_pasado < 2629740) //Hasta un mes
	{
		$dias = floor($tiempo_pasado/86400);

		if($dias == 1) $tiempo_pasado_form = "hace un día";
		else $tiempo_pasado_form = "hace ".$dias." días";
	}
	else //A partir de un mes
	{
		$meses = floor($tiempo_pasado/2629740);

		if($meses == 1) $tiempo_pasado_form = "hace un mes";
		elseif($meses < 12) $tiempo_pasado_form = "hace ".$meses." meses";
		elseif($meses < 24) $tiempo_pasado_form = "hace más de un año";
		elseif($meses < 36) $tiempo_pasado_form = "hace más de 2 años";
		elseif($meses < 48) $tiempo_pasado_form = "hace más de 3 años";
		elseif($meses < 60) $tiempo_pasado_form = "hace más de 4 años";
		else $tiempo_pasado_form = "hace más de 5 años";
	}

?>