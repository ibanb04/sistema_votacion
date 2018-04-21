<?php }
class DataSource {
	 private $datosConexion;
	 private $conexion;

	 public function __construct(){
	 	try{

	 		$config = fopen(__DIR__."/../../conf/config.json","r");
	 		if(!config){
	 			
	 			die("No se puede abrir el archivo de configuracion");

	 		}
	 		$content = "";
	 		while (!feof($config)) {
	 			$content.= fgets($config);
	 		}
	 		
	 		$json = json_decode($content,true);

	 		$this->$datosConexion = "mysql:host=".$json['host'].";dbname="."$json['database']".";charset=utf8";
	 		$this-<$conexion = new PDO($this->$datosConexion,$json['username'],$json['password']);

	 	}catch(PDOException $ex){
	 		echo $ex->getMessage();
	 	}
	 }

}
 ?>