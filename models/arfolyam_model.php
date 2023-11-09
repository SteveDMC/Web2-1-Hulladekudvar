<?php

class Arfolyam_Model
{
    private const MNB_WSDL_URL = "http://www.mnb.hu/arfolyamok.asmx?WSDL";

    private SoapClient $client;
    private SimpleXMLElement $info;

	public function __construct()
    {
        $this->client = new SoapClient(self::MNB_WSDL_URL);
        $this->info = simplexml_load_string($this->client->GetInfo()->GetInfoResult);
    }

    public function getFirstDate(): string
    {
        return $this->info->FirstDate;
    }

    public function getLastDate(): string
    {
        return $this->info->LastDate;
    }

    public function getCurrencies(): array
    {
        return (array)$this->info->Currencies->Curr;
    }

    public function getDailyRate(string $currency1, string $currency2, string $date)
    {
        $ratesXml = $this->getExchangeRates($currency1, $currency2, $date, $date);
        $rates = [];
        foreach ($ratesXml->Day[0]->Rate as $rate) {
            $curr = (string)$rate['curr'];
            $unit = (float)$rate['unit'];
            $rates[$curr] = $unit * (float)$rate;
        }
        $rate1 = $rates[$currency1] ?? 1.0;
        $rate2 = $rates[$currency2] ?? 1.0;
        return  $rate1 / $rate2;
    }

    protected function getExchangeRates(string $currency1, string $currency2, string $startDate, string $endDate)
    {
        return simplexml_load_string(
            $this->client->GetExchangeRates(
                ['startDate' => $startDate, 'endDate' => $endDate, 'currencyNames' => implode(',', [$currency1, $currency2])]
            )->GetExchangeRatesResult
        );
    }

    public function debug() {
        echo '<pre>';
        var_dump($this->getFirstDate());
        var_dump($this->getLastDate());
        var_dump($this->getCurrencies());
        echo '</pre>';
        die;
    }
}
