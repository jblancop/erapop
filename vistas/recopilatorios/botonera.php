			<nav class="container botonera oculto "> <!--Botonera ocultable para los recopilatorios-->

				<section class="row mt-3 d-flex justify-content-center"> <!--Botonera compuesta de conjunto de botones para elegir década flanqueado por botones para retroceder y avanzar de año y botón inicio final-->

					<form class="col-1 d-flex align-self-center justify-content-end" style="z-index: 1; transform: translateX(1em);" method="post" action="<?=url_base?>recopilatorios/indice"> <!--Botón para retroceder de año-->
						
						<button class="boton-enlace badge" name="recopilatorio" value="<?=$ano_pasado?>">< <?=$ano_pasado?></button>

					</form>
						
					<form class="col-8" method="post" action="<?=url_base?>decadas/indice"> <!--Conjunto de botones para elegir la década-->

						<div class="container-fluid navbar navbar-default btn-group">

							<?php for($i = 0; $i < count($decadas); $i++): ?>

								<button class="btn btn-info" name="inicio_decada" value="<?=$decadas[$i]?>"><?=$decadas[$i]?>s</button>

							<?php endfor; ?>

						</div>

					</form>

					<form class="col-1 d-flex align-self-center" style="transform: translateX(-1em);" method="post" action="<?=url_base?>recopilatorios/indice"> <!--Botón para avanzar de año-->
						
						<button class="boton-enlace badge" name="recopilatorio" value="<?=$ano_siguiente?>"><?=$ano_siguiente?> ></button>

					</form>

					<div class="col-2 d-flex align-items-center justify-content-center"> <!--Botón inicio-->
					
						<?php require_once("vistas/botones/inicio.php"); ?>

					</div>

				</section>

			</nav>

			<main class="container mt-3" data-animsition-in-class="zoom-in-sm"> <!--Cuerpo principal de la página de recopilatorios-->

			<div class="row"> <!--Suple la función "row" que antes hacía el cuerpo-->

				<section class="col"> <!--Columna con los vídeos, la información desglosada de las canciones y el sistema de votación-->