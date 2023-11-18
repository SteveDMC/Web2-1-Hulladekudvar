<?php

class Hir_Controller
{
	public $baseName = 'hir';
	public function main(array $vars)
	{
		$hirek_model = new Hirek_Model;
        $hir = $hirek_model->getHirek();
        $view = new View_Loader($this->baseName."_main");
		$view->assignAll([
			'hir' => $hir ?? [],
		]);
	}
}

?>