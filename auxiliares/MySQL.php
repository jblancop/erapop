<?php

	/* Clase de conexión a la BD, en principio para ser llamada estáticamente desde los modelos */

	class MySQL
	{
		private static $servidor = "localhost"; //Al ser atributos privados no se puede acceder a ellos desde fuera de la clase, con lo cual no es posible que alguien ajeno altere los parámetros de conexión
		private static $usuario = "root"; 
		private static $contrasena = ""; 
		private static $base_datos = "recopilatorios";

		private static $conexion; //Su finalidad es almacenar el objeto MySQLi de conexión a la BD

		function __construct($base_datos) {self::$base_datos = $base_datos;} //En caso de que sea necesario conectarse a una BD diferente a la habitual es posible hacerlo instanciando un objeto, pero sin alterar el resto de parámetros

		private static function instanciar() //Método de creación del objeto MySQLi -innaccesible desde fuera de la clase-
		{
			$mysqli = new mysqli(self::$servidor, self::$usuario, self::$contrasena, self::$base_datos);
			$mysqli->set_charset("utf8");

			return $mysqli;
		}

		static function conectar() //Método público de conexión
		{
			self::$conexion = self::instanciar(); //Se invoca el objeto MySQLi y se guarda en el atributo $conexion

			return self::$conexion; //Cualquier objeto, bien de la clase MySQL o de otra -que tenga acceso a MySQL, como los modelos-, puede reclamar el objeto MySQLi para conectarse a la BD invocando el método conectar()
		}
	}

?>