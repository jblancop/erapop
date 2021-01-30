				<?php if($leido == 1): ?> <!--Si el mensaje está marcado como leído, se muestra en color azul-->

					<div class="mensaje-leido ancho-max-mensajes" data-id-mensaje="<?=$id?>" style="z-index: 1">

				<?php else: ?> <!--Si no, en rojo-->

					<div class="mensaje-no-leido ancho-max-mensajes" data-id-mensaje="<?=$id?>" style="z-index: 1">

				<?php endif; ?>

						<span id="usuario-sesion" hidden="hidden"><?=$_SESSION['conectado'];?></span> <!--Parámetros ocultos para que los utilice jQuery-->
						<span id="id-usuario" hidden="hidden"><?=$_SESSION['id_usuario'];?></span>

						<div class="puntos" style="z-index: 1"><span class="nombre-usuario font-weight-bold" data-toggle="modal" data-target="#modal-usuarios" data-usuario="<?=$emisor?>" data-id-usuario="<?=$id_emisor?>"><?=$emisor?></span> te dijo <?=$tiempo_pasado?>:</div> <!--Encabezado del mensaje-->

						<div class="font-italic ml-2 text-break"><?=$texto?></div> <!--Texto del mensaje-->

					</div>