							</div> <!--Cierre de la clase "carousel-inner"-->

							<?php if($maximo > 5): ?> <!--Sólo aparecen los controladores si el número de foto es mayor a 5; se han borrado los iconos de Bootstrap por un comportamiento extraño-->

								<div class="icono boton-controlador" style="transform: translate(15px, 92px);"><</div> <!--Falso icono previo-->
							
								<a class="carousel-control-prev control-previo" href="#carrusel<?=$nota?>" role="button" data-slide="prev"> <!--Controlador previo-->
								</a>

								<div class="icono boton-controlador" style="transform: translate(1080px, 92px);">></div> <!--Falso icono siguiente-->

								<a class="carousel-control-next control-siguiente" href="#carrusel<?=$nota?>" role="button" data-slide="next"> <!--Controlador siguiente-->
								</a>

							<?php endif; ?>

						</div> <!--Cierre del carrusel-->

					</div> <!--Cierre del bloque presentación y carrusel-->