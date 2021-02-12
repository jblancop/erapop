					<div class="mensaje-leido mensaje-enviado ancho-max-mensajes" data-id-mensaje="<?=$id?>" style="z-index: 0"> <!--Mensaje-->
						
						<div class="puntos">Le dijiste a <span class="font-weight-bold" data-usuario="<?=$receptor?>"><?=$receptor?></span> <?=$tiempo_pasado?>:</div> <!--Encabezado-->

						<div class="texto-mensaje font-italic ml-2 mb-1 text-break"><?=$texto?></div> <!--Cuerpo-->

						<?php if(!$eliminado): ?> <!--Botón de borrado-->

							<div class="boton-mensaje oculto ml-2"><span class="eliminar-mensaje letra-mensajes text-danger">Borrar</span></div>

						<?php endif; ?>

					</div>