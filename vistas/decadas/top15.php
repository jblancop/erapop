					<div class="row mt-3"> <!--Lista con las 15 mejores canciones de la década-->

						<div class="estrechamiento contenedor-portada mr-2" data-toggle="modal" data-target="#modal-imagen"> <!--Portada del disco-->
							<img class="estrechamiento portada img-fluid" src="<?=url_base?>recursos/imagenes/<?=$decada?>/<?=$ano?>/<?=$nombre_foto?>.jpg" width="50" height="50">
						</div>

						<?php require("vistas/modales/imagen.html"); ?> <!--Modal que despliega la portada a mayor tamaño-->

						<div class="col ml-3"> <!--Información relativa a la canción-->
							
							<div class="row">

								<div class="mr-3"><span class="numero-decada"><?=$contador?></span></div> <!--Puesto en la clasificación (de 1ª a 15ª)-->

								<form class="col ancho-100px" method="post" action="<?=url_base?>recopilatorios/indice"> <!--Resto de datos-->

									<div class="row">

										<div class="puntos"> <!--Título de la canción, nombre del autor y año (que sirve de enlace al recopilatorio)-->

											<span class="font-italic cancion-decada"><?=$titulo_cancion?></span> de <span class="autor-decada"><?=$nombre_autor?></span>&nbsp(<button class="boton-enlace" role="link" name="recopilatorio" value="<?=$recopilatorio?>"><?=$ano?></button>)
										
										</div>
											
									</div>

									<div class="row"> <!--Nota media y número de votos-->

										<span class="font-weight-bold"><?=$nota_media?>&nbsp</span>estrellas con<span class="font-weight-bold">&nbsp<?=$votos_web?>&nbsp</span><?=$coletilla?> 
											
									</div>

								</form>

							</div>

						</div>

					</div>