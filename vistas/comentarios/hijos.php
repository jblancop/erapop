						<div class="col-12 pl-4" data-id="<?=$id?>"> <!--Comentarios hijos-->

							<?php if($nombre == $_SESSION['conectado']): ?> <!--Si el nombre del autor del comentario coincide con el del usuario conectado, haciendo clic en él se puede acceder al menú personal-->

								<div class="ancho-max-comentarios puntos"><span class="icono mr-2 pr-1" style="color: pink">></span><a class="nombre-usuario usuario-conectado font-weight-bold" href="<?=url_base?>usuarios/personal" data-usuario="<?=$nombre?>" data-id-usuario="<?=$id_usuario?>"><?=$nombre?></a>

							<?php else: ?> <!--De lo contrario, aparece como texto plano-->

								<div class="ancho-max-comentarios puntos"><span class="icono mr-2 pr-1" style="color: pink">></span><span class="nombre-usuario font-weight-bold" data-toggle="modal" data-target="#modal-usuarios" data-usuario="<?=$nombre?>" data-id-usuario="<?=$id_usuario?>"><?=$nombre?></span>

							<?php endif; ?> <!--En ambos casos, se muestra el tiempo transcurrido desde la publicación del mensaje y el texto de éste-->

								<span>dijo&nbsp</span><?=$tiempo_pasado_form?>:</div>

								<div class="comentario ml-4 mb-1 font-italic text-break"><?=$texto?></div>

							<?php if($nombre == $_SESSION['conectado'] and !$eliminado): ?> <!--Control de los botones; si el usuario conectado es el autor del mensaje, puede borrarlo; no se puede responder a los mensajes hijos-->

								<div class="botonera-comentarios oculto margen-izq1 mb-2"><span class="eliminar-comentario letra-comentarios ml-1 text-danger">Borrar</span></div>

							<?php endif; ?>

						</div>

