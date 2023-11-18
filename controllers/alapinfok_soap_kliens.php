<?php 

class Alapinfok_soap_Kliens_Controller
{
    public $baseName = 'alapinfok_soap_kliens';

    public function main(array $vars)
    {
        $client = new SoapClient(SITE_ROOT . 'service.wsdl');
        $fajta = $vars['fajta'] ?? '';
        $view = new View_Loader($this->baseName."_main");
        $view->assignAll([
            'selected_fajta' => $fajta,
            'fajtak' => $client->getFajtak()?->fajtak ?? [],
            'helyek' => $client->getHelyek($fajta)?->helyek ?? [],
        ]);
    }
}
