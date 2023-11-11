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
        $defaultVars = $this->getDefaultVars($vars);

        if (($defaultVars['selected_type'] ?? array_key_first(self::QUERY_TYPES)) === 'daily') {
            $rateAtDay = $arfolyam->getRateAtGivenDay($defaultVars['currency1'], $defaultVars['currency2'], $defaultVars['given_day']);
        } else if (($defaultVars['selected_type'] ?? '') === 'monthly') {
            $ratesAtMonth = $arfolyam->getRatesAtGivenMonth($defaultVars['currency1'], $defaultVars['currency2'], $defaultVars['given_year'], $defaultVars['given_month']);
        }

        $view = new View_Loader($this->baseName."_main");
        $view->assignAll([
            ...$defaultVars,
            'first_date' => $arfolyam->getFirstDate(),
            'last_date' => $arfolyam->getLastDate(),
            'currencies' => $arfolyam->getCurrencies(),
            'months' => $arfolyam->getMonths(),
            'years' => $arfolyam->getYears(),
            'daily_rate' => $rateAtDay ?? null,
            'monthly_rate' => $ratesAtMonth ?? [],
        ]);
    }

    protected function getDefaultVars(array $vars): array
    {
        return [
            'types' => self::QUERY_TYPES,
            'selected_type' => $vars['selected_type'] ?? array_key_first(self::QUERY_TYPES),
            'currency1' => $vars['currency1'] ?? 'USD',
            'currency2' => $vars['currency2'] ?? 'HUF',
            'given_day' => $vars['given_day'] ?? date('Y-m-d', strtotime('-1 days')),
            'given_month' => $vars['given_month'] ?? date('m'),
            'given_year' => $vars['given_year'] ?? date('Y'),
        ];
    }
}