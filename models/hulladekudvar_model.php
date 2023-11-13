<?php

class Hulladekudvar_Model
{
    /**
    *  @param string $fajta
    *  @return Helyek
    */
    public function getHelyek(?string $fajta = null): array
    {
        $connection = Database::getConnection();
        $stmt = $connection->prepare("select distinct hely.id, hely.kerulet, hely.cim from hely join gyujt on hely.id = gyujt.helyid join fajta on gyujt.fajtaid = fajta.id where fajta.nev like ?;");
        $stmt->execute([$fajta ?: '%']);
        $result['helyek'] = $stmt->fetchAll(PDO::FETCH_ASSOC);
        return $result;
    }

    /**
    *  @return Fajtak
    */
    public function getFajtak(): array
    {
        $connection = Database::getConnection();
        $stmt = $connection->query("select * from fajta;");
        $result['fajtak'] = $stmt->fetchAll(PDO::FETCH_ASSOC);
        return $result;
    }
}

class Hely
{
    /**
     * @var int
     */
    public int $id;

    /**
     * @var string
     */
    public string $kerulet;

    /**
     * @var string
     */
    public string $cim;
}

class Helyek
{
    /**
     * @var Hely[]
     */
    public array $helyek;
}

class Fajta
{
    /**
     * @var int
     */
    public int $id;

    /**
     * @var string
     */
    public string $nev;
}

class Fajtak
{
    /**
     * @var Fajta[]
     */
    public array $fajtak;
}
