					<div class="text-center my-4"> <!--Texto en caso de que el usuario no haya votado ninguna canción-->

						<h3 class="font-weight-bold">¡Vaya, parece que llevas poco tiempo por aquí!</h3>

						<h4>
							No pasa nada, en cuanto te des una vuelta por <span style="color: mediumvioletred">50 años de Era Pop</span> y votes con al menos <span style="color: mediumvioletred">3</span> estrellas alguna canción, esta aburrida explicación se convertirá en...
						</h4>

						<h4 class="font-italic">¿Y si lo descubres por ti mismo? <span style="color: mediumvioletred">;)</span></h4>

						<button class="btn btn-info mt-2" data-toggle="modal" data-target="#modal-decadas" type="submit">¡Vamos!</button>

						<?php require_once("vistas/modales/decadas.php"); ?>

					</div>