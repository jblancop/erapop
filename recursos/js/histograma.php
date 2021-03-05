<script type="text/javascript">
    
    $(function() //Gráfico de barras con distribución de frecuencias de las canciones
    {
        var contexto = $('#histograma')[0].getContext('2d'); //Hace referencia al div donde se pinta el histograma

        var nota_1 = $('[data-nota="1"]').data('numero'); //Para cada nota, recoge el número de canciones que le corresponden
        var nota_2 = $('[data-nota="2"]').data('numero');
        var nota_3 = $('[data-nota="3"]').data('numero');
        var nota_4 = $('[data-nota="4"]').data('numero');
        var nota_5 = $('[data-nota="5"]').data('numero');

        var grafico = new Chart(contexto, //Liga el gráfico con el div
        {
            type: 'bar', //Tipo de gráfico
            data: //Datos
            {
                datasets: 
                [{
                    data: [nota_1, nota_2, nota_3, nota_4, nota_5],
                    backgroundColor: ['#5bc0de', '#5bc0de', '#5bc0de', '#5bc0de', '#5bc0de'],
                    label: 'Número de canciones'
                }],
                labels: ['*','**','***','****','******']
            },
            options: //Opciones de diseño
            {
                responsive: true,
                scales:
                {
                    yAxes: 
                    [{
                        gridLines: {display: false},
                        ticks: {min: 0}
                    }],
                    xAxes: 
                    [{
                        gridLines: {display: false}
                    }]
                }
            }
        })
    });

</script>