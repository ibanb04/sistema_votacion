<?php

class Usuario {

	protected $codigo;
	protected $nombre1;
	protected $nombre2;
	protected $apellido1;
	protected $apellido2;
	protected $password;
	protected $rol_id;
	protected $programa_id;
	protected $mesa_id;

	public function __construct($codigo, $nombre1, $nombre2, $apellido1, $apellido2, $password, $rol_id, $programa_id, $mesa_id){

		$this->codigo = $codigo;
		$this->nombre1 = $nombre1;
		$this->nombre2 = $nombre2;
		$this->apellido1 = $apellido1;
		$this->apellido2 = $apellido2;
		$this->password = $password;
		$this->rol_id = $rol_id;
		$this->programa_id = $programa_id;
		$this->mesa_id = $mesa_id;

	}

	public function getcodigo(){
		return $this->codigo;
	}
	public function setcodigo ($codigo){
		$this->codigo = $codigo;
		return $this;
	}

	public function getnombre1(){
		return $this->nombre1;
	}
	public function setnombre1 ($nombre1){
		$this->nombre1 = $nombre1;
		return $this;
	}

	public function getnombre2(){
		return $this->nombre2;
	}
	public function setnombre2 ($nombre2){
		$this->nombre2 = $nombre2;
		return $this;
	}

	public function getapellido1(){
		return $this->apellido1;
	}
	public function setapellido1 ($apellido1){
		$this->apellido1 = $apellido1;
		return $this;
	}

	public function getapellido2(){
		return $this->apellido2;
	}
	public function setapellido2 ($apellido2){
		$this->apellido2 = $apellido2;
		return $this;
	}

	public function getpassword(){
		return $this->password;
	}
	public function setpassword ($password){
		$this->password = $password;
		return $this;
	}

	public function getrol_id(){
		return $this->rol_id;
	}
	public function setrol_id ($rol_id){
		$this->rol_id = $rol_id;
		return $this;
	}

	public function getprograma_id(){
		return $this->programa_id;
	}
	public function setprograma_id ($programa_id){
		$this->programa_id = $programa_id;
		return $this;
	}

	public function getmesa_id(){
		return $this->mesa_id;
	}
	public function setmesa_id ($mesa_id){
		$this->mesa_id = $mesa_id;
		return $this;
	}

	public function toArray() {
        $vars = get_object_vars ( $this );
        $array = array ();
        foreach ( $vars as $key => $value ) {
            $array [ltrim ( $key, '_' )] = $value;
        }
        return $array;
    }

}