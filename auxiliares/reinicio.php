<?php
	
	/* Gestión del tiempo de inactividad para la desconexión del usuario */

	if($_SESSION['conectado']) $_SESSION["reinicio"] = time(); //Si el usuario está conectado, cada vez que se ejecuta el index -es decir, cada vez que se refresca la página- la sesión "reinicio" adquiere un valor equivalente a la fecha Unix actual, con lo cual el tiempo de inactividad pasa a ser cero
    else unset($_SESSION["reinicio"]); //De lo contrario, se elimina la sesión "reinicio", puesto que si no hay un usuario conectado no es necesario controlar el tiempo de sesión

?>