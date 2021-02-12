		<main class="h100vh animsition" data-animsition-in-class="zoom-in">

			<section class="h-25"></section> <!--Separador vacío que ocupa el 25 % de la pantalla-->

			<section class="h-50 d-flex justify-content-center"> <!--Cuerpo que ocupa el 50 %-->

				<div class="align-self-center">

					<?php if($_COOKIE['fin_sesion']): ?>

						<h1 class="text-center"><span class="badge badge-info mb-3">Hemos cerrado tu sesión por seguridad</span></h1>

					<?php else: ?>

						<h1 class="text-center"><span class="badge badge-info mb-3">Tu sesión se ha cerrado correctamente</span></h1>

					<?php endif; ?>

					<div class="text-center">

						<h5 class="mb-3">Pero desde <span class="nombre-fin">50 años de Era Pop</span> te animamos a seguir con nosotros... <span style="color: mediumvioletred">:)</span></h5>

						<img class="imagen-fin" src="<?=url_base?>/recursos/imagenes/varias/bowie_pointing.jpg">
						
					</div>

					<div class="form-group form-inline justify-content-center mt-4">

						<div class="col ml-2 d-flex justify-content-end"><?php require_once("vistas/botones/inicio.php"); ?></div>	
						<div class="col"><?php require_once("vistas/botones/volver.php"); ?></div>

					</div>

				</div>

			</section>

			<section class="h-25"></section> <!--Separador vacío que ocupa el 25 % de la pantalla-->

		</main>