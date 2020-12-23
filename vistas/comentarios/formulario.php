					<section class="formulario-comentarios row d-flex mt-5"> <!--Formulario para la inserción de comentarios; en la página de los recopilatorios necesita "justify-content-end" y le sobra "pl-2"-->

						<div>

							<?php if($_SESSION['conectado']): ?> <!--Sólo se muestra si el usuario está conectado; no se pueden dejar comentarios anónimos-->

								<span id="ano-actual" hidden="hidden"><?=$_POST['recopilatorio']?></span> <!--Parámetros ocultos para los scripts de jQuery-->
								<span id="decada-actual" hidden="hidden"><?=$_POST['inicio_decada']?></span>
								<span id="usuario-sesion" hidden="hidden"><?=$_SESSION['conectado'];?></span>
								<span id="id-usuario" hidden="hidden"><?=$_SESSION['id_usuario'];?></span>

								<h5 class="ancho-max-formulario puntos">¿Y tú qué opinas, <a class="usuario-conectado" href="<?=url_base?>usuarios/personal"><?=$_SESSION['conectado']?></a>?</h5>

								<div class="form-group">
									<textarea class="form-control caja-texto" placeholder="¡Habla ahora (con un límite de 200 caracteres) o calla para siempre! ;P" maxlength="200" rows="3" cols="67.5"></textarea>
								</div>

								<div class="form-group form-inline">
									<button class="btn btn-info mr-1 envio-comentario" type="submit">¡Adelante!</button>
									<button class="btn btn-info mr-2 borrado-comentario" type="reset">Algo no me convence...</button>
								</div>

							<?php endif; ?>

						</div>

					</section>

					<?php if($_SESSION['conectado']): ?> 

						<section class="lista-comentarios comentarios-decadas row mt-2" style="background-color: aliceblue"> <!--Panel de comentarios padres e hijos-->

					<?php else: ?>

						<section class="lista-comentarios comentarios-decadas2 row mt-2" style="background-color: aliceblue"> <!--Si el usuario no está conectado, en la página de lás décadas su tamaño es mayor-->

					<?php endif; ?>