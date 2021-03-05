<!--Modal para la edición de los recopilatorios personales-->

<div id="modal-editar-lista-<?=$id_lista?>" class="modal fade" role="dialog" data-id-lista-editar="<?=$id_lista?>">
	
	<div class="modal-dialog modal-dialog-centered modal-sm">
		
		<div class="modal-content"> <!--Contenido-->

			<div class="modal-header justify-content-center"><h5 class="pt-2">Edita tu <span style="color: mediumvioletred">recopilatorio</span></h5></div> <!--Cabecera-->

			<div class="modal-body" style="padding-bottom: 0px;"> <!--Cuerpo-->
				
				<input class="form-control mb-2 nombre-lista-editar" type="text" minlength="3" maxlength="25" name="nombre-lista" placeholder="¿Nuevo nombre?" value="<?=$nombre_lista?>" required/>

				<textarea class="form-control descripcion-editar" name="descripcion" placeholder="¿Nueva descripción?" maxlength="200" rows="3" cols="67.5"><?=$descripcion?></textarea>

			</div>

			<div class="modal-footer"> <!--Pie-->

				<button class="btn btn-info editar-lista-modal" type="submit">¡Adelante!</button>

			</div>

		</div>

	</div>

</div>