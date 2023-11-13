<?php 

class Soap_Szerver_Controller
{
    public $baseName = 'soap_szerver';

    public function main(array $vars)
    {
        $server = new SoapServer("service.wsdl");
        $server->setClass('Hulladekudvar_Model');
        $server->handle();
    }
}
