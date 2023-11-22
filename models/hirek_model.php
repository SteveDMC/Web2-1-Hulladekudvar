<?php

class Hirek_Model
{
    public function getHirek(): array
    {
        $connection = Database::getConnection();
        $stmt = $connection->query("select id, cim, tartalom, kep from hirek order by datum desc, id desc;");
        return $stmt->fetchAll(PDO::FETCH_ASSOC);
    }

    public function getHir(int $id): array
    {
        $connection = Database::getConnection();
        $stmt = $connection->prepare("select hirek.*, felhasznalok.csaladi_nev, felhasznalok.utonev, felhasznalok.bejelentkezes from hirek join felhasznalok on hirek.szerzoid = felhasznalok.id where hirek.id = ?;");
        $stmt->execute([$id]);
        return $stmt->fetchAll(PDO::FETCH_ASSOC);
    }

    public function addHir(int $szerzoid, string $cim, string $tartalom, string $kep)
    {
        $retData['eredmeny'] = "";
		try {
            $connection = Database::getConnection();
            $stmt = $connection->prepare("select count(*) as count from hirek where cim = ?");
            $stmt->execute([$cim]);
            $result = $stmt->fetch(PDO::FETCH_ASSOC);
            if ($result['count'] > 0) {
                throw new LogicException("'$cim' című hír már létezik!");
            }
            $connection->prepare("insert into hirek (szerzoid, datum, cim, tartalom, kep) values (?,?,?,?,?);")->execute([
                (int)$szerzoid,
                date('Y-m-d'),
                $cim,
                $tartalom,
                $kep
            ]);
            $this->uploadKep($kep);
            $retData['uzenet'] = "A hír létrehozása sikeresen megtörtént!";
        } catch (Throwable $e) {
            $retData['eredmeny'] = "ERROR";
            $retData['uzenet'] = $e->getMessage();
        }
        return $retData;
    }

    public function updateHir(string $cim, string $tartalom, string $kep, int $id): void
    {
        $connection = Database::getConnection();
        $connection->prepare("update hirek set cim=?, datum=?, tartalom=? where id=?;")->execute([            
            $cim,
            date('Y-m-d'),
            $tartalom,
            $id
        ]);
        if ($kep) {
            $this->uploadKep($kep);
            $connection->prepare("update hirek set kep=? where id=?;")->execute([$kep, $id]);
        }
    }

    public function uploadKep(string $kep)
    {
        $path = sprintf('%simages/%s', SERVER_ROOT, $kep);
        move_uploaded_file($_FILES['kep']['tmp_name'], $path);
    }
}
