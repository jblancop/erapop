				<section class="col align-self-center ancho-min-0px"> <!--Zona de usuario en caso de que se haya iniciado sesión-->

					<div class="row d-flex align-items-center justify-content-center ancho-max-cabecera">
						<h4 class="puntos pb-1">¡Hola, <a class="usuario-conectado" href="<?=url_base?>usuarios/personal"><?=$_SESSION['conectado']?></a>!</h4> <!--Acceso a la página personal-->
						<a class="desconectar ml-2 mb-2 badge badge-danger" class="desconectar" href="<?=url_base?>usuarios/desconexion">Y adiós...</a>	<!--Cierre de sesión-->
					</div>

				</section>

			</div> <!--Cierre de la caja con función "row" que antes hacía la cabecera-->

			</header>

			</div> <!--Cierre de la falsa cabecera-->