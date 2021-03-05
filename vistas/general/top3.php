		<div> <!--Bloque con cada una de las fotos del top 3-->

			<form class="contenedor-top3" id="contenedor-top3-<?=$contador?>" data-prueba="prueba" method="post" action="<?=url_base?>recopilatorios/indice">

				<img class="imagen-top3" id="imagen-top3-<?=$contador?>" src="<?=url_base?>recursos/imagenes/autores/<?=$nombre_autor?>.jpg">

				<div class="numero-top3" id="numero-top3-<?=$contador?>" data-contador2="<?=$contador?>"><?=$contador?></div>

				<div class="icono estrella-top3 oculto" id="estrella-top3-<?=$contador?>">R</div>
				
				<div class="nota-top3 oculto" id="nota-top3-<?=$contador?>"><?=$nota_media?></div>

				<div class="referencia-top3" id="referencia-top3-<?=$contador?>"><a href="<?=$foto_autor?>" target="_blank">&copy;</a></div> 

				<div class="texto-top3" id="texto-top3-<?=$contador?>">
					<span class="cancion-top3"><?=$titulo_cancion?></span>
					<span> de </span>  
					<span class= "autor-top3"><?=$nombre_autor_orden?></span> 
					<span class="ano-top3">(<button class="boton-enlace" role="link" name="recopilatorio" value="<?=$recopilatorio?>"><?=$ano?></button>)</span>
				</div>
									
			</form>

		</div>