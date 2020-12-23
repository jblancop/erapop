<?php

	/* Modelo base del que heredan todos los demás */

	require_once('auxiliares/MySQL.php');

	class ModeloBase
	{
		protected $conexion;

		protected function __construct() {$this->conexion = MySQL::conectar();} //Un objeto instanciado, en principio de una clase -otro modelo- heredera, se puede conectar a la BD por defecto a través del atributo $conexion

		function listar($tabla1, $union_tabla2, $where, $atributo) //Método transversal para hacer una consulta a la BD que liste todos los registros de hasta dos tablas que se le pasen como parámetros
		{
			$sql = "SELECT 
						* 
					FROM 
						$tabla1
							$union_tabla2
					$where 
					ORDER BY
						$atributo";

			$consulta = $this->conexion->query($sql);

			return $consulta;
		}
	}

?>