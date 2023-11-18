<?php

class Hirek_Controller
{
	public $baseName = 'hirek';
	public function main(array $vars)
	{
        $hirek = $vars['hirek'] ?? '';
        $view = new View_Loader($this->baseName."_main");
	}
}

?>