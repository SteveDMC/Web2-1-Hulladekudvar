<?php

class Arfolyam_Controller
{
    public $baseName = 'arfolyam';  //meghat�rozni, hogy melyik oldalon vagyunk
	public function main(array $vars) // a router �ltal tov�bb�tott param�tereket kapja
	{
        $arfolyam = new Arfolyam_Model;

        if (isset($vars['given_day'])) {
            $dailyRate = $arfolyam->getDailyRate($vars['currency1'], $vars['currency2'], $vars['given_day']);
        }
        //var_dump($vars);die;
        //$arfolyam->debug();
		$view = new View_Loader($this->baseName."_main");
        $view->assignAll([
            'first_date' => $arfolyam->getFirstDate(),
            'last_date' => $arfolyam->getLastDate(),
            'currencies' => $arfolyam->getCurrencies(),
            'currency1' => $vars['currency1'] ?? '',
            'currency2' => $vars['currency2'] ?? '',
            'given_day' => $vars['given_day'] ?? '',
            'daily_rate' => $dailyRate ?? '',
        ]);
	}
}