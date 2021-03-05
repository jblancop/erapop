				</section> <!--Cierre de la sección de carruseles-->

				<section class="row mt-5"> <!--Estadísticas y datos personales-->

					<div class="text-center col-7" style="background-color: aliceblue"> <!--Estadísticas-->

						<h4 class="texto-shadows-slategray pt-3 pb-1">Tus estadísticas</h4> <!--Título-->

						<?php if(!$numero_canciones): ?> <!--Si no se ha votado ninguna canción-->

							<h5>No has votado (todavía) ninguna canción</h5>

						<?php else: ?> <!--Si se ha votado alguna-->

							<h5>Has votado <span style="color: mediumvioletred"><?=$numero_canciones?></span> <?= ($numero_canciones == 1) ? "canción" : "canciones"; ?> con <span style="color: mediumvioletred"><?=$nota_media_global?></span> estrellas</h5>

						<?php endif; ?>

						<canvas id="histograma" class="animsition"></canvas> <!--Gráfico de barras con las votaciones-->

						<?php require_once("recursos/js/histograma.php"); ?>

						<?php if($ano): ?> <!--Información de las votaciones por año-->

							<h5>Tu año favorito es <span style="color: mediumvioletred"><?=$ano?></span> con <span style="color: mediumvioletred"><?=$nota_media_anual?></span> estrellas</h5>

						<?php else: ?>

							<h5 class="pb-3">Como aún no te has estrenado en <span style="color: mediumvioletred">50 años de Era Pop</span> no tienes año o década favoritos... Habrá que solucionarlo, ¿no?</h5>

						<?php endif; ?>

						<?php if($decada): ?> <!--Información de las votaciones por década-->

							<h5 class="pb-3">Tu decada favorita son los <span style="color: mediumvioletred"><?=$decada?></span> con <span style="color: mediumvioletred"><?=$nota_media_decada?></span> estrellas</h5>

						<?php endif; ?>

					</div>

					<div class="col"></div> <!--Separador entre las estadísticas y los datos personales-->
