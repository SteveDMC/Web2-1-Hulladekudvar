<?php

class Hirek_Controller
{
	public $baseName = 'hirek';
	public function main(array $vars)
	{
		$hirek_model = new Hirek_Model;
        $hirek = $hirek_model->getHirek();
        $view = new View_Loader($this->baseName."_main");
		$view->assignAll([
			'hirek' => $hirek ?? [],
		]);
	}
}

?>