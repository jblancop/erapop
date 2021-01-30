			<div class="falso-pie mt-5" style="background-color: pink"> <!--Falso pie que ocupa todo el espacio posible-->

			<footer class="container"> <!--Pie de página-->

				<div class="row py-3"> <!--Caja que suple la función "row" que antes hacía el pie-->
					
					<div class="w-25"><span class="nombre-web">50 años de Era Pop <span class="font-weight-bold">&copy;</span> <?=date("Y")?></span></div>

					<div class="w-25 text-center"><a class="enlace-pie" href="mailto:50erapop@gmail.com">Contáctanos</a></div>

					<div class="w-25 text-center"><a class="enlace-pie" href="https://www.youtube.com/channel/UCc70HaaiseLtnjjc7RNjNLg/videos?view_as=subscriber" target="_blank">Canal de YouTube</a></div>

					<div class="w-25 text-right"><span class="enlace-pie" data-toggle="modal" data-target="#modal-legal">Aviso legal y otras movidas</span></div>

					<?php require_once("vistas/modales/legal.html"); ?>

				<div>

			</footer>

			<div>

		</div> <!--Contenedor inicial con class=animisition"-->

	</body>

</html>