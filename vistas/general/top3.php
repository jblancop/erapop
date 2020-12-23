		<div> <!--Bloque con cada una de las fotos del top 3-->

			<form class="contenedor-top3" data-prueba="prueba" method="post" action="<?=url_base?>recopilatorios/indice">

				<img class="imagen-top3" src="<?=url_base?>recursos/imagenes/autores/<?=$nombre_autor?>.jpg">

				<div class="numero-top3" data-contador2="<?=$contador?>"><?=$contador?></div>

				<div class="icono estrella-top3 oculto">R</div>
				
				<div class="nota-top3 oculto"><?=$nota_media?></div>

				<div class="referencia-top3"><a href="<?=$foto_autor?>" target="_blank">&copy;</a></div> 
				<div class="texto-top3"><span class="cancion-top3"><?=$titulo_cancion?></span> de <span class= "autor-top3"><?=$nombre_autor_orden?></span> <span class="ano-top3">(<button class="boton-enlace" role="link" name="recopilatorio" value="<?=$recopilatorio?>"><?=$ano?></button>)</span></div>
									
			</form>

		</div>