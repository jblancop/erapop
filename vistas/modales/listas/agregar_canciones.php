<!--Modal para mostrar las listas personales del usuario y acceder a ellas-->

<div id="modal-agregar-canciones" class="modal fade" role="dialog">

	<?php if($numero_listas == 0): ?> <!--En caso de que el usuario aún no haya hecho ninguna lista, el modal es de tamaño normal-->

		<div class="modal-dialog modal-dialog-centered">

	<?php else: ?> <!--En caso contrario, de tamaño grande-->

		<div class="modal-dialog modal-dialog-centered modal-lg">

	<?php endif; ?>

			<div class="modal-content"> <!--Contenido-->

				<div class="modal-header justify-content-center"><h5>Tus recopilatorios <span style="color: mediumvioletred">personalizados</span></h5></div> <!--Cabecera-->

				<div class="modal-body" style="padding-bottom: 0px;">
					
					<?php if($numero_listas == 0): ?> <!--En caso de que el usuario aún no haya hecho ninguna lista, se le invita a crear una-->

						<h6 class="text-center">Vaya, parece que aún no has creado ninguna lista con tus canciones favoritas... Si te apetece, ¡simplemente haz clic!</h6>

					<?php else: ?>

						<ul class="list-group list-group-flush">
							
							<?php for($i = 1; $i <= count($listas); $i++): ?> <!--En caso contrario, se muestra una lista con los recopilatorios-->

								<li class="list-group-item">

									<span class="vinetas"><?=$i?>) </span> <!--Contador-->
									<span class="font-italic"><?=$listas[$i - 1]->nombre_lista?> </span> <!--Título del recopilatorio-->
									<span style="color: mediumvioletred;"> | </span> <!--Separador-->
									<span>Incluye <span class="font-weight-bold"><?=$listas[$i - 1]->numero_canciones?></span><?=$listas[$i - 1]->numero_canciones == 1 ? " canción" : " canciones"?><span> <!--Número de canciones-->
									<span style="color: mediumvioletred;"> | </span> <!--Separador-->
									<span><?=$listas[$i - 1]->numero_canciones == 0 ? "Creado " : "Actualizado "?><?=Utilidades::tiempo_pasado($listas[$i - 1]->tiempo_pasado)?></span> <!--Tiempo desde la creación o última inclusión-->
									<a class="agregar-cancion badge badge-info"><span style="color: white;">Añádela</span></a> <!--Botón para añadir la canción-->

									<span class="oculto"><?=$listas[$i - 1]->id_lista_youtube?></span> <!--Etiquetas ocultas para el script de jQuery-->
									<span class="oculto"><?=$listas[$i - 1]->id_cancion?></span>

								</li>

							<?php endfor; ?>

						</ol>

					<?php endif; ?>

				</div> <!--Cuerpo-->
				
				<div class="modal-footer"> <!--Pie con el botón de acceso al menú con los recopilatorios personales-->

					<?php if($numero_listas == 0): ?>

						<button class="btn btn-info btn-sm" onclick="window.location='<?=url_base?>usuarios/listas'">¡Vamos!</button>

					<?php else: ?>

						<button class="btn btn-info btn-sm" onclick="window.location='<?=url_base?>usuarios/listas'">Edición en detalle</button>

					<?php endif; ?>

				</div>

			</div>

		</div>

</div>