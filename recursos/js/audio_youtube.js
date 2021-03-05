/* 1. Carga asíncrona de la API Iframe de YouTube */

var tag = document.createElement('script'); //Creación de un elemento <script>

tag.src = "https://www.youtube.com/iframe_api"; //Definición del src del <script> 

var firstScriptTag = document.getElementsByTagName('script')[0]; //Se toma el primero de todos los elementos <script> que hay en <head>;
//en mi caso es uno de jQuery que necesita Bootstrap para su funcionamiento

var newNode = firstScriptTag.parentNode.insertBefore(tag, firstScriptTag); //Inserta un nodo (tag) antes del nodo de referencia (firstScriptTag) como hijo de un nodo padre (firstScriptTag.parentNode) indicado
//tag es el <script> creado
//firstScriptTag es el primer <script> del <head>
//firstScriptTag.parentNode es todo el <head>
//newNode equivale a tag
//Creo que lo que hace es simplemente insertar el nuevo <script> como el primero del <head>

/* 2. Función que crea un <iframe> conteniendo el reproductor de YouTube */

function onYouTubeIframeAPIReady() 
{
  /* Las dos siguiente variables son conjuntos de elementos, no estrictamente arrays */
  let cajas = document.getElementsByClassName("caja-youtube"); //<span> vacío que albergará el reproductor de audio
  let enlacesYT = document.getElementsByClassName("enlace-youtube"); //<span> con el enlace de YouTube de cada canción

  for(let i = 0; i < enlacesYT.length; ++i)
  {
    let imagen = document.createElement("img"); //Creación de un elemento <img>

    imagen.setAttribute("class", 'imagen-youtube'); //Le adjudica una clase al <img>
    imagen.style.cssText = "cursor: pointer; width: 40px; margin-top: 1.5px;"; //Le da estilos CSS al <img>
  
    enlacesYT[i].appendChild(imagen); //Incluye el <img> dentro del <span> "enlace"; posteriormente, la función toggleButton lo convierte en la imagen del botón de YouTube

    //imagen.setAttribute("src", "https://i.imgur.com/XrAWYmu.png");

    let div = document.createElement("div"); //Creación de un <div> que albergará el reproductor de audio
    div.setAttribute("id", `reproductor-youtube-${i}`); //Le adjudica un id al div
    cajas[i].appendChild(div); //Incluye el div en el <span> vacío "caja"

    let toggleButton = function(play) //Controla que se muestre el botón de encendido o de pausa
    {
      let boton = play ? "GddldI3.png" : "XrAWYmu.png"; //Si play = true muestra una imagen (botón de encendido) y si no otra (botón de pausa)
      
      imagen.setAttribute("src", "https://i.imgur.com/" + boton); //Le añade el src apropiado al elemento <img> creado antes
    }

    let reproductor = new YT.Player(`reproductor-youtube-${i}`, //Creación de un objeto "reproductor" a partir de la clase YT.Player proporcionada por la API, que además relaciona con el <div> creado antes mediante su id
    {
      height: "0", //Características del objeto
      width: "0", //Altura y anchura nulas
      videoId: enlacesYT[i].dataset.video, //Id del vídeo
      events: //Eventos, relacionados con las dos funciones a continuación
      {
        'onReady': onPlayerReady,
        'onStateChange': onPlayerStateChange
      }
    });

    function onPlayerReady(e) {toggleButton(false);} //Cuando se termina de cargar el DOM, muestra el botón en pausa
    function onPlayerStateChange(e) {if(e.data === YT.PlayerState.ENDED) toggleButton(false);} //Si termina el vídeo, se cambia la imagen a pausa

    enlacesYT[i].onclick = function() //Al hacer click en el <span> que contiene el enlace de YouTube
    {
      if(reproductor.getPlayerState() === YT.PlayerState.PLAYING || reproductor.getPlayerState() === YT.PlayerState.BUFFERING) 
      { 
        reproductor.pauseVideo(); //Se pausa el objeto reproductor
        toggleButton(false);
      } 
      else 
      {
        reproductor.playVideo(); //Se enciende el objeto reproductor
        toggleButton(true);
      };
    };
  } 
};