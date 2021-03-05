			<?php if($numero_canciones > 14): ?>

				<div class="col-4 text-center lista-individual lista-15" data-id-lista="<?=$id_lista?>"> <!--Cada una de las listas personales-->

			<?php else: ?>

				<div class="col-4 text-center lista-individual" data-id-lista="<?=$id_lista?>"> <!--Cada una de las listas personales-->

			<?php endif; ?>
					
					<h2 class="pt-4 font-italic font-weight-bold" style="font-family: 'Shadows Into Light', cursive;"><?=$nombre_lista?></h2>

					<p class="mt-3 text-break" style="color: mediumvioletred;"><?=$descripcion?></p>