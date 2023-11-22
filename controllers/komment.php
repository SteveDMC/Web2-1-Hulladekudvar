<?php

class Komment_Controller
{
	public $baseName = 'komment';
	public function main(array $vars)
	{
		$komment_model = new Komment_Model;
        $komment_model->addKomment(
            $_SESSION['userid'],
            (int)$vars['hirid'],
            $vars['tartalom']
        );
        header(sprintf('Location: %shir/%s', SITE_ROOT, $vars['hirid']));
        exit;
	}
}
