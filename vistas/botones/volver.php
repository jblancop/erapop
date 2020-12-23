<?php if($_GET['accion'] == "mensajes"): ?> <!--Si se trata de la página de mensajes-->

	<form method="post" action="<?=url_base?>usuarios/personal">
		<button class="boton-volver" role="link" name="inicio_decada" value="">Volver</button>	
	</form> <!--El botón te devuelve al perfil personal-->

<?php elseif($_COOKIE['inicio_decada']): ?> <!--Si existe cookie para las décadas-->

	<form method="post" action="<?=url_base?>decadas/indice">
		<button class="boton-volver" role="link" name="inicio_decada" value="<?=$_COOKIE['inicio_decada']?>">Volver</button>	
	</form> <!--El botón te devuelve a la última década visitada-->

<?php else: ?> <!--Si no; es decir, existe para los recopilatorios-->

	<form method="post" action="<?=url_base?>recopilatorios/indice">
		<button class="boton-volver" role="link" name="recopilatorio" value="<?=$_COOKIE['recopilatorio']?>">Volver</button>	
	</form><!--El botón te devuelve al último año visitado-->

<?php endif; ?>