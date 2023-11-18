<?php

class Hirek_Model
{
    /**
    *  @param string $hirek
    *  @return Hirek
    */
    public function getHirek(): array
    {
        $connection = Database::getConnection();
        $stmt = $connection->query("select cim, tartalom, kep from hirek;");
        return $stmt->fetchAll(PDO::FETCH_ASSOC);;
    }
}
