			<nav class="container botonera oculto"> <!--Botonera ocultable para las décadas-->

				<section class="mt-3 row d-flex justify-content-center"> <!--Botonera compuesta de conjunto de botones para elegir un año de la década en curso, flanqueado por botones para retroceder y avanzar de década, y botón inicio final-->

					<form class="col-1 d-flex align-self-center justify-content-end" method="post" action="<?=url_base?>decadas/indice" style="z-index: 1; transform: translateX(0.25em);"> <!--Botón para retroceder de década-->

							<button class="boton-enlace badge" name="inicio_decada" value="<?=$decada_pasada?>">< <?=substr($decada_pasada, 2, 4)?>s</button>

					</form>

					<form class="col-9" method="post" action="<?=url_base?>recopilatorios/indice" style="transform: translateX(-1em);"> <!--Botones para elegir un año de la década-->

						<div class="container-fluid navbar navbar-default btn-group">

							<?php for($i = 0; $i < 10; $i++): ?>

								<button class="btn btn-info" name="recopilatorio" value="<?=$recopilatorio?>"><?=$recopilatorio?></button>

							<?php $recopilatorio++; endfor; ?>

						</div>

					</form>

					<form class="col-1 d-flex align-self-center" method="post" action="<?=url_base?>decadas/indice" style="transform: translateX(-2.25em);"> <!--Botón para avanzar de década-->
						
						<button class="boton-enlace badge" name="inicio_decada" value="<?=$decada_siguiente?>"><?=substr($decada_siguiente, 2, 4)?>s ></button>

					</form>

					<div class="col-1 d-flex align-self-center" style="transform: translateX(-1.5em);"> <!--Botón inicio-->
					
						<?php require_once("vistas/botones/inicio.php"); ?>

					</div> 

				</section>

			</nav>

			<main class="container mt-3 animsition" data-animsition-in-class="fade-in-right"> <!--Cuerpo principal de la página de décadas-->

			<div class="row"> <!--Suple la función "row" que antes hacía el cuerpo-->
	
				<aside class="col mt-3 mr-5"> <!--Columna con la lista con las 15 mejores canciones de la década y el sistema de comentarios-->

					<div class="relleno-der row d-flex justify-content-end mt-2 mb-4"><h4 class="letras-top15">Vuestras 15 favoritas de los <?=substr($inicio_decada, 2, 4)?>s</h4></div> <!--Encabezado-->