		<div class="animsition" data-animsition-in-class="fade-in-left-sm">	<!--Inicio de la vista de la página de décadas-->

			<div style="background-color: pink"> <!--Falsa cabecera que ocupa todo el ancho posible-->

			<header class="container"> <!--Cabecera para las décadas-->

			<div class="row"> <!--Suple la función "row" que antes hacía la cabecera-->

				<section class="col" style="padding: 0px;"> <!--Título y subtítulo-->	

					<h1 class="display-4 py-1"> <!--Título-->

						<?php if($inicio_decada == "1960"): ?>

							<h1 class="display-4">Estás en los <span class="violeta-encabezado">Sesenta</span><h1>

						<?php elseif($inicio_decada == "1970"): ?>

							<h1 class="display-4">Estás en los <span class="violeta-encabezado">Setenta</span><h1>

						<?php elseif($inicio_decada == "1980"): ?>

							<h1 class="display-4">Estás en los <span class="violeta-encabezado">Ochenta</span><h1>

						<?php elseif($inicio_decada == "1990"): ?>

							<h1 class="display-4">Estás en los <span class="violeta-encabezado">Noventa</span><h1>

						<?php else: ?>

							<h1 class="display-4">Estás en los <span class="violeta-encabezado">Dos mil</span><h1>

						<?php endif; ?>
							
					</h1>

					<h4 class="texto-shadows-slategray pl-1 pb-2">150 canciones para definir una década</h4> <!--Subtítulo-->

				</section>