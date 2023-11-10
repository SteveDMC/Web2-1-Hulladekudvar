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

    public function getMonths(): array
    {
        return range(1, 12);
    }

    public function getYears(): array
    {
        $firstYear = date('Y', strtotime($this->getFirstDate()));
        $lastYear = date('Y', strtotime($this->getLastDate()));
        return range($firstYear, $lastYear);
    }

    public function getCurrencies(): array
    {
        $currencies = (array)$this->info->Currencies->Curr;
        asort($currencies);
        return $currencies;
    }

    public function getRateAtGivenDay(string $currency1, string $currency2, string $date): float
    {
        $ratesXml = $this->fetchExchangeRates($currency1, $currency2, $date, $date);
        return $this->calculateDayRate($currency1, $currency2, $ratesXml->Day[0]);
    }

    public function getRatesAtGivenMonth(string $currency1, string $currency2, string $year, string $month): array
    {
        $startDate = sprintf("%s-%s-1", $year, $month);
        $endDate = date("Y-m-t", strtotime($startDate));
        $ratesXml = $this->fetchExchangeRates($currency1, $currency2, $startDate, $endDate);
        foreach ($ratesXml as $dayXML) {
            $result[(string)$dayXML['date']] = $this->calculateDayRate($currency1, $currency2, $dayXML);
        }
        return $result ?? [];
    }

    protected function calculateDayRate(string $currency1, string $currency2, SimpleXMLElement $dayXML): float
    {
        foreach ($dayXML->Rate as $rate) {
            $curr = (string)$rate['curr'];
            $unit = (float)$rate['unit'];
            $rates[$curr] = (float)str_replace(',', '.', $rate) / $unit;
        }
        $rate1 = $rates[$currency1] ?? 1.0;
        $rate2 = $rates[$currency2] ?? 1.0;
        return  $rate1 / $rate2;
    }

    protected function fetchExchangeRates(string $currency1, string $currency2, string $startDate, string $endDate): SimpleXMLElement
    {
        return simplexml_load_string(
            $this->client->GetExchangeRates(
                ['startDate' => $startDate, 'endDate' => $endDate, 'currencyNames' => implode(',', [$currency1, $currency2])]
            )->GetExchangeRatesResult
        );
    }
}
