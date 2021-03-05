					<div class="my-4"> <!--Botonera-->

						<a class="eliminar-lista badge badge-danger"><span style="color: white;">Eliminar</span></a> <!--Botón para añadir la canción-->
						<a class="editar-lista badge badge-warning" data-toggle="modal" data-target="#modal-editar-lista-<?=$id_lista?>"><span style="color: white;">Editar</span></a> <!--Botón para añadir la canción-->

						<?php require("vistas/modales/listas/editar_lista.php"); ?>

						<?php if($numero_canciones > 14): ?>

							<a class="publicar-lista badge badge-success"><span style="color: white;">Publicar</span></a> <!--Botón para añadir la canción-->

						<?php endif; ?>

					</div>

				</div> <!--Cierre de las columnas con las listas-->