				<?php if($leido == 1): ?>	

					<div class="mensaje-leido" data-id-mensaje="<?=$id?>">

				<?php else: ?>

					<div class="mensaje-no-leido" data-id-mensaje="<?=$id?>">

				<?php endif; ?>

						<span id="usuario-sesion" hidden="hidden"><?=$_SESSION['conectado'];?></span>
						<span id="id-usuario" hidden="hidden"><?=$_SESSION['id_usuario'];?></span>

						<div class="pb-2"><span class="nombre-usuario font-weight-bold" data-toggle="modal" data-target="#modal-usuarios" data-usuario="<?=$emisor?>" data-id-usuario="<?=$id_emisor?>"><?=$emisor?></span> te dijo <?=$tiempo_pasado_form?>:</div>

						<div class="font-italic"><?=$texto?></div>

					</div>