					<div> <!--Presentación y carrusel-->

						<div class="mt-4 mb-2" style="margin-left: -5.5px;"> <!--Presentación de cada carrusel: "Has votado x canciones con [foto de 5, 4 o 3 estrellas]"-->

							<h4 class="d-inline">Has votado <span style="color: mediumvioletred"><?=$maximo?></span> <?= ($maximo == 1) ? 'canción' : 'canciones'; ?> con </h4><img class="img-fluid d-inline pb-2" src="<?=url_base?>recursos/imagenes/varias/<?=$nota?>_estrellas.png" width="120">

						</div>

						<div id="carrusel<?=$nota?>" class="carousel slide" data-ride="carousel" data-interval="false" data-wrap="false" style="margin-left: -7px;"> <!--Inicio del carrusel en sí-->

							<div class="carousel-inner">