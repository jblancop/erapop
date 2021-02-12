<!--Modal para la creación de recopilatorios personales-->

<div id="modal-crear_lista" class="modal fade" role="dialog">
	
	<div class="modal-dialog modal-dialog-centered modal-sm">
		
		<div class="modal-content"> <!--Contenido-->

			<div class="modal-header justify-content-center"><h5 class="pt-2">Tu <span style="color: mediumvioletred">recopilatorio</span> personal</h5></div> <!--Cabecera-->

			<div class="modal-body" style="padding-bottom: 0px;"> <!--Cuerpo-->
				
				<input class="form-control mb-2 nombre-lista" type="text" minlength="3" maxlength="25" name="nombre-lista" placeholder="Ponle un nombre" required/>

				<textarea class="form-control descripcion" name="descripcion" placeholder="¿De qué va tu nueva lista?" maxlength="200" rows="3" cols="67.5"></textarea>

			</div>

			<div class="modal-footer"> <!--Pie-->

				<button class="btn btn-info crear-lista" type="submit">¡Adelante!</button>

			</div>

		</div>

	</div>

</div>