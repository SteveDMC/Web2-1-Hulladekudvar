<?php

class Hirek_Controller
{
	public $baseName = 'hirek';
	public function main(array $vars)
	{
		$view = new View_Loader($this->baseName."_main");
	}
}

?>