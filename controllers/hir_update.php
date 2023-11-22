<?php

class Hir_update_Controller
{
	public $baseName = 'hir_update';
	public function main(array $vars)
	{
		$hirek_model = new Hirek_Model;
        $hirek_model->updateHir(
            $vars['cim'],
            $vars['tartalom'],
            $_FILES['kep']['name'],
            (int)$vars['id']
        );
        header(sprintf('Location: %shir/%s', SITE_ROOT, $vars['id']));
        exit;
	}
}