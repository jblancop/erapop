/* PRESENTACIÓN Y TOP 3 */

/* Controla la aparición de los elementos de la página de inicio */

$(function()
{
    setTimeout(function(){$('.subtitulo-inicio').css('visibility','visible').hide().fadeIn(1000);}, 2250); //Hace aparecer el subtítulo con retraso (2,25 s después del título)

    setTimeout(function resto() //Otros 2,25 s después (4,5 en total)
    {
        $('.encabezado-inicio').fadeOut(1000); //Oculta tanto el título como el subtítulo

        $('.fotos').delay(1000).fadeIn(2000); //Y hace aparecer las fotos con 1 s de retraso
    }, 4500);
});

/* Aplica estilos específicos -fijos- a las fotos del top 3 */

$(function() //En función de su puesto en la clasificación, aplica unos estilos u otros para que cada foto se situe en su sitio
{
    $('[data-contador2="1"]').css('left', '30px'); //Puesto en la clasificación
    $('[data-contador2="2"]').css('right', '50px');
    $('[data-contador2="3"]').css('left', '30px');

    $('[data-contador2="1"]').next().css('right', '40px'); //Estrella que contiene a la nota media
    $('[data-contador2="2"]').next().css('left', '40px');
    $('[data-contador2="3"]').next().css('right', '40px');

    $('[data-contador2="1"]').next().next().css('right', '62.5px'); //Nota media
    $('[data-contador2="2"]').next().next().css('left', '62.5px');
    $('[data-contador2="3"]').next().next().css('right', '62.5px');

    $('[data-contador2="1"]').parent().addClass('contenedor1'); //Contenedor de la foto
    $('[data-contador2="2"]').parent().addClass('contenedor2');
    $('[data-contador2="3"]').parent().addClass('contenedor3');

    $('[data-contador2="3"]').prev().css('margin-bottom', '75px'); //Da espacio inferior a la tercera foto para que se vea la sombra color bronce
    $('[data-contador2="3"]').next().next().next().css('margin-bottom', '75px');
    $('[data-contador2="3"]').next().next().next().next().css('margin-bottom', '75px');
});

/* Aplica estilos específicos a las fotos del top 3 al pasar el ratón por encima de una de ellas */

$(function()
{
    $('.contenedor-top3').mouseenter(function() //Al pasar el ratón por encima
    {
        let $contador2 = $(this).find('.numero-top3').data('contador2'); //Identifica el puesto en la clasificación de la canción

        if($contador2 == 1) //Si es la nº 1 le aplica unos estilos
        {
            $(this).find('.imagen-top3').addClass('sombra-oro');
            $(this).find('.numero-top3').addClass('numero-oro');
            $(this).find('.nota-top3').removeClass('oculto');
            $(this).find('.estrella-top3').removeClass('oculto');
            $(this).find('.ano-top3').css('color', 'mediumvioletred');
        }
        else if($contador2 == 2) //Si es la nº 2, otros
        {
            $(this).find('.imagen-top3').addClass('sombra-plata');
            $(this).find('.numero-top3').addClass('numero-plata');
            $(this).find('.nota-top3').removeClass('oculto');
            $(this).find('.estrella-top3').removeClass('oculto');
            $(this).find('.ano-top3').css('color', 'mediumvioletred');
        }
        else //Si es la nº 3 -no hay más-, otros
        {
            $(this).find('.imagen-top3').addClass('sombra-bronce');
            $(this).find('.numero-top3').addClass('numero-bronce');
            $(this).find('.nota-top3').removeClass('oculto');
            $(this).find('.estrella-top3').removeClass('oculto');
            $(this).find('.ano-top3').css('color', 'mediumvioletred');
        }

        $('.contenedor-top3').not(this).css({'filter': 'blur(15px)', 'transform': 'scale(0.85)'}); //A las otras dos fotos, las difumina
        $(this).css({'transform': 'scale(1.25)', 'zIndex': '3'}); //Y a la elegida la agranda
        $(this).find('.numero-top3').addClass('shake-slow shake-constant'); //Y hace que vibre el número
    });

    $('.contenedor-top3').mouseleave(function() //Al retirar el ratón, revierte los cambios
    {
        let $contador2 = $(this).find('.numero-top3').data('contador2');

        if($contador2 == 1)
        {
            $(this).find('.imagen-top3').removeClass('sombra-oro');
            $(this).find('.numero-top3').removeClass('numero-oro');
            $(this).find('.nota-top3').addClass('oculto');
            $(this).find('.estrella-top3').addClass('oculto');
            $(this).find('.ano-top3').css('color', 'black');
        } 
        else if($contador2 == 2) 
        {
            $(this).find('.imagen-top3').removeClass('sombra-plata');
            $(this).find('.numero-top3').removeClass('numero-plata');
            $(this).find('.nota-top3').addClass('oculto');
            $(this).find('.estrella-top3').addClass('oculto');
            $(this).find('.ano-top3').css('color', 'black');
        }
        else
        {
            $(this).find('.imagen-top3').removeClass('sombra-bronce');
            $(this).find('.numero-top3').removeClass('numero-bronce');
            $(this).find('.nota-top3').addClass('oculto');
            $(this).find('.estrella-top3').addClass('oculto');
            $(this).find('.ano-top3').css('color', 'black');
        } 

        $('.contenedor-top3').not(this).css({'filter': 'blur(0px)', 'transform': 'scale(1)'});
        $(this).css({'transform': 'scale(1)', 'zIndex': ''});
        $(this).find('.numero-top3').removeClass('shake-slow shake-constant');      
    });
});


/* USUARIOS */

/* Registro de usuarios */

$(function()
{
	$('#registrar-usuario').click(function() //Se activa al hacer clic en el botón de id='registrar-usuario'
	{
        var nombre = $('#nombre').val(); //Se recogen los valores de todos los campos del formulario
		var correo = $('#correo').val();
        var contrasena = $('#contrasena').val();
        var contrasena2 = $('#contrasena2').val();

        var formulario = $('#form-alta-usuario'); //También el formulario al completo por si es necesario borrar los datos
        
        if(nombre.length > 2 && contrasena.length > 2) //Si tanto nombre como contraseña tienen al menos dos caracteres
        {
    		if(!correo.match(/^[a-zA-Z0-9\._-]+@[a-zA-Z0-9-]{2,}[.][a-zA-Z]{2,4}$/)) //Se comprueba mediante una expresión regular que el correo se ajuste a lo esperable en una dirección de correo electrónico 
    		{
                swal('Mmm...', '¿Seguro que ésa es tu dirección de correo?', 'warning', {button: false});

    			return false;
    		}

    		if(contrasena != contrasena2) //Se comprueba si la contraseña se ha introducido correctamente
    		{
                swal('Vaya..', 'Parece que te has equivocado al confirmar tu contraseña...', 'error', {button: false});

                return false;
    		}

            $.ajax( //Se hace una petición AJaX para registrar al usuario
            {
                type: 'POST', 
                url: '../ajax_registro.php', 
                data: {nombre: nombre, correo: correo, contrasena: contrasena, contrasena2: contrasena2},
                success: function(respuesta)
                {
                    if(respuesta == 1) //Si se efectúa el registro con éxito, se redirige al usuario a su perfil personal
                    {
                        function perfil(){window.location = 'http://localhost/recopilatorios/php/web/mvc/usuarios/personal';}

                        swal('¡Bienvenido!', '¡Ya eres uno más de la familia!', 'success', {button: false}).then(setTimeout(perfil, 1500));
                    } 
                    else if(respuesta == 2) swal('Vaya...', 'Nombre repetido; tendrás que elegir uno diferente... ;)', 'info', {button: false});
                    else if(respuesta == 3) swal('Vaya...', 'Correo repetido; tendrás que elegir uno diferente... ;)', 'info', {button: false});
                    else swal('Ups...', 'Algo ha fallado; intenta registrarte de nuevo más tarde...', 'error', {button: false});
                },
                error: function()
                {
                    swal('Ups...', 'Algo ha fallado; intenta registrarte de nuevo más tarde...', 'error', {button: false});
                }
            });
        }
        else //Si nombre o correo no tienen al menos dos caracteres, se advierte del error
        {
            if(nombre.length > 2) swal('Recuerda...', 'Tu contraseña ha de tener al menos tres caracteres', 'info', {button: false});
            else swal('Recuerda...', 'Tu nombre ha de tener al menos tres caracteres', 'info', {button: false});
        }
	});
});

/* Confirmación del borrado de información del registro de usuarios */

$(function() 
{
    $('.borrado-registro').click(function(e) //Se activa al hacer clic en el botón de class='confirmar-borrado'
    {   
        e.preventDefault(); //Evita el comportamiento por defecto del botón -que borra los datos sin aguardar confirmación- 

        var formulario = $('#form-alta-usuario'); //Recoge todos los datos del formulario para borrarlo luego
        var elementosFormulario = $('#nombre').val() + $('#correo').val() + $('#contrasena').val() + $('#contrasena2').val(); //Se recogen los valores individuales de cada campo del formulario

        if(elementosFormulario.length < 1)
        {
            swal("Vaya...", "Parece que no hay nada que borrar... ;P", "warning", {button: false});

            return false;
        }
        else
        {
            swal //Modal para confirmar el borrado
            ({
                title: '¿Quieres borrar tus datos?',
                text: 'Si estás seguro, adelante',
                icon: 'warning',
                dangerMode: true, //Resalta el botón para conservar la información
                closeOnClickOutside: false, //No permite cerrar el modal haciendo clic fuera de él
                buttons: 
                {
                    cancel: 
                    {
                        text: 'Realmente no',
                        value: null, //Parámetro que determina si se produce o no el borrado
                        visible: true,
                        className: 'btn btn-outline-secondary',
                        closeModal: true,
                    },
                    confirm: 
                    {
                        text: 'Lo estoy',
                        value: true, //Parámetro que determina si se produce o no el borrado
                        visible: true,
                        className: 'btn btn-danger',
                        closeModal: true,
                    }
                }
            }).then(function(value){if(value) formulario.trigger('reset');}) //Si value = true se borra el formulario
        }
    })
});

/* Conexión de usuarios */

$(function() 
{
    $('.iniciar-sesion').click(function() //Al hacer clic en el botón del modal para iniciar sesión
    {
        var nombre = $('.form-nombre').val(); //Guarda el nombre y la contraseña introducidos en el formulario del modal
        var contrasena = $('.form-contrasena').val(); 
        
        if($('#recordar').prop('checked')) var recordar = $('#recordar').val(); //Si se marca el 'checkbox' '¡Recuérdame!', almacena su valor ('on') en la variable recordar

        if(nombre.length > 2 && contrasena.length > 2) //Si tanto el nombre como la contraseña tienen más de dos caracteres, envía la información vía AJaX
        {
            $.ajax(
            {
                type: 'POST', url: '../ajax_iniciar_sesion.php', data: {nombre: nombre, contrasena: contrasena, recordar: recordar},
                success: function(respuesta)
                {
                    if(respuesta == 0) //Si detecta que el usuario no está en la BD, le ofrece la posibilidad de registrarse
                    {
                        swal(
                        {
                            title: 'Vaya...', 
                            text: 'Parece que aún no eres de la pandilla: ¿por qué no te unes?',
                            icon: 'info',
                            buttons: 
                            {
                                cancel: 
                                {
                                    text: 'No sé, no sé...',
                                    value: null,
                                    visible: true,
                                    className: 'btn btn-info',
                                    closeModal: true,
                                },
                                confirm: 
                                {
                                    text: '¡Buena idea!',
                                    value: true,
                                    visible: true,
                                    className: 'btn btn-info',
                                }
                            }
                        }).then(function(value){if(value) window.location = 'http://localhost/recopilatorios/php/web/mvc/usuarios/registro';})
                    } 
                    else if(respuesta == 1) //Si la conexión es exitosa, redirige al usuario a su página personal tras 1,5 segundos
                    {
                        function perfil(){window.location = 'http://localhost/recopilatorios/php/web/mvc/usuarios/personal';}
                        
                        swal(
                        {
                            title:'¡Ey!', 
                            text: `¡Bienvenido de nuevo, ${nombre}!`,
                            icon: 'success',
                            button: false,
                            closeOnClickOutside: false,
                        }).then(setTimeout(perfil, 1500));
                    }
                    else swal('Vaya...', 'Parece que te has equivocado de contraseña', 'error', {button: false}); //Si no lo es, muestra un mensaje de error
                },
                error: function() //Si hay algún problema con la petición AJaX, muestra un mensaje de error
                {
                    swal('Vaya...', 'Parece que tus datos no se han podido enviar', 'error', {button: false});
                }
            })
        }
        else //Si el nombre o la contraseña tienen menos de tres caracteres, da un mensaje de error
        {
            if(nombre.length > 2) swal('Recuerda...', 'Tu contraseña tiene al menos tres caracteres', 'info', {button: false});
            else swal('Recuerda...', 'Tu nombre tiene al menos tres caracteres', 'info', {button: false});
        }
    })
});

/* Cierre de sesión */

$(function() 
{
    $('.desconectar').click(function(e) //Al hacer clic en el botón de clase "desconectar"
    {   
        e.preventDefault(); //Evita el comportamiento por defecto para que surja Sweet Alert

        swal(
        {
            title: '¿Nos dejas?',
            text: 'Esperemos que sea sólo por hoy... ;)',
            icon: 'warning',
            dangerMode: true,
            closeOnClickOutside: false,
            buttons: 
            {
                cancel: 
                {
                    text: 'Un ratito más',
                    value: null,
                    visible: true,
                    className: 'btn btn-outline-secondary',
                    closeModal: true,
                },
                confirm: 
                {
                    text: '¡Chao!',
                    value: true, //Si se confirma, se ejecuta el método desconexión del controlador Usuarios
                    visible: true,
                    className: 'btn btn-danger',
                    closeModal: true,
                }
            }
        }).then(function(value){if(value) window.location = 'http://localhost/recopilatorios/php/web/mvc/usuarios/desconexion';})
    })
});

/* Datos personales del perfil de usuario */

$(function() 
{
    $('#autores').change(function() //Cuando se cambia el valor del select con id = "autores"
    {
        var idAutor = $('option:selected', this).val(); //Captura los valores de la nueva opción elegida
        var nombreAutor = $('option:selected', this).text(); 

        var posicion = nombreAutor.search(', The'); //Localiza la posición en la que va ", The" (si no existe, devuelve un -1)
 
        if(posicion != -1) nombreAutor = "The " + nombreAutor.substring(0, posicion); //Si existe, reordena el nombre del autor

        $.ajax( //Petición AJaX para insertar la nueva elección en la BD
        {
            type: 'POST', url: '../ajax_insertar_datos_personales.php', data: {id_autor: idAutor},
            success: function(respuesta) 
            {
                if(respuesta == 1) //Si la inserción ocurre
                {
                    if(idAutor == "NULL") swal("¿No te convence ninguno?", "No pasa nada, tómate tu tiempo... ;)", "success", {button: false}); //Si se ha elegido la opción inicial, equivale a no elegir ninguna
                    else swal("¡Qué bien!", `¡Un fan de ${nombreAutor}!`, "success", {button: false}); //De lo contrario emite un mensaje con el nombre del autor elegido
                }
                else swal("Vaya...", "Parece que tu elección no se ha podido procesar", "error", {button: false}); //Si no, devuelve un mensaje de error
            },
            error: function() //Si hay un error devuelve un mensaje de advertencia (no está funcionando, no sé por qué; siempre parece encontrar el archivo aunqe la ruta no tenga sentido)
            {
                swal("Vaya...", "Parece que tu elección no se ha podido procesar", "error", {button: false});
            }
        })
    })

    $('#subestilos').change(function() //Cuando se cambia el valor del select con id = "subestilos"
    {
        var idSubestilo = $('option:selected', this).val(); //Captura los valores de la nueva opción elegida
        var nombreSubestilo = $('option:selected', this).text();

        $.ajax( //Petición AJaX para insertar la nueva elección en la BD
        {
            type: 'POST', url: '../ajax_insertar_datos_personales.php', data: {id_subestilo: idSubestilo},
            success: function(respuesta)
            {
                if(respuesta == 1) //Si la inserción ocurre
                {
                    if(idSubestilo == "NULL") swal("¿No te convence ninguno?", "No pasa nada, tómate tu tiempo... ;)", "success", {button: false}); //Si se ha elegido la opción inicial, equivale a no elegir ninguna
                    else swal("Buena elección", `Has elegido ${nombreSubestilo} como estilo favorito`, "success", {button: false}); //De lo contrario emite un mensaje con el nombre del subestilo elegido
                }
                else swal("Vaya...", "Parece que tu elección no se ha podido procesar", "error", {button: false}); //Si no, devuelve un mensaje de error
            },
            error: function() //Si hay un error devuelve un mensaje de advertencia (no está funcionando, no sé por qué; siempre parece encontrar el archivo aunqe la ruta no tenga sentido)
            {
                swal("Vaya...", "Parece que tu elección no se ha podido procesar", "error", {button: false});
            }
        })
    })

    $('#formatos').change(function() //Cuando se cambia el valor del select con id = "formatos"
    {
        var formato = $('option:selected', this).val(); //Captura el valor de la nueva opción elegida

        if(formato == "Casete" || formato == "Vinilo") var formatoMin = formato.toLowerCase(); //Transforma los formatos "Casete" y "Vinilo" a minúsculas
        else formatoMin = formato; //De lo contrario, carga igualmente "MP3" o "CD" en formatoMin, que se usa sólo por cuestiones estéticas

        if(formato != "NULL") var formato = `'${formato}'`; //La información que se envía a la BD va dentro de esta variable; salvo que sea NULL, se entrecomilla el valor del formato para poder hacer bien la inserción SQL

        $.ajax( //Petición AJaX para insertar la nueva elección en la BD
        {
            type: 'POST', url: '../ajax_insertar_datos_personales.php', data: {formato: formato},
            success: function(respuesta)
            {
                if(respuesta == 1) //Si la inserción ocurre
                {
                    if(formato == "NULL") swal("¿No te convence ninguno?", "No pasa nada, tómate tu tiempo... ;)", "success", {button: false}); //Si se ha elegido la opción inicial, equivale a no elegir ninguna
                    else swal("¡Perfecto!", `Te gusta escuchar tu música en ${formatoMin}`, "success", {button: false}); //De lo contrario emite un mensaje con el nombre del formato elegido
                }
                else swal("Vaya...", "Parece que tu elección no se ha podido procesar", "error", {button: false}); //Si no, devuelve un mensaje de error
            },
            error: function() //Si hay un error devuelve un mensaje de advertencia (no está funcionando, no sé por qué; siempre parece encontrar el archivo aunqe la ruta no tenga sentido)
            {
                swal("Vaya...", "Parece que tu elección no se ha podido procesar", "error", {button: false});
            }
        })
    })

    $('#ciudades').change(function() //Cuando se cambia el valor del select con id = "ciudades"
    {
        var idCiudad = $('option:selected', this).val(); //Captura los valores de la nueva opción elegida
        var localizacion = $('option:selected', this).text();

        var posicion = localizacion.search(', '); //Localiza la posición en la que va la coma que separa la ciudad del país

        if(posicion != -1) nombreCiudad = localizacion.substring(0, posicion); //Recorta el texto y deja sólo el nombre de la ciudad

        $.ajax( //Petición AJaX para insertar la nueva elección en la BD
        {
            type: 'POST', url: '../ajax_insertar_datos_personales.php', data: {id_ciudad: idCiudad},
            success: function(respuesta)
            {
                if(respuesta == 1) //Si la inserción ocurre
                {
                    if(idCiudad == "NULL") swal("¿No te convence ninguna?", "No pasa nada, tómate tu tiempo... ;)", "success", {button: false}); //Si se ha elegido la opción inicial, equivale a no elegir ninguna
                    else swal("¡Haz las maletas!", `Nos vamos de fin de semana a ${nombreCiudad}... :)`, "success", {button: false}); //De lo contrario emite un mensaje con el nombre de la ciudad elegida
                }
                else swal("Vaya...", "Parece que tu elección no se ha podido procesar", "error", {button: false}); //Si no, devuelve un mensaje de error
            },
            error: function() //Si hay un error devuelve un mensaje de advertencia (no está funcionando, no sé por qué; siempre parece encontrar el archivo aunqe la ruta no tenga sentido)
            {
                swal("Vaya...", "Parece que tu elección no se ha podido procesar", "error", {button: false});
            }
        });
    })

    $('#ciudades2').change(function() //Cuando se cambia el valor del select con id = "ciudades"
    {
        var idCiudad = $('option:selected', this).val(); //Captura los valores de la nueva opción elegida
        var localizacion = $('option:selected', this).text();

        var posicion = localizacion.search(', '); //Localiza la posición en la que va la coma que separa la ciudad del país

        if(posicion != -1) nombreCiudad = localizacion.substring(0, posicion); //Recorta el texto y deja sólo el nombre de la ciudad

        $.ajax( //Petición AJaX para insertar la nueva elección en la BD
        {
            type: 'POST', url: '../ajax_insertar_datos_personales.php', data: {id_ciudad_actual: idCiudad},
            success: function(respuesta)
            {
                if(respuesta == 1) //Si la inserción ocurre
                {
                    if(idCiudad == "NULL") swal("¿Tu ciudad no está en la lista?", "¡Avísanos y la incluiremos!", "success", {button: false}); //Si se ha elegido la opción inicial, equivale a no elegir ninguna
                    else swal("¿Cuál es el plato típico?", `Tu ciudad de residencia es ${nombreCiudad}`, "success", {button: false}); //De lo contrario emite un mensaje con el nombre de la ciudad elegida
                }
                else swal("Vaya...", "Parece que tu elección no se ha podido procesar", "error", {button: false}); //Si no, devuelve un mensaje de error
            },
            error: function() //Si hay un error devuelve un mensaje de advertencia (no está funcionando, no sé por qué; siempre parece encontrar el archivo aunqe la ruta no tenga sentido)
            {
                swal("Vaya...", "Parece que tu elección no se ha podido procesar", "error", {button: false});
            }
        });
    })
});

/* Modal con el perfil de usuario, incluye los scripts para borrar y enviar mensajes */
                                
$(function() 
{
    $('.nombre-usuario').click(function() //Cuando se hace clic en el nombre de usuario
    {
        nombreUsuario = $(this).text(); //Captura el nombre
        idUsuario = $(this).data('id-usuario'); //Captura también su id inserta en un parámetro HTML de tipo "data" por si posteriormente se quiere enviar un mensaje privado
        
        nombreURL = window.location.pathname; //Captura la dirección URL
        controlador = 0;

        if(nombreURL.indexOf('/usuarios/mensajes') !== -1) controlador = 1; //Si la URL contiene '/usuarios/mensajes', activa el controlador

        $.ajax( //Hace una petición AJaX para recabar su información personal y mostrarla en el modal
        {
            type: 'POST', 
            url: '../ajax_recuperar_datos_personales.php',
            dataType: 'json',
            data: {nombre_usuario: nombreUsuario},
            success: function(respuesta)
            {
                if(!$.isEmptyObject(respuesta)) //Si el json tiene contenido, pinta esto
                {
                    $('.cuerpo-usuario').text(''); //Se elimina todo el contenido que pudiera haber previamente en el modal

                    var divPadre = $(document.createElement('div')) //1. Div que contiene todo
                    .addClass('row')
                    .prependTo('.cuerpo-usuario');

                        var divFoto = $(document.createElement('div')) //1.1. Div columna que contiene a la foto
                        .addClass('col-4').addClass('d-flex').addClass('align-items-center')
                        .prependTo(divPadre);

                            var foto = $(document.createElement('img'))
                            .css("border-radius", "10px")
                            .attr('src', respuesta.rutaFoto).attr('width', '240').attr('height', '180')
                            .prependTo(divFoto);

                        var divResto = $(document.createElement('div')) //1.2. Div columna que contiene el resto de elementos
                        .addClass('col-8')
                        .appendTo(divPadre);

                            var divTexto = $(document.createElement('div')) //1.2.1. Div que contiene la descripción del usuario
                            .addClass('letra-perfil').addClass('pb-3')
                            .prependTo(divResto);

                                var inicio = $(document.createElement('span'))
                                .text('A ')
                                .prependTo(divTexto);

                                var usuario = $(document.createElement('span'))
                                .css('color', 'mediumvioletred')
                                .text(nombreUsuario)
                                .insertAfter(inicio);

                                var conector1 = $(document.createElement('span'))
                                .text(' le gustaría montar una banda de ')
                                .insertAfter(usuario);

                                var nombreSubestilo = $(document.createElement('span'))
                                .css('color', 'mediumvioletred')
                                .text(respuesta.subestilo)
                                .insertAfter(conector1);

                                var conector2 = $(document.createElement('span'))
                                .text(' en ')
                                .insertAfter(nombreSubestilo);

                                var nombreCiudadFavorita = $(document.createElement('span'))
                                .text(respuesta.ciudadFavorita)
                                .insertAfter(conector2);

                                var conector3 = $(document.createElement('span'))
                                .text(', pero se conforma con escuchar ')
                                .insertAfter(nombreCiudadFavorita);

                                var nombreformato = $(document.createElement('span'))
                                .text(respuesta.formato)
                                .insertAfter(conector3);

                                var conector4 = $(document.createElement('span'))
                                .text('s de ')
                                .insertAfter(nombreformato);

                                var nombreAutor = $(document.createElement('span'))
                                .css('color', 'mediumvioletred')
                                .text(respuesta.autor)
                                .insertAfter(conector4);

                                var conector5 = $(document.createElement('span'))
                                .text(' en ')
                                .insertAfter(nombreAutor);

                                var nombreCiudadActual = $(document.createElement('span'))
                                .text(respuesta.ciudadActual)
                                .insertAfter(conector5);

                                var puntos = $(document.createElement('span'))
                                .text('...')
                                .insertAfter(nombreCiudadActual);

                            var divFormulario = $(document.createElement('div')) //1.2.2. Div con la caja de texto y los botones
                            .appendTo(divResto);

                                var divCaja = $(document.createElement('div')) //1.2.2.1. Div con la caja de texto
                                .prependTo(divFormulario);

                                    var cajaTexto = $(document.createElement('textarea'))
                                    .addClass('form-control').addClass('caja-modal')
                                    .attr('placeholder', `¿Quieres enviarle un mensaje privado a ${nombreUsuario}?`).attr('maxlength', '200').attr('rows', '2')
                                    .prependTo(divCaja);

                                var divBotones = $(document.createElement('div')) //1.2.2.2. Div con los botones
                                .addClass('d-flex').addClass('justify-content-center').addClass('pt-2')
                                .appendTo(divFormulario);

                                    var boton1 = $(document.createElement('button'))
                                    .addClass('btn').addClass('btn-info').addClass('btn-sm').addClass('mr-1').addClass('envio-mensaje')
                                    .attr('type', 'submit')
                                    .html('¡Adelante!')
                                    .prependTo(divBotones);

                                    var boton2 = $(document.createElement('button'))
                                    .addClass('btn').addClass('btn-info').addClass('btn-sm').addClass('borrado-modal')
                                    .attr('type', 'reset')
                                    .text('Algo no me convence...')
                                    .insertAfter(boton1);
                }
                else //Si no tiene contenido -es null- esto otro
                {
                    $('.cuerpo-usuario').text('');

                    var divPadre = $(document.createElement('div')) //1. Div que contiene todo
                    .addClass('row')
                    .prependTo('.cuerpo-usuario');

                        var divFoto = $(document.createElement('div')) //1.1. Div columna que contiene la foto
                        .addClass('col-4').addClass('d-flex').addClass('align-items-center')
                        .prependTo(divPadre);

                            var foto = $(document.createElement('img'))
                            .addClass('pl-5')
                            .css("border-radius", "10px")
                            .attr('src', 'http://localhost/recopilatorios/php/web/mvc/recursos/imagenes/varias/interrogante.jpg').attr('width', '192').attr('height', '144')
                            .prependTo(divFoto);

                        var divResto = $(document.createElement('div')) //1.2. Div columna que contiene el resto de elementos
                        .addClass('col-8')
                        .appendTo(divPadre);

                            var divTexto = $(document.createElement('div')) //1.2.1. Div que contiene el mensaje de avertencia
                            .addClass('letra-perfil').addClass('pb-3')
                            .prependTo(divResto);

                                var nombre = $(document.createElement('span'))
                                .css('color', 'mediumvioletred')
                                .text(nombreUsuario)
                                .prependTo(divTexto);

                                var mensaje = $(document.createElement('span'))
                                .text(' aún no ha completado su perfil...')
                                .insertAfter(nombre);

                            var divFormulario = $(document.createElement('div')) //1.2.2. Div con la caja de texto y los botones
                            .appendTo(divResto);

                                var cajaTexto = $(document.createElement('textarea'))
                                .addClass('form-control').addClass('caja-modal')
                                .attr('placeholder', `¿Quieres enviarle un mensaje privado a ${nombreUsuario}?`).attr('maxlength', '200').attr('rows', '2')
                                .prependTo(divFormulario);

                                var divBotones = $(document.createElement('div')) //1.2.2.2. Div que contiene los botones
                                .addClass('d-flex').addClass('justify-content-center').addClass('pt-1')
                                .appendTo(divFormulario);

                                    var boton1 = $(document.createElement('button'))
                                    .addClass('btn').addClass('btn-info').addClass('btn-sm').addClass('mt-2').addClass('mr-1').addClass('envio-mensaje')
                                    .attr('type', 'submit')
                                    .html('¡Adelante!')
                                    .prependTo(divBotones);

                                    var boton2 = $(document.createElement('button'))
                                    .addClass('btn').addClass('btn-info').addClass('btn-sm').addClass('mt-2').addClass('borrado-modal')
                                    .attr("type", "reset")
                                    .text('Algo no me convence...')
                                    .insertAfter(boton1);
                } 
            },
            error: function() //De nuevo, nunca hay error, siempre parece encontrar el archivo
            {
                swal("Vaya...", "Parece que ha ocurrido un error", "error", {button: false});
            }
        })
    })

    $('#modal-usuarios').on('click', '.envio-mensaje', function() //Delegación de eventos para el botón de envío
    {
        var texto = $('.caja-modal').val(); //Captura el texto de la caja del modal
        var idEmisor = $('#id-usuario').text(); //El id del usuario conectado
        var idReceptor = idUsuario; //El id del usuario al que se envía el mensaje

        if(texto.length < 1) //Da un aviso en caso de que se intente enviar un mensaje vacío
        {
            swal("Vaya...", "Parece que te has olvidado de lo que ibas a escribir... ;P", "warning", {button: false});

            return false;
        }
        else
        {
            $.ajax( //Hace una petición AJaX para insertar el mensaje en la BD
            {
                type: 'POST', 
                url: '../ajax_enviar_mensaje.php',
                data: {id_emisor: idEmisor, id_receptor: idReceptor, texto_mensaje: texto},
                success: function(respuesta)
                {
                    if(respuesta == 1)
                    {
                        $('.caja-modal').val(''); //Borra la caja de texto para evitar comportamientos maliciosos por parte del usuario

                        if(controlador == 1) //Si se trata de la página de mensajes
                        {
                            function reinicio(){location.reload();} //Se refresca la página tras 1,5 s para que se vea a continuación el mensaje enviado

                            swal(
                            {
                                title:'¡Genial!', 
                                text: `${nombreUsuario} ha recibido el mensaje`,
                                icon: 'success',
                                button: false,
                                closeOnClickOutside: false, //Se bloquea el modal
                            }).then(setTimeout(reinicio, 1500));
                        }
                        else swal('¡Genial!', `${nombreUsuario} ha recibido el mensaje`, 'success', {button: false}); //De lo contrario no, para evitar que se corte la emisión de un vídeo o de la lista de Spotify
                    } 
                    else swal('Vaya...', `Algo ha fallado; intenta mensajear a ${nombreUsuario} más tarde...`, "error", {button: false});
                },
                error: function() //No funciona
                {
                    swal("Vaya...", "Parece que ha ocurrido un error", "error", {button: false});
                }
            })
        }
    })

    $('#modal-usuarios').on('click', '.borrado-modal', function(/*e*/) //Delegación de eventos para que el botón de borrado creado dinámicamente funcione
    { 
        //e.preventDefault(); //Al ser creado dinámicamente, el botón no actúa por defecto

        var cajaTexto = $('.caja-modal'); //Captura la caja de texto

        if(cajaTexto.val().length < 1)
        {
            swal("Vaya...", "Parece que no hay nada que borrar... ;P", "warning", {button: false});

            return false;
        }
        else
        {
            swal //Modal para confirmar el borrado
            ({
                title: '¿Quieres borrar tu comentario?',
                text: 'Si estás seguro, adelante',
                icon: 'warning',
                dangerMode: true, //Resalta el botón para conservar la información
                closeOnClickOutside: false, //No permite cerrar el modal haciendo clic fuera de él
                buttons: 
                {
                    cancel: 
                    {
                        text: 'Realmente no',
                        value: null, //Parámetro que determina si se produce o no el borrado
                        visible: true,
                        className: 'btn btn-outline-secondary',
                        closeModal: true,
                    },
                    confirm: 
                    {
                        text: 'Lo estoy',
                        value: true, //Parámetro que determina si se produce o no el borrado
                        visible: true,
                        className: 'btn btn-danger',
                        closeModal: true,
                    }
                }
            }).then(function(value){if(value) cajaTexto.val('');}) //Si value = true se borra la caja de texto
        } 
    })
});


/* MENSAJES */

/* Marca como leídos los mensajes privados*/

$(function()
{
    $('.mensaje-no-leido').click(function() //Al hacer clic en un mensaje no leído (que tiene la clase "mensaje-no-leido")
    {
        var idMensaje = $(this).data('id-mensaje'); //Captura el id del mensaje
        var elemento = $(this); //Captura el mensaje en sí, para poder acceder a él desde la llamada AJaX

        $.ajax( //Llamada AJaX para actualizar el campo "leido" de la BD de 0 a 1
        {
            type: 'POST', url: '../ajax_marcar_leidos.php', data: {id_mensaje: idMensaje},
            success: function(respuesta) //Si hay respuesta
            {
                if(respuesta == 1) elemento.removeClass('mensaje-no-leido').addClass('mensaje-leido'); //Si se produce el UPDATE con éxito, se le cambia la clase al mensaje para que pase de color rojo a azul
                else swal('Vaya...', 'Sabemos que lo querías marcar como leído, pero algo ha fallado...', 'error', {button: false}); //De lo contrario, se muestra un mensaje de error
            },
            error: function() //Si no hay respuesta, se muestra un mensaje de error
            {
                swal('Vaya...', 'Sabemos que lo querías marcar como leído, pero algo ha fallado...', 'error', {button: false});
            }
        })
    });
});

/* Oculta/revela los botones de borrado de los mensajes */

$(function() 
{
    $('.mensaje-enviado').mouseenter(function() //Al pasar el ratón por el mensaje, revela el botón
    {
        var controlador = $(this).hasClass('eliminado'); //Variable que comprueba si el mensaje tiene la clase eliminado

        if(controlador) false; //Si la tiene, no hace nada
        else $(this).children('.boton-mensaje').slideDown(50); //Si no la tiene -el mensaje no ha sido eliminado-, despliega el botón
    })

    $('.mensaje-enviado').mouseleave(function() //Al sacar el ratón del mensaje, lo oculta
    {
        $('.boton-mensaje').slideUp(50);
    })
});

/* Eliminación de mensajes enviados */
                                
$(function() 
{
    $('.eliminar-mensaje').click(function(e) //Al hacer clic en el botón de borrado
    {   
        e.preventDefault(); //Evita el comportamiento por defecto para que surja Sweet Alert

        var idMensaje = $(this).parent().parent().data('id-mensaje'); //Captura el id del mensaje

        swal //Modal para confirmar el borrado
        ({
            title: '¿Quieres borrar tu mensaje?',
            text: 'Si estás seguro, adelante',
            icon: 'warning',
            dangerMode: true, //Resalta el botón para conservar la información
            closeOnClickOutside: false, //No permite cerrar el modal haciendo clic fuera de él
            buttons: 
            {
                cancel: 
                {
                    text: 'Realmente no',
                    value: null, //Parámetro que determina si se produce o no el borrado
                    visible: true,
                    className: 'btn btn-outline-secondary',
                    closeModal: true,
                },
                confirm: 
                {
                    text: 'Lo estoy',
                    value: true, //Parámetro que determina si se produce o no el borrado
                    visible: true,
                    className: 'btn btn-danger',
                    closeModal: true,
                }
            }
        }).then(function(value)
        {
            if(value) //Si value es true, se hace la petición AJaX para eliminar el mensaje
            {
                $.ajax(
                {
                    type: 'POST', 
                    url: '../ajax_eliminar_mensaje.php',
                    data: {id_mensaje: idMensaje},
                    success: function(respuesta)
                    {
                        if(respuesta == 0) swal('Ups...', 'No hemos podido eliminar tu mensaje; prueba otra vez dentro de un rato', 'error', {button: false}); //Si la modificación falla, devuelve un mensaje de error
                        else if(respuesta == 1) //De lo contrario
                        {
                            swal('¡Fulminado!', 'Tu mensaje ya es historia... :)', 'success', {button: false}); //Devuelve un mensaje de éxito

                            $(`[data-id-mensaje=${idMensaje}]`).addClass('eliminado'); //Añade la clase "eliminado" para que el script anterior no muestre más el boton de borrado
                            $(`[data-id-mensaje=${idMensaje}]`).find('.texto-mensaje').fadeIn(500).html('Has eliminado el mensaje'); //Transforma el texto del mensaje
                        }
                    },
                    error: function()
                    {
                        swal('Ups...', 'Parece que hay algún error técnico; inténtalo de nuevo más tarde', 'error', {button: false});
                    }
                })
            }
        })
    })
});


/* COMENTARIOS */

/* Confirmación del borrado de comentarios */

$(function() 
{
    $('.borrado-comentario').click(function(e) //Se activa al hacer clic en el botón de class='borrado-comentario'
    {   
        e.preventDefault(); //Evita el comportamiento por defecto del botón -que borra el comentario sin aguardar confirmación- 

        var cajaTexto = $('.caja-texto'); //Captura la caja de texto

        if(cajaTexto.val().length < 1)
        {
            swal("Vaya...", "Parece que no hay nada que borrar... ;P", "warning", {button: false});

            return false;
        }
        else
        {
            swal //Modal para confirmar el borrado
            ({
                title: '¿Quieres borrar tu comentario?',
                text: 'Si estás seguro, adelante',
                icon: 'warning',
                dangerMode: true, //Resalta el botón para conservar la información
                closeOnClickOutside: false, //No permite cerrar el modal haciendo clic fuera de él
                buttons: 
                {
                    cancel: 
                    {
                        text: 'Realmente no',
                        value: null, //Parámetro que determina si se produce o no el borrado
                        visible: true,
                        className: 'btn btn-outline-secondary',
                        closeModal: true,
                    },
                    confirm: 
                    {
                        text: 'Lo estoy',
                        value: true, //Parámetro que determina si se produce o no el borrado
                        visible: true,
                        className: 'btn btn-danger',
                        closeModal: true,
                    }
                }
            }).then(function(value){if(value) cajaTexto.val('');}) //Si value = true se borra la caja de texto
        }
    })
});

/* Envío de comentarios (inicio de conversación): comentarios padre */
                                
$(function() 
{
    $('.envio-comentario').click(function() //Al hacer clic en el botón del formulario de comentarios
    {
        var texto = $('.caja-texto').val(); //Se recoge el valor de la caja de texto
        var ano = $('#ano-actual').text(); //Se recoge también el de los parámetros temporales ocultos en el formulario
        var decada = $('#decada-actual').text();

        if(decada) //Se determina si el envío se realiza desde una década o un recopilatorio
        {
            ano = decada; //Si se trata de una década, la variable "ano" adopta el valor de la variable "decada" y ésta pasa a valer 1 
            decada = 1;
        }
        else decada = 0; //Si se trata de un recopilatorio, "decada" pasa a valer 0

        if(texto.length < 1) //Da un aviso en caso de que se intente enviar un mensaje vacío
        {
            swal("Vaya...", "Parece que te has olvidado de lo que ibas a escribir... ;P", "warning", {button: false});

            return false;
        }
        else
        {
            $.ajax( //Si no, se hace la petición AJaX
            {
                type: 'POST', 
                url: '../ajax_insertar_comentarios.php',
                dataType: 'json',
                data: {texto_comentario: texto, ano: ano, decada: decada, id_comentario_padre: "NULL"},
                success: function(respuesta)
                {
                    if(respuesta == "0") swal("Ups...", "No hemos podido procesar tu comentario; prueba otra vez dentro de un rato", "error", {button: false});
                    else //Creación de los elementos HTML con la respuesta
                    {
                        $('.caja-texto').val('');
                        $('.lista-comentarios').addClass('py-3').addClass('px-1');

                        var divPadre = $(document.createElement('div')) //Div que contiene a ambos divs hijos
                        .addClass('ancho-min-0px').addClass('pl-3')
                        .fadeIn(1000)
                        .prependTo('.lista-comentarios');

                        var divHijo1 = $(document.createElement('div')) //Div que contiene todo menos el mensaje
                        .addClass('puntos')
                        .addClass('ancho-max-comentarios')
                        .prependTo(divPadre);

                        var nombre = $(document.createElement('span'))
                        .addClass('font-weight-bold')
                        .text(respuesta.nombre)
                        .prependTo(divHijo1);

                        var dijo = $(document.createElement('span'))
                        .text(' dijo ')
                        .insertAfter(nombre);

                        var tiempoPasado = $(document.createElement('span'))
                        .text(respuesta.tiempoPasado)
                        .insertAfter(dijo);

                        var dosPuntos = $(document.createElement('span'))
                        .text(': ')
                        .insertAfter(tiempoPasado);

                        var divHijo2 = $(document.createElement('div')) //Div que contiene el mensaje
                        .addClass('ml-2').addClass('mb-1')
                        .appendTo(divPadre);

                        var texto = $(document.createElement('span'))
                        .addClass('font-italic').addClass('text-break')
                        .text(respuesta.texto)
                        .prependTo(divHijo2);  
                    } 
                },
                error: function()
                {
                    swal("Ups...", "Parece que hay algún error técnico; inténtalo de nuevo más tarde", "error", {button: false});
                }
            })
        }
    });
});

/* Envío de comentarios (respuesta a una conversación ya iniciada): comentarios hijo */
                                
$(function() 
{
    $('.responder').click(function() //Si se hace clic en el botón de responder
    {
        $('.pseudo-caja').remove(); //Se elimina cualquier caja de texto que se haya podido crear previamente al hacer clic en otro botón responder

        var div = $(document.createElement('div')) //Se crean los elementos necesarios para responder al mensaje
        .addClass('row')
        .insertBefore(this).parent();

        var pseudoCaja = $(document.createElement('input')) //Incluyendo la caja de texto
        .addClass('pt-1').addClass('d-block')
        .attr('type', 'text').attr('maxlength', '200').attr('size', '59.9')
        .addClass('pseudo-caja')
        .fadeIn(500)
        .appendTo(div);

        $('.pseudo-caja').keypress(function(evento) //Al pulsar el teclado
        {
            if(evento.keyCode == 13) //Si la tecla pulsada es "enter"
            {
                var texto = $('.pseudo-caja').val(); //Se captura el texto introducido
                var usuario = $('#usuario-conectado').text(); //el nombre del usuario que lo escribe 
                var idPadre = $('.pseudo-caja').parent().parent().data('id'); //y el id del comentario padre
            }

            if(texto.length < 1) //Si no se ha escrito nada, devuelve un mensaje de error
            {
                swal("Vaya...", "Parece que te has olvidado de lo que ibas a escribir... ;P", "warning", {button: false});

                return false;
            }
            else //De lo contrario, hace una petición AJaX
            {
                $.ajax(
                {
                    type: 'POST', 
                    url: '../ajax_insertar_comentarios.php',
                    dataType: 'json',
                    data: {texto_comentario: texto, ano: "NULL", decada: "NULL", id_comentario_padre: idPadre},
                    success: function(respuesta)
                    {
                        if(respuesta == "0") swal("Ups...", "No hemos podido procesar tu comentario; prueba otra vez dentro de un rato", "error", {button: false}); //Si la inserción falla, devuelve un mensaje de error
                        else //De lo contrario, crea los elementos HTML para visualizar el mensaje
                        {
                            $('.pseudo-caja').remove(); //Elimina la caja de texto para evitar comportamientos maliciosos por parte del usuario
                            $('.lista-comentarios').addClass('py-3').addClass('px-1');

                            var comentarioPadre = $(`[data-id=${idPadre}]`); //Localiza el comentario padre

                            var divPadre = $(document.createElement('div')) //Div que contiene a ambos divs hijos
                            .addClass('ancho-min-0px').addClass('pl-4')
                            .fadeIn(1000)
                            .insertAfter(comentarioPadre); //Se crea debajo del comentario padre para que el usuario compruebe que su mensaje se ha insertado, aunque luego se ponga al final de la lista

                            var divHijo1 = $(document.createElement('div')) //Div que contiene todo menos el mensaje
                            .addClass('puntos')
                            .addClass('ancho-max-comentarios')
                            .prependTo(divPadre);

                            var nombre = $(document.createElement('span'))
                            .addClass('font-weight-bold').addClass('ml-4')
                            .text(respuesta.nombre)
                            .prependTo(divHijo1);

                            var dijo = $(document.createElement('span'))
                            .text(' dijo ')
                            .insertAfter(nombre);

                            var tiempoPasado = $(document.createElement('span'))
                            .text(respuesta.tiempoPasado)
                            .insertAfter(dijo);

                            var dosPuntos = $(document.createElement('span'))
                            .text(': ')
                            .insertAfter(tiempoPasado); //Hasta aquí la primera línea: "Usuario dijo hace x tiempo:"

                            var divHijo2 = $(document.createElement('div')) //Div que contiene el mensaje
                            .addClass('ml-4').addClass('mb-1')
                            .appendTo(divPadre);

                            var texto = $(document.createElement('span'))
                            .addClass('font-italic').addClass('text-break')
                            .text(respuesta.texto)
                            .prependTo(divHijo2);
                        } 
                    },
                    error: function()
                    {
                        swal("Ups...", "Parece que hay algún error técnico; inténtalo de nuevo más tarde", "error", {button: false});
                    }
                })
            }
        });
    });
});

/* Eliminación de comentarios ya publicados */
                                
$(function() 
{
    $('.eliminar-comentario').click(function(e) //Al hacer clic en el botón de borrado
    {   
        e.preventDefault(); //Evita el comportamiento por defecto para que surja Sweet Alert

        var idComentario = $(this).parent().parent().data('id'); //Captura el id del comentario

        swal //Modal para confirmar el borrado
        ({
            title: '¿Quieres borrar tu comentario?',
            text: 'Si estás seguro, adelante',
            icon: 'warning',
            dangerMode: true, //Resalta el botón para conservar la información
            closeOnClickOutside: false, //No permite cerrar el modal haciendo clic fuera de él
            buttons: 
            {
                cancel: 
                {
                    text: 'Realmente no',
                    value: null, //Parámetro que determina si se produce o no el borrado
                    visible: true,
                    className: 'btn btn-outline-secondary',
                    closeModal: true,
                },
                confirm: 
                {
                    text: 'Lo estoy',
                    value: true, //Parámetro que determina si se produce o no el borrado
                    visible: true,
                    className: 'btn btn-danger',
                    closeModal: true,
                }
            }
        }).then(function(value)
        {
            if(value) //Si value es true, se hace la petición AJaX para eliminar el comentario
            {
                $.ajax(
                {
                    type: 'POST', 
                    url: '../ajax_eliminar_comentarios.php',
                    data: {id_comentario: idComentario},
                    success: function(respuesta)
                    {
                        if(respuesta == 0) swal('Ups...', 'No hemos podido eliminar tu comentario; prueba otra vez dentro de un rato', 'error', {button: false}); //Si la modificación falla, devuelve un mensaje de error
                        else if(respuesta == 1) //De lo contrario
                        {
                            swal('¡Fulminado!', 'Tu mensaje ya es historia... :)', 'success', {button: false}); //Devuelve un mensaje de éxito

                            $(`[data-id=${idComentario}]`).find('.comentario').addClass('eliminado'); //Añade la clase "eliminado" para que el script nº 13 no muestre más los botones del comentario
                            $(`[data-id=${idComentario}]`).find('.comentario').fadeIn(500).html('Mensaje borrado por el usuario'); //Transforma el texto del mensaje
                        }
                    },
                    error: function()
                    {
                        swal('Ups...', 'Parece que hay algún error técnico; inténtalo de nuevo más tarde', 'error', {button: false});
                    }
                })
            }
        })
    })
});

/* Oculta/revela los botones de respuesta y borrado de los comentarios */

$(function() 
{
    $('.comentario').mouseenter(function() //Al pasar el ratón por el comentario, revela los botones
    {
        var controlador = $(this).hasClass('eliminado'); //Variable que comprueba si el comentario tiene la clase eliminado

        if(controlador) false; //Si la tiene, no hace nada
        else $(this).siblings('.botonera-comentarios').slideDown(50); //Si no la tiene -el comentario no ha sido eliminado-, despliega el botón
    })

    $('.lista-comentarios').mouseleave(function() //Al sacar el ratón del listado de comentarios, los oculta
    {
        $('.botonera-comentarios').slideUp(50);
    })
});

/* Añade y quita clases a los comentarios cuando se trata de la página de los recopilatorios */

$(function()
{
    var controlador = $('#lista-spotify').length; //Si existe la lista de Spotify es que se trata de la página de recopilatorios

    if(controlador)
    {
        $('.formulario-comentarios').addClass('justify-content-end').removeClass('pl-2');
        $('.lista-comentarios').addClass('margen-izq2').removeClass('comentarios-decadas').removeClass('comentarios-decadas2');
        $('.falso-pie').addClass('mt-4').removeClass('mt-5');
    }
});

/* Añade estilos a la lista de comentarios si hay al menos un mensaje */

$(function() 
{
    var usuario = $('.nombre-usuario').text(); //Captura el nombre del usuario

    if(usuario.length != 0) $('.lista-comentarios').addClass('py-3').addClass('px-1'); //Si hay algún nombre de usuario (es decir, si su longitud es mayor que 0), añade el formato apropiado
});

/* Cambio del puntero del ratón al pasar por el nombre de un usuario */

$(function() 
{
    var usuarioConectado = $('#usuario-sesion').text();

    if(usuarioConectado)
    {
        $('.nombre-usuario').hover(function() 
        {
            $(this).css('cursor', 'pointer');
        })
    }
});


/* VÍDEOS */

/* Modal con subestilos */
                                
$(function() 
{
    $('.boton-subestilo').click(function() //Al hacer clic en el nombre de un subestilo
    {
        var idCancion = $(this).parent().parent().siblings().find('.cancion').attr('id'); //Captura el id de la canción
        var nombreSubestilo = $(this).text(); //Y el nombre del subestilo

        $.ajax( //Se hace una petición AJaX para saber qué otras canciones comparten ese subestilo
        {
            type: 'POST', 
            url: '../ajax_sugerencias.php',
            dataType: 'json', //Esta vez la información se codifica en un JSON
            data: {id_cancion: idCancion, nombre_subestilo: nombreSubestilo},
            success: function(respuesta)
            {
                if(!$.isEmptyObject(respuesta)) //Si el JSON no está vacío, rellena el modal con la lista de canciones
                {
                    $('.encabezado-subestilo').children().html('Quizá también te pueda <span style="color: mediumvioletred;">gustar</span>...');
                    $('.cuerpo-subestilo').text('');

                    for(var i in respuesta) //Para cada índice del JSON, que contiene la información relativa a una de las 5 canciones
                    {
                        var portada = $(document.createElement('img')) //Dispone apropiadamente todos los elementos
                        .addClass('mt-1').addClass('mx-2')
                        .attr('src', respuesta[i].rutaFoto).attr('width', '50').attr('height', '50')
                        .appendTo('.cuerpo-subestilo');

                        var cancion = $(document.createElement('span'))
                        .addClass('font-italic')
                        .text(respuesta[i].tituloCancion)
                        .appendTo('.cuerpo-subestilo');

                        var de = $(document.createElement('span'))
                        .text(' de ')
                        .appendTo('.cuerpo-subestilo');

                        var autor = $(document.createElement('span'))
                        .addClass('font-weight-bold')
                        .text(respuesta[i].nombreAutor)
                        .appendTo('.cuerpo-subestilo');

                        var espacio = $(document.createElement('span'))
                        .text(' ')
                        .appendTo('.cuerpo-subestilo');

                        var parentesis1 = $(document.createElement('span'))
                        .text('(')
                        .appendTo('.cuerpo-subestilo');

                        var boton = $(document.createElement('button'))
                        .addClass('boton-enlace')
                        .attr('role', 'link').attr('name', 'recopilatorio')
                        .text(respuesta[i].ano)
                        .val(respuesta[i].ano);

                        var parentesis2 = $(document.createElement('span'))
                        .addClass('parentesis')
                        .text(')')
                        .appendTo(boton);

                        var formulario = $(document.createElement('form'))
                        .addClass('d-inline')
                        .attr('method', 'post').attr('action', 'http://localhost/recopilatorios/php/web/mvc/recopilatorios/indice')
                        .html(boton)
                        .appendTo('.cuerpo-subestilo');

                        var salto = $(document.createElement('span'))
                        .html('<br>')
                        .appendTo('.cuerpo-subestilo');
                    }
                }
                else //Si lo está, muestra un mensaje de advertencia
                {
                    $('.encabezado-subestilo').children().text('Vaya...');
                    $('.cuerpo-subestilo').text('');

                    var mensaje = $(document.createElement('h6'))
                        .addClass('text-center')
                        .html('Parece que no tenemos más <span style="color: mediumvioletred;">temazos</span> de ese estilo, ¿por qué no pruebas con otro? <span style="color: mediumvioletred;">;)</span>')
                        .appendTo('.cuerpo-subestilo');
                } 
            },
            error: function() //En caso de que ocurriese un error al procesar la petición, muestra otro mensaje de advertencia
            {
                $('.encabezado-subestilo').children().text('Vaya...');
                    $('.cuerpo-subestilo').text('');

                var mensaje = $(document.createElement('h6'))
                    .addClass('text-center')
                    .text('Parece que ha ocurrido un error... :/')
                    .appendTo('.cuerpo-subestilo');
            }
        })
    });
});

/* Sistema de votación */

$(function() 
{
    $('input[type=radio]').click(function() //Al hacer clic en un radiobotón -sólo el sistema de votación tiene este tipo de botón, por lo que, salvo que se implementen nuevas funcionalidades con radiobotones, no es necesario ser más específico con la etiqueta-
    {
        var voto = $(this).val(); //Captura el valor del voto (un entero de 1 a 5)
        var idCancion = $(this).attr('name'); //Captura el id de la canción -que será el mismo para los cinco radiobotones-
        var controlador = $(this).data('actual'); //Captura el valor del data-actual: verdadero si el radiobotón está marcado (checked), lo que indica que es el que determina la nota, o falso si no está marcado (no hay checked)

        if(controlador) voto = 0; //Si el radiobotón está marcado, hacer clic en él implica eliminar el voto (su valor pasa a ser cero)
        else $(`input:radio[name="${idCancion}"]`).data('actual', false); //Si el radiobotón no está marcado, hacer clic en él implica cambiar el voto, por lo que todos los data-actual (de los 5 radiobotones con ese id canción) pasan a falso, de manera que el que estuviese marcado -fuese el que fuese- deje de estarlo 

        $(this).prop('checked', !controlador); //Sólo para el radiobotón en que se ha hecho clic, tanto al checked como al data-actual se les asigna el valor contrario al que tiene el controlador
        $(this).data('actual', !controlador); //Si el botón no estaba marcado, el controlador es falso, por lo que al hacer clic en él pasa a estarlo (checked) -y data-actual pasa a verdadero-, y viceversa
        
        var cancion = $(this).parent().parent().siblings().children().children().find('.cancion').text(); //Captura el nombre de la canción y del autor
        var autor = $(this).parent().parent().siblings().children().children().find('.autor-recopilatorio').text();

        $.ajax( //Llamada AJaX para guardar el valor del voto en la BD y devolver la respuesta apropiada según la nota dada
        {
            type: 'POST', url: '../ajax_votacion.php', data: {voto: voto, id_cancion: idCancion},
            success: function(respuesta)
            {
                if(respuesta == 1) //Si "$this->conexion->query($sql);" tiene éxito devuelve 1
                {
                    if(voto == 5) swal("¡Guau!", "¡Amor a primera vista!", "success", {button: false});
                    else if(voto == 4) swal("¡Genial!", `¡Disfruta de ${autor}!`, "success", {button: false});
                    else if(voto == 3) swal(":)", "Buena canción, ¿eh?", "success", {button: false});
                    else if(voto == 2) swal("Vaya...", `¿No te convence ${cancion}?`, "success", {button: false});
                    else if(voto == 1) swal("Bueno...", "No a todo el mundo le puede gustar lo mismo...", "success", {button: false});
                    else swal("Circulen, circulen...", "Aquí nadie ha votado a nadie... ;)", "success", {button: false});
                }
                else swal("Vaya...", "Parece que tu voto no se ha podido enviar", "error", {button: false});
            },
            error: function()
            {
                swal("Vaya...", "Parece que tu voto no se ha podido enviar", "error", {button: false});
            }
        })
    })
});

/* Cambia el tamaño del número y el título de la canción al pasar el ratón por encima del vídeo de Youtube */

$(function()
{
    $('.youtube').mouseenter(function() //Al pasar el puntero por encima, añade las clases
    {
        $(this).parent().next().find('.numero').addClass('numero-grande');
        $(this).parent().next().find('.cancion').addClass('cancion-grande');
    });

   $('.youtube').mouseleave(function() //Al retirarlo, las elimina
    {
        $(this).parent().next().find('.numero').removeClass('numero-grande');
        $(this).parent().next().find('.cancion').removeClass('cancion-grande');
    });
});

/* Da más margen a la derecha a los números 2 y 12 */

$(function() 
{
    $('[data-contador="2"]').css('margin-right', '15px');
    $('[data-contador="12"]').css('margin-right', '15px');
});


/* LISTAS */

/* Creación */

$(function()
{
    $('.crear-lista').click(function() //Se activa al hacer clic en el botón de class="crear-lista"
    {
        var nombre = $('.nombre-lista').val(); //Se recogen los valores de los campos del formulario
        var descripcion = $('.descripcion').val();

        if(nombre.length < 3 || descripcion.length < 3) //Da un aviso en caso de que se intente crear un recopilatorio sin nombre o descripción
        {
            swal("Ah, sí...", "Tanto el nombre como la descripción han de tener una longitud de al menos 3 caracteres", "warning", {button: false});

            return false;
        }
        else
        {
            $.ajax( //Se hace una petición AJaX para crear la lista
            {
                type: 'POST', 
                url: '../ajax_crear_lista.php', 
                data: {nombre_lista: nombre, descripcion: descripcion},
                success: function(respuesta)
                {
                    if(respuesta == 1) //Si se efectúa el registro con éxito, se refresca la página web
                    {
                        function perfil(){window.location = 'http://localhost/recopilatorios/php/web/mvc/usuarios/listas';}

                        swal('¡Genial!', 'Tu lista está lista... ;P', 'success', {button: false}).then(setTimeout(perfil, 1500));
                    } 
                    else swal('Ups...', 'Algo ha fallado; intenta crear tu recopilatorio más tarde...', 'error', {button: false});
                },
                error: function()
                {
                    swal('Ups...', 'Algo ha fallado; intenta crear tu recopilatorio más tarde...', 'error', {button: false});
                }
            });
        }
    });
});

/* Agregar canciones a los recopilatorios */

$(function()
{
    $('.agregar-cancion').click(function()
    {
        var idLista = $(this).next().text();
        console.log(idLista);
        var idCancion = $(this).next().next().text();
        console.log(idCancion);
    });
});


/* VARIOS */

/* Carga de fotos en el modal */

$(function() 
{
    $('.portada').click(function() //Se activa al hacer clic en un elemento con class='portada', que es una imagen
    {
        let ruta = $(this).attr('src'); //Carga el valor del src de la foto en la variable ruta

        $('#modal-imagen-in').attr('src', ruta); //Le pasa la variable al elemento del modal de id='#modal-imagen-in', que también es una imagen
    });
});

/* Oculta/revela las botoneras de décadas/recopilatorios */

$(function() 
{
    $('header').mouseenter(function() //Al pasar el ratón por la cabecera, revela la botonera
    {
        $('.botonera').slideDown(750);
    })

    $('main').mouseenter(function() //Al pasar el ratón por el cuerpo principal, la oculta
    {
        $('.botonera').slideUp(750);
    })
});

/* Hace vibrar el número al hacer pasar el ratón sobre el título de la canción en el top 15 */

$(function()
{
    $('.cancion-decada').mouseenter(function() //Al pasar el ratón por encima del título de la canción, añade al número la clase que lo hace vibrar
    {
        $(this).closest('.ancho-100px').prev().find('span').addClass('shake-slow shake-constant');
    });

    $('.cancion-decada').mouseleave(function() //Al retirar el ratón, la elimina
    {
        $(this).closest('.ancho-100px').prev().find('span').removeClass('shake-slow shake-constant');
    });
});

/* Pinta el nombre del Administrador en rojo en los comentarios y los mensajes*/

$(function() 
{
    $('[data-usuario="Administrador"]').css('color', 'crimson'); 
    //Si es el Administrador, añade el formato apropiado
});