<?php

class Nyitolap_elerhetoseg_Controller
{
	public $baseName = 'nyitolap_elerhetoseg';  //meghatározni, hogy melyik oldalon vagyunk
	public function main(array $vars) // a router által továbbított paramétereket kapja
	{
		//betöltjük a nézetet
		$view = new View_Loader($this->baseName."_main");
	}
}

?>