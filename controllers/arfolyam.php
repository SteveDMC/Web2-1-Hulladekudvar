<?php

class Arfolyam_Controller
{
    const QUERY_TYPES = [
        'daily' => 'Napi árfolyam',
        'monthly' => 'Havi árfolyam',
    ];

    public string $baseName = 'arfolyam';

    public function main(array $vars)
    {
        $arfolyam = new Arfolyam_Model;

        if (($vars['type'] ?? '') === 'daily') {
            $rateAtDay = $arfolyam->getRateAtGivenDay($vars['currency1'], $vars['currency2'], $vars['given_day']);
        } else if (($vars['type'] ?? '') === 'monthly') {
            $ratesAtMonth = $arfolyam->getRatesAtGivenMonth($vars['currency1'], $vars['currency2'], $vars['given_year'], $vars['given_month']);
        }

        $view = new View_Loader($this->baseName."_main");
        $view->assignAll([
            'first_date' => $arfolyam->getFirstDate(),
            'last_date' => $arfolyam->getLastDate(),
            'currencies' => $arfolyam->getCurrencies(),
            'months' => $arfolyam->getMonths(),
            'years' => $arfolyam->getYears(),
            'types' => self::QUERY_TYPES,
            'selected_type' => $vars['type'] ?? array_key_first(self::QUERY_TYPES),
            'currency1' => $vars['currency1'] ?? 'EUR',
            'currency2' => $vars['currency2'] ?? 'HUF',
            'given_day' => $vars['given_day'] ?? date('Y-m-d'),
            'given_month' => $vars['given_month'] ?? date('m'),
            'given_year' => $vars['given_year'] ?? date('Y'),
            'daily_rate' => $rateAtDay ?? null,
            'monthly_rate' => $ratesAtMonth ?? [],
        ]);
    }
}