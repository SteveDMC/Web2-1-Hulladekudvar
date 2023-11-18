<?php

class Hir_Controller
{
	public $baseName = 'hir';
	public function main(array $vars)
	{
		$hir_id = (int)$vars[0];
		$hirek_model = new Hirek_Model;
		$komment_model = new Komment_Model;

        $view = new View_Loader($this->baseName."_main");
		$view->assignAll([
			'hir' => $hirek_model->getHir($hir_id)[0] ?? null,
			'kommentek' => $komment_model->getKommentek($hir_id) ?? [],
		]);
	}
}
