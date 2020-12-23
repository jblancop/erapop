<!--Modal para mostrar las décadas en la página de inicio y en la página personal-->

<form method="post" action="<?=url_base?>decadas/indice">

	<div id="modal-decadas" class="modal fade" role="dialog">

		<div class="modal-dialog modal-dialog-centered">
	
			<div class="modal-content"> <!--Contenido-->

				<div class="modal-header justify-content-center"><h5>Elige tu <span style="color: mediumvioletred">década</span> favorita</h5></div> <!--Cabecera-->

				<div class="modal-body d-flex justify-content-center"> <!--Cuerpo-->
			
					<?php for($i = 0; $i < count($decadas); $i++): ?> 

						<button class="btn btn-info d-block mx-1 mb-2" name="inicio_decada" value="<?=$decadas[$i]?>"><?=$decadas[$i]?>s</button>

					<?php endfor; ?>

				</div>

			</div>

		</div>

	</div>

</form>