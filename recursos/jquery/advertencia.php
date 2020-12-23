<script type="text/javascript"> 

    swal //Modal para advertir al usuario de que ha intentado modificar la cookie de recuerdo
    ({
        title: 'Vaya, un listillo...',
        text: 'Así que intentando hacerte pasar por otro usuario, ¿eh?',
        icon: 'error',
        dangerMode: true, //Resalta el botón para conservar la información
        closeOnClickOutside: false, //No permite cerrar el modal haciendo clic fuera de él
        button: 
        {
            text: 'No lo volveré a hacer',
            value: false,
            visible: true,
            className: 'btn btn-danger',
            closeModal: true,
        }
    });

</script>