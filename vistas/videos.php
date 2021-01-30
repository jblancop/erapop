					<div class="row contenedor-youtube pt-4"><iframe class="youtube" width="575" height="323.5" src="<?=$enlace_youtube?>" allowfullscreen></iframe></div> <!--Vídeo de YouTube-->

					<div class="row pt-2"> <!--Portada del disco, información relativa a la canción y sistema de votación-->

						<div class="contenedor-portada mr-2" data-toggle="modal" data-target="#modal-imagen" > <!--Portada del disco-->
							<img class="portada img-fluid" src="<?=url_base?>/recursos/imagenes/<?=$decada?>/<?=$ano?>/<?=$nombre_foto?>.jpg" width="150" height="150">
						</div>

						<?php require("vistas/modales/imagen.html"); ?> <!--Modal que despliega la portada a mayor tamaño-->

						<div class="col"> <!--Información relativa a la canción y sistema de votación-->
							
							<div class="row"> <!--Información relativa a la canción (incluyendo su puesto en la clasificación)-->

								<div class="mr-3"><span class="numero" data-contador="<?=$contador?>"><?=$contador?></span></div> <!--Puesto en la clasificación-->

								<div class="col informacion ancho-min-0px"> <!--Resto de la información-->

									<div class="row ancho-max-videos"> <!--Canción y autor-->

										<div class="puntos">

											<span id="<?=$id_cancion?>" class="cancion font-italic"><?=$titulo_cancion?></span> de&nbsp<span id="<?=$id_autor?>"><a class="autor-recopilatorio" href="<?=$enlace_rym?>" target="_blank"><?=$nombre_autor?></a></span>

										</div>

									</div> 

									<div class="row ancho-max-videos"> <!--Ciudad y país-->

										<div><img class="mundo img-fluid" src="<?=url_base?>recursos/imagenes/varias/icono_mundo.png" width="18" height="18"></div>
										<div class="col pl-2"><div class="puntos"><?=$nombre_ciudad?> (<?=$nombre_pais?>)</div></div>

									</div> 

									<div class="row ancho-max-videos"> <!--Tipo de disco, título y año (en caso de que sea la página de décadas)-->

										<div class="puntos">
										
											<span>Incluida en su <?=$tipo?>&nbsp<span class="font-italic"><?=$titulo_disco?></span>&nbsp<?=$ano_disco?></span>

										</div>

									</div> 
									
									<div class="row ancho-max-videos"> <!--Subestilos-->

										<div class="puntos">
										
											<?php foreach($subestilos as $clave => $subestilo): ?>

													<a class="boton-subestilo badge badge-info" data-toggle="modal" data-target="#modal-subestilo"><span style="color: white;"><?=$subestilo?></span></a>

											<?php endforeach; ?>

										</div>

										<?php require("modales/sugerencias.html"); ?> <!--Modal con sugerencias de canciones similares-->

									</div>
									
								</div>

							</div>
						  
							<div class="d-flex row mt-1"> <!--Sistema de votación-->

								<span class="estrellas mt-3 ml-2"> <!--Estrellas-->

									<?php if($_SESSION['conectado']): ?> <!--Si el usuario está conectado-->

										<?php for($i = 1; $i <= 5; $i++): ?> <!--Se crea un radiobotón de 5 unidades-->

											<input type="radio" name="<?=$id_cancion?>" value="<?=$i?>" <?= ($i == $nota) ? 'checked data-actual="true"' : 'data-actual="false"'; ?>><i></i> <!--Todos identificados por el id de la canción pero cada uno con un valor de 1 a 5; si el valor equivale a la $nota que está registrada en la BD, el radiobotón aparece marcado y con el data-actual con valor verdadero; de lo contrario, no aparece marcado y el data-actual será falso-->

										<?php endfor; ?>

									<?php endif; ?>
										
								</span>

								<div class="badge badge-pill badge-warning mt-3 ml-2 d-flex align-items-center justify-content-center"><?=$nota_media?></div> <!--Nota media-->

								<div class="mt-3 ml-2" style="transform: translateY(2px);"><span class="font-weight-bold"><?=$votos_web?>&nbsp</span><?=$coletilla?></div> <!--Número de votos-->

								<?php if($_SESSION['conectado']): ?> <!--Si el usuario está conectado-->

									<div class="boton-recopilame mt-3 ml-auto" data-toggle="modal" data-target="#modal-listas"><small>¡Recopílame!</small></div> <!--Se muestra el botón para añadir la canción a una lista de reproducción-->

									<?php require_once("vistas/modales/listas.php"); ?>

								<?php endif; ?>

							</div>

						</div>

					</div>				