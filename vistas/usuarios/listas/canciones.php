					<form class="cancion-lista row d-flex" method="post" action="<?=url_base?>recopilatorios/indice"> <!--Bloque con cada una de las canciones de cada lista-->
							<span class="numero-decada" style="transform: translateY(-2px);"><?=$orden?></span> <!--Puesto en el recopilatorio-->

							<span class="cancion-autor-ano puntos pl-3"> <!--Información de la canción-->
								<span class="font-italic"><?=$titulo_cancion?></span>
								<span> de </span>
								<span class="font-weight-bold"><?=$nombre_autor?></span>
								<span>(<button class="boton-enlace" role="link" name="recopilatorio" value="<?=$recopilatorio?>"><?=$ano?></button>)</span>
							</span>

							<span class="ml-auto"> <!--Reproductor de sonido-->
								<span class="enlace-youtube" data-video="<?=$id_youtube?>"></span>
								<span class="caja-youtube"></span>
							</span>

					</form>