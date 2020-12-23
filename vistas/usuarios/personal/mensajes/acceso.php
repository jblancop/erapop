				<?php if($numero_mensajes == 0): ?>

					<h4>No tienes mensajes</h4>

				<?php elseif($no_leidos == 0): ?>

					<h4>No tienes nuevos <a class="usuario-conectado" href="<?=url_base?>usuarios/mensajes">mensajes</a></h4>

				<?php else: ?>

					<h4>Tienes nuevos <a class="usuario-conectado" href="<?=url_base?>usuarios/mensajes">mensajes</a> (<p class="no-leidos"><?=$no_leidos?></p>)</h4>

				<?php endif; ?>

				</div> <!-- Cierre de los mensajes privados-->

			</div> <!--Cierre del div que suple la función "row" que antes hacía la cabecera-->

			</header>

			</div> <!--Cierre de la falsa cabecera que ocupa todo el ancho posible-->

			<main class="container"> <!--Cuerpo principal del perfil-->

				<section class="animsition ml-2 row" data-animsition-in-class="zoom-in-sm"> <!--Carruseles (o texto animando a votar por primera vez)-->