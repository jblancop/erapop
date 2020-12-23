		<main class="h100vh animsition container" data-animsition-in-class="zoom-in">

			<section class="h-25"></section> <!--Separador vacío que ocupa el 25 % de la pantalla-->

			<section class="h-50 d-flex justify-content-center">

				<div class="align-self-center">

					<h1 class="titulo-registro display-4 text-center mb-4">Parece que tenemos un lindo <span class="violeta-encabezado">usuario</span> nuevo...</h1>

					<form id="form-alta-usuario" method="post" onSubmit="return false">

						<div class="form-group row">
							<label class="col-2 col-form-label" for="nombre">Tu nombre</label>
							<input class="col-10" id="nombre" type="text" maxlength="25" name="nombre" placeholder="Ejemplo: Indi3_Geek" style="max-width: 82%;"/>
							<h6 class="col-2">hola</h6>
							<small class="col-10 form-text text-muted">El apodo que prefieras con tal de que tenga al menos tres caracteres y no más de veinticinco</small>
						</div>
						
						<div class="form-group row">
							<label class="col-2 col-form-label" for="correo">Un correo</label>
							<input class="col-10" id="correo" type="email" maxlength="100" name="correo" placeholder="Ejemplo: indi3geek@musicmail.org" autocomplete="on" style="max-width: 82%;"/>
							<h6 class="col-2">hola</h6>
							<small class="col-10 form-text text-muted">Utiliza una dirección de correo electrónico que utilices habitualmente en caso de que necesitemos contactar contigo</small>
						</div>

						<div class="form-group row">
							<label class="col-2 col-form-label" for="contrasena">Una contraseña</label>
							<input class="col-4" id="contrasena" type="password" name="contrasena" maxlength="25" placeholder="Mejor no dar ejemplos..." autocomplete="off" style="max-width: 32.69%;"/>
							<label class="col-2 col-form-label" for="contrasena2">Si nos la confirmas...</label>
							<input class="col-4" id="contrasena2" type="password" name="contrasena2" maxlength="25" autocomplete="off" style="max-width: 32.69%;"/>
							<h6 class="col-2">hola</h6>
							<small class="col-10 form-text text-muted">De nuevo, sólo la restricción de los caracteres (entre 3 y 25)</small>
						</div>

					</form>

					<div class="form-group form-inline">
						<button class="btn btn-info mr-1" id="registrar-usuario" form="form-alta-usuario" type="submit">¡Adelante!</button>
						<button class="btn btn-info mr-2 borrado-registro" form="form-alta-usuario" type="reset">Algo no me convence...</button>
						<?php require_once("vistas/botones/volver.php"); ?>
					</div>

				</div>

			</section>

			<section class="h-25"></section> <!--Separador vacío que ocupa el 25 % de la pantalla-->

		</main>

		