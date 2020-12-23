									<div class="celda-carrusel d-inline-block mx-1"> <!--Cada una de las celdas del carrusel con la foto y la información de la canción-->

										<div class="">
											<img class="img-fluid" src="<?=url_base?>/recursos/imagenes/<?=$decada?>/<?=$ano?>/<?=$nombre_foto?>.jpg" width="225" height="225">
										</div> <!--Portada del disco-->

										<form class="text-center" method="post" action="<?=url_base?>recopilatorios/indice"> <!--Formulario que contiene la información sobre la canción y permite acceder al recopilatorio en el que se encuentra-->

											<div class="text-truncate" style="font-size: 0.85em">
												<span><span class="font-italic"><?=$titulo_cancion?></span> de <span class="font-weight-bold"><?=$nombre_autor?></span></span>
											</div>
											
											<button class="badge btn btn-info btn-sm my-1" name="recopilatorio" value="<?=$recopilatorio?>"><?=$ano?></button>

										</form>

									</div>