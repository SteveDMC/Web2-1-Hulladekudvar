<?php

class Hir_uj_Controller
{
	public $baseName = 'hir_uj';
	public function main(array $vars)
	{
        $view = new View_Loader($this->baseName."_main");
	}
}