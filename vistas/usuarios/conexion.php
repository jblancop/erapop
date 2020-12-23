				<section class="col align-self-center"> <!--Zona de usuario en caso de que no se haya iniciado sesión-->

					<div class="text-center" style="color: mediumvioletred">

						¿<a class="enlace-usuario" href="" data-toggle="modal" data-target="#modal-iniciar-sesion">Estás de vuelta</a> <!--Inicio de sesión-->

						o eres

						<a class="enlace-usuario" href="<?=url_base?>usuarios/registro">nuevo por aquí</a>? <!--Registro de usuarios-->

					</div>

					<?php require("vistas/modales/sesion.html"); ?> <!--Modal para el inicio de sesión-->

				</section>

			</div> <!--Cierre de la caja con función "row" que antes hacía la cabecera-->

			</header>

			</div> <!--Cierre de la falsa cabecera-->