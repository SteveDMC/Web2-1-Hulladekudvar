<?php

class Komment_Model
{
    public function getKommentek($hir_id): array
    {
        $connection = Database::getConnection();
        $stmt = $connection->prepare("select komment.*, bejelentkezes from komment join felhasznalok on komment.szerzoid = felhasznalok.id where hirid = ? order by datum desc;");
        $stmt->execute([$hir_id]);
        return $stmt->fetchAll(PDO::FETCH_ASSOC);
    }

    public function addKomment(int $szerzoid, int $hirid, string $tartalom): void
    {
        $connection = Database::getConnection();
        $connection->prepare("insert into komment (szerzoid, hirid, datum, tartalom) values (?, ?, ?, ?)")->execute([
            $szerzoid,
            $hirid,
            date('Y-m-d H:i:s'),
            $tartalom
        ]);
    }
}
