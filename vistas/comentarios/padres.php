						<div class="col-12 pt-2" data-id="<?=$id?>"> <!--Comentarios padres-->

							<?php if($nombre == $_SESSION['conectado']): ?> <!--Si el nombre del autor del comentario coincide con el del usuario conectado, haciendo clic en él se puede acceder al menú personal-->

								<div class="ancho-max-comentarios puntos"><a class="nombre-usuario usuario-conectado font-weight-bold" href="<?=url_base?>usuarios/personal" data-usuario="<?=$nombre?>" data-id-usuario="<?=$id_usuario?>"><?=$nombre?></a>
							
							<?php else: ?> <!--De lo contrario, aparece como texto plano-->
							
								<div class="ancho-max-comentarios puntos"><span class="nombre-usuario font-weight-bold" data-toggle="modal" data-target="#modal-usuarios" data-usuario="<?=$nombre?>" data-id-usuario="<?=$id_usuario?>"><?=$nombre?></span>

							<?php endif; ?> <!--En ambos casos, se muestra el tiempo transcurrido desde la publicación del mensaje y el texto de éste-->

								<span class="revelar-botones">dijo&nbsp</span><?=$tiempo_pasado?>:</div>

								<div class="comentario ml-2 mb-1 font-italic text-break"><?=$texto?></div>

							<?php if($nombre == $_SESSION['conectado'] and !$eliminado): ?> <!--Control de los botones; si el usuario conectado es el autor del mensaje, además de responder, puede borrarlo-->

								<div class="botonera-comentarios oculto ml-2 mb-2"><span class="responder letra-comentarios text-info">Responder</span><span class="eliminar-comentario letra-comentarios ml-1 text-danger">Borrar</span></div>

							<?php elseif($_SESSION['conectado'] and !$eliminado): ?> <!--El resto de usuarios que estén conectados sólo pueden responder; los anónimos, sólo ver-->

								<div class="botonera-comentarios oculto ml-2 mb-2"><span class="responder letra-comentarios text-info">Responder</span></div>

							<?php endif; ?>

						</div>