<?php

class Hir_add_Controller
{
	public $baseName = 'hir_uj';

	public function main(array $vars)
	{
		$hirek_model = new Hirek_Model;
        $result = $hirek_model->addHir(
            $_SESSION['userid'],
            $vars['cim'],
            $vars['tartalom'],
            $_FILES['kep']['name'],
        );
        $view = new View_Loader($this->baseName."_main");
        $view->assignAll($result);
	}
}
