<?php 

class Alapinfok_soap_Szerver_Controller
{
    public $baseName = 'alapinfok_soap_szerver';

    public function main(array $vars)
    {
        $server = new SoapServer("service.wsdl");
        $server->setClass('Hulladekudvar_Model');
        $server->handle();
    }
}
