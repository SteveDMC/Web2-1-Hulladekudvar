<?php

class Hirek_Model
{
    /**
    *  @param string $hirek
    *  @return Hirek
    */
    public function getHirek(?string $hirek = null): array
    {
        $connection = Database::getConnection();
        $stmt = $connection->prepare("select hirek.kep, hirek.cim from hirek;");
        $result['hirek'] = $stmt->fetchAll(PDO::FETCH_ASSOC);
        return $result;
    }
}

class Hir
{
    /**
     * @var string
     */
    public string $kep;

    /**
     * @var string
     */
    public string $cim;
}

class Hirek
{
    /**
     * @var Hir[]
     */
    public array $hirek;
}

?>