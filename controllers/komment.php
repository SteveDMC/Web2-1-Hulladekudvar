<?php

class Komment_Controller
{
	public $baseName = 'komment';
	public function main(array $vars)
	{
		$komment_model = new Komment_Model;
        $komment_model->addKomment(
            (int)$vars['szerzoid'],
            (int)$vars['hirid'],
            $vars['tartalom']
        );
        header(sprintf('Location: %shir/%s', SITE_ROOT, $vars['hirid']));
        exit;
	}
}
