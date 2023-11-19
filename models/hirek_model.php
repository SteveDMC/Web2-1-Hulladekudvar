<?php

class Hirek_Model
{
    public function getHirek(): array
    {
        $connection = Database::getConnection();
        $stmt = $connection->query("select id, cim, tartalom, kep from hirek;");
        return $stmt->fetchAll(PDO::FETCH_ASSOC);
    }

    public function getHir(int $id): array
    {
        $connection = Database::getConnection();
        //$stmt = $connection->prepare("select * from hirek where id = ?;");
        $stmt = $connection->prepare("select hirek.*, felhasznalok.csaladi_nev, felhasznalok.utonev from hirek join felhasznalok on hirek.szerzoid = felhasznalok.id where hirek.id = ?;");
        $stmt->execute([$id]);
        return $stmt->fetchAll(PDO::FETCH_ASSOC);
    }
}
