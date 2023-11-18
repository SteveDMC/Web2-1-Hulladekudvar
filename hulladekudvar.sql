-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Gép: 127.0.0.1
-- Létrehozás ideje: 2023. Nov 17. 22:51
-- Kiszolgáló verziója: 10.4.28-MariaDB
-- PHP verzió: 8.1.17

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Adatbázis: `hulladekudvar`
--
CREATE DATABASE IF NOT EXISTS `hulladekudvar` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `hulladekudvar`;

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `fajta`
--

CREATE TABLE `fajta` (
  `id` int(11) NOT NULL,
  `nev` varchar(300) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- A tábla adatainak kiíratása `fajta`
--

INSERT INTO `fajta` (`id`, `nev`) VALUES
(1, 'műanyag és fém'),
(2, 'papír'),
(3, 'italoskarton'),
(4, 'színes üveg'),
(5, 'fehér üveg'),
(6, 'hungarocell'),
(7, 'elem'),
(8, 'akkumulátor'),
(9, 'elektronikai hulladék'),
(10, 'elektromos hulladék'),
(11, 'fénycső, világítótest'),
(12, 'fáradtolaj'),
(13, 'étolaj'),
(14, 'használtruha'),
(15, 'zöldhulladék'),
(16, 'építési, bontási törmelék'),
(17, 'festék'),
(18, 'gumiabroncs'),
(19, 'lom');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `felhasznalok`
--

CREATE TABLE `felhasznalok` (
  `id` int(11) UNSIGNED NOT NULL,
  `csaladi_nev` varchar(45) NOT NULL DEFAULT '',
  `utonev` varchar(45) NOT NULL DEFAULT '',
  `bejelentkezes` varchar(12) NOT NULL DEFAULT '',
  `jelszo` varchar(40) NOT NULL DEFAULT '',
  `jogosultsag` varchar(3) NOT NULL DEFAULT '_1_'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- A tábla adatainak kiíratása `felhasznalok`
--

INSERT INTO `felhasznalok` (`id`, `csaladi_nev`, `utonev`, `bejelentkezes`, `jelszo`, `jogosultsag`) VALUES
(1, 'Rendszer', 'Admin', 'Admin', 'd033e22ae348aeb5660fc2140aec35850c4da997', '__1'),
(2, 'Családi_2', 'Utónév_2', 'Login2', '6cf8efacae19431476020c1e2ebd2d8acca8f5c0', '_1_'),
(3, 'Családi_3', 'Utónév_3', 'Login3', 'df4d8ad070f0d1585e172a2150038df5cc6c891a', '_1_'),
(4, 'Családi_4', 'Utónév_4', 'Login4', 'b020c308c155d6bbd7eb7d27bd30c0573acbba5b', '_1_'),
(5, 'Családi_5', 'Utónév_5', 'Login5', '9ab1a4743b30b5e9c037e6a645f0cfee80fb41d4', '_1_'),
(6, 'Családi_6', 'Utónév_6', 'Login6', '7ca01f28594b1a06239b1d96fc716477d198470b', '_1_'),
(7, 'Családi_7', 'Utónév_7', 'Login7', '41ad7e5406d8f1af2deef2ade4753009976328f8', '_1_'),
(8, 'Családi_8', 'Utónév_8', 'Login8', '3a340fe3599746234ef89591e372d4dd8b590053', '_1_'),
(9, 'Családi_9', 'Utónév_9', 'Login9', 'c0298f7d314ecbc5651da5679a0a240833a88238', '_1_'),
(10, 'Családi_10', 'Utónév_10', 'Login10', 'a477427c183664b57f977661ac3167b64823f366', '_1_');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `gyujt`
--

CREATE TABLE `gyujt` (
  `helyid` int(11) NOT NULL,
  `fajtaid` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- A tábla adatainak kiíratása `gyujt`
--

INSERT INTO `gyujt` (`helyid`, `fajtaid`) VALUES
(1, 1),
(1, 2),
(1, 3),
(1, 5),
(1, 8),
(1, 9),
(1, 11),
(1, 13),
(2, 2),
(2, 4),
(2, 7),
(2, 9),
(2, 10),
(2, 12),
(2, 13),
(2, 14),
(3, 2),
(3, 3),
(3, 5),
(3, 7),
(3, 8),
(3, 9),
(3, 11),
(3, 12),
(3, 13),
(3, 14),
(4, 2),
(4, 3),
(4, 4),
(4, 7),
(4, 8),
(4, 10),
(4, 12),
(4, 13),
(4, 14),
(5, 1),
(5, 3),
(5, 4),
(5, 5),
(5, 7),
(5, 8),
(5, 9),
(5, 12),
(5, 13),
(6, 1),
(6, 2),
(6, 3),
(6, 4),
(6, 5),
(6, 7),
(6, 8),
(6, 9),
(6, 10),
(6, 13),
(7, 1),
(7, 2),
(7, 4),
(7, 5),
(7, 8),
(7, 9),
(7, 11),
(7, 14),
(8, 1),
(8, 2),
(8, 3),
(8, 6),
(8, 7),
(8, 8),
(8, 9),
(8, 10),
(8, 11),
(8, 12),
(8, 14),
(9, 1),
(9, 3),
(9, 6),
(9, 7),
(9, 8),
(9, 10),
(9, 11),
(9, 12),
(9, 14),
(10, 1),
(10, 2),
(10, 4),
(10, 6),
(10, 7),
(10, 8),
(10, 12),
(10, 13),
(10, 14),
(10, 15),
(10, 19),
(11, 1),
(11, 4),
(11, 5),
(11, 6),
(11, 7),
(11, 8),
(11, 10),
(11, 14),
(12, 1),
(12, 2),
(12, 4),
(12, 5),
(12, 8),
(12, 9),
(12, 12),
(12, 13),
(12, 14),
(13, 3),
(13, 5),
(13, 6),
(13, 7),
(13, 9),
(13, 10),
(13, 12),
(13, 14),
(14, 1),
(14, 2),
(14, 5),
(14, 6),
(14, 9),
(14, 10),
(14, 11),
(14, 14),
(14, 15),
(14, 16),
(15, 1),
(15, 5),
(15, 6),
(15, 7),
(15, 8),
(15, 9),
(15, 10),
(15, 14),
(15, 19),
(16, 2),
(16, 3),
(16, 4),
(16, 7),
(16, 10),
(16, 11),
(16, 12),
(16, 13),
(16, 14),
(17, 1),
(17, 2),
(17, 6),
(17, 7),
(17, 8),
(17, 9),
(17, 10),
(17, 13),
(17, 15),
(17, 16),
(17, 17),
(17, 18),
(17, 19);

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `hely`
--

CREATE TABLE `hely` (
  `id` int(11) NOT NULL,
  `kerulet` varchar(100) NOT NULL,
  `cim` varchar(300) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- A tábla adatainak kiíratása `hely`
--

INSERT INTO `hely` (`id`, `kerulet`, `cim`) VALUES
(1, 'III.', 'Testvérhegyi út 10/a'),
(2, 'IV.', 'Ugró Gyula sor 1-3.'),
(3, 'IV.', 'Zichy Mihály utca - Istvántelki út sarok'),
(4, 'VIII.', 'Sárkány utca 5.'),
(5, 'IX.', 'Ecseri út 9.'),
(6, 'X.', 'Fehér köz 2.'),
(7, 'XI.', 'Bánk bán utca 8-10.'),
(8, 'XIII.', 'Tatai út 96.'),
(9, 'XIV.', 'Füredi út 74.'),
(10, 'XV.', 'Károlyi Sándor út 166.'),
(11, 'XV.', 'Zsókavár utca 65. szám után'),
(12, 'XVI.', 'Csömöri út 2-4.'),
(13, 'XVII.', 'Gyökér köz 4.'),
(14, 'XVIII.', 'Jegenye fasor 15. mellett'),
(15, 'XVIII.', 'Besence utca 1/a.'),
(16, 'XXI.', 'Mansfeld Péter utca 86.'),
(17, 'XXII.', 'Nagytétényi út 341-343.');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `hirek`
--

CREATE TABLE `hirek` (
  `id` int(11) UNSIGNED NOT NULL,
  `szerzoid` int(11) UNSIGNED NOT NULL,
  `datum` date NOT NULL,
  `cim` varchar(300) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `tartalom` varchar(6000) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `kep` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- A tábla adatainak kiíratása `hirek`
--

INSERT INTO `hirek` (`id`, `szerzoid`, `datum`, `cim`, `tartalom`, `kep`) VALUES
(1, 7, '2019-08-16', 'Ellepi Budapestet a hullámkarton, nem győzik a hulladékudvarok', 'FIGYELEM! Tájékoztatjuk tisztelt ügyfeleinket, hogy valamennyi hulladékudvarunkban, az extrém módon megnövekedett hullámkarton beszállítások miatt, kapacitáshiány okán, korlátozott az átvétel és jelenleg - átmeneti ideig - csak a lakossági mennyiségek átvételére van mód. Megértésüket köszönjük!\r\n\r\n– írja a Fővárosi Közterület-fenntartó (KFKF) honlapja. A cég sajtóosztályától megtudtuk, hogy már tavaly erősen megnőtt a hulladékudvarokba beszállított mennyiség, 2019 első félévében pedig újabb 15 százalékkal több hullámkarton érkezett. Sőt, voltak olyan hónapok (március és a július), amikor „az előző évi ugyanezen havi beszállításokhoz képest, közel 40%-os a begyűjtött mennyiség növekménye”.\r\n\r\nDe miért lett ilyen sok?\r\n\r\nBudapesten egyébként 17 hulladékgyűjtő udvar működik, ahol a lakosság leadhatja a szelektíven gyűjtött hulladékot, sőt, bizonyos elkülönítetten gyűjtött veszélyes, speciális kezelést igénylő, valamint csomagolási hulladékfajtákat is fogadnak ingyen.\r\n\r\nKivéve most a hullámkartont, ami egy 100 százalékban újrahasznosítható papíripari alapanyag, főként csomagolásra használják. Ugyanis annyira sokat visznek be a különböző vállalatok, hogy az FKF már nem bírja tárolni és az újrahasznosító telepekre szállítani. Most csak a normál átlagos életvitel kapcsán keletkező mennyiségeket fogadják be, az FKF sajtóosztálya szerint ez a gyakorlatban az átlagos személygépkocsikba beférő lakossági mennyiségek átvételét jelenti. „A személyautóval beszállítható mennyiségnél nagyobb mennyiség esetében az átvételt kapacitáshiány esetén megtagadhatjuk, jelenleg is ez a korlátozás van érvényben” – mondták az FKF-esek az Indexnek. \r\n\r\nTulajdonképpen az történt, hogy egy csomó cég, amelyikeknél nagy mennyiségű hullámkarton van, nekiálltak a budapesti – elvileg a lakosság kiszolgálására való – hulladékudvarra ömleszteni a csomagolóanyagot.\r\n\r\nAz FKF szerint a hullámkarton túlburjánzás egyik oka, hogy a hulladékudvarok ismertsége nő, másrészt fellendült az ingatlanpiac, egyre többen költözködnek, az építkezések is beindultak. „Egy biztos, a beáramló hullámkarton-mennyiség túlnyomó többsége tartós fogyasztási cikk csomagolóanyaga, bútorok, elektromos és elektronikai eszközök csomagolása.”\r\n\r\nHa önnek mégis van hullámkartonja, és szeretné leadni, akkor érdemes tájékozódnia a legközelebbi udvarnál, hogy tudják-e fogadni, a szigorúan maximum személygépkocsiban szállítható mennyiséget. Itt egyébként mindig talál aktuális információkat a hulladékátvételről.', '01_ellepi_bp_hullamkarton.jpg'),
(2, 4, '2019-11-08', 'Nem veszik át a veszélyes hulladékot Budapesten', 'Extrém mennyiség érkezett festékhulladékból és növényvédőszerből, megteltek a hulladékudvarok.\r\n\r\nLomtalanítunk és abba futottunk bele, hogy a festékmaradékot és más, veszélyes hulladékot (lakk, fugázó anyag, gyomirtó, stb.) nem tudtuk leadni az FFK hulladék udvarában. - írja olvasónk.\r\n\r\nAz FKF emberei azzal küldték el őket, hogy azért nem tudják átvenni a veszélyes hulladékot, mert a kezelő alvállalkozóval megszűnt a szerződés, és még nem újították meg. Nem tudták nekik megmondani, hogy ez meddig lesz így. \r\n\r\nMegkerestük Fővárosi Közterület-fenntartót Zrt.-t, ahol elmondták, hogy a fokozott lakossági érdeklődés kapcsán, az elmúlt időben a veszélyes hulladékokból beérkezett extrém mennyiségek miatt az érintett két hulladékudvar (XXII. Nagytétényi út 335, XV. Károlyi Sándor u. 166.) kapacitása valóban megtelt. Így a festékhulladék és növényvédőszer átvétele átmeneti ideig szünetel.\r\n\r\nHozzátették: a begyűjtött anyagfajták tekintetében élő szerződéssel rendelkeznek, az érintett telephelyekről a szükséges szállításokat megrendelték. Ez azt jelenti, hogy egy-két héten belül a szolgáltatás változatlan formában folytatódik, addig hulladékudvari leadás kapcsán kérik ügyfeleink szíves türelmét.\r\n\r\nMint kiderült, nemcsak a festékhulladék és növényvédőszer átvétele szünetel, hanem sok helyen a gumié, a hungarocellé, és a fáradt olajé is.', '02_nem_veszik_at_veszelyes_bp.jpg'),
(3, 2, '2022-09-24', 'Tudja, mihez kezdjen a használt sütőolajjal?', 'Magyarországon évente 25 ezer tonna használt étolaj keletkezik, ami veszélyes hulladéknak minősül: egyre több helyen le lehet adni, amit egyre többen meg is tesznek, mégis a lakosság harmada még mindig a lefolyóba önti, pedig egyetlen csepp használt étolaj akár ezer liter élővizet is elszennyezhet. Sok ember számára nehézséget okoz, hogy környezetterhelés nélkül hol és hogyan tud megszabadulni a fáradt olajtól.\r\n\r\nMeddig lehet használni az étolajat?\r\n\r\nAz éttermek általánosságban kétnaponta cserélik az étolajat, otthoni körülmények között legfeljebb négy alkalommal érdemes felhasználni, ha nem melegítettük fel 160-180 Celsius-fokra. Ha megbarnult az olaj, az azt jelzi, hogy a sütés magasabb hőfokon történt, megégett, nem szabad újra felhasználni. Az sem mindegy, hogy mi sült benne: rántott ételeknél a prézli hamarabb megéghet benne, újrafelhasználás előtt érdemes leszűrni, hasábkrumpli készítése után erre nincs szükség. Ezután zárható üvegedényben, befőttesüvegben érdemes tárolni. \r\nA csatornahálózatban dugulást okoz, semmiképpen ne öntsük a lefolyóba, ami régen általános rossz szokás volt. A Magyar Víz- és Szennyvíztechnikai Szövetség felmérése szerint ezt egyre kevesebben teszik, de a lakosság harmada még mindig így cselekszik.\r\n\r\nEz egyrészt környezeti károkat okoz, az olaj bekerülhet az élővizekbe, az olajréteg pedig elzárja az oxigénfelvételt, ezzel elpusztítja a víz élővilágát – egyetlen csepp olaj akár ezer liter élővizet szennyezhet el.\r\n\r\nMásrészt a csővezeték falára tapadva az otthoni vízvezetéket eldugíthatja, ami számos kellemetlenséggel jár, és az azt elhárító szerelő költségével. A csatornahálózatban is hasonló problémákat okoz: nemcsak a vezetékek falán tapad meg az olaj, szűkítve ezzel a rendszert, de a nem lebomló nedves törlőkendőre, hajszálakra rátapadva is, és összefogva ezeket óriási zsírdugókat hoz létre, ahogy erre márciusban is volt példa. A Fővárosi Csatornázási Művek akkor egy nyolcméteres zsírszörnytől szabadította meg a hálózatot. Mint írták, ez egy hónap alatt jöhetett létre, és munkatársaiknak órákba telt, mire sikerült megszabadítani ettől a csőrendszert. \r\n\r\n„Az utóbbi évtizedben terjedt el a nedves törlőkendők használata, ami nem lebomló anyagként a dugulások legfőbb okozója, ugyan már negyedannyian dobják ezeket a vécébe, mint három évvel ezelőtt, de még mindig jelentős problémákat okoz a hálózatban.\r\n\r\nA konyhai hulladékkal, ételmaradékkal, zsiradékkal együtt összetapadnak gombóccá, amik gyorsan elzárják a szennyvíz útját. A több mint hatezer kilométer hosszú fővárosi csatornahálózatban csak ebben az évben több mint ezerötszáz dugulást kellett elhárítanunk, ez nagymértékben lassítja a tevékenységünket. – fejtette ki Bátori Marianna, a Fővárosi Csatornázási Művek Zrt. kommunikációs vezetője, aki hozzátette: éves szinten 2,5 milliárd forint többletköltséget jelent a víziközmű-szolgáltatóknak az ebből fakadó üzemzavarok felszámolása.', '03_mit_kezdjunk_sutoolaj.jpg'),
(4, 6, '2022-10-16', 'Száz százalékban újrahasznosítható az étolaj', 'Az éttermeknek kötelező leadni a fáradt sütőolajat, a háztartások azonban maguk dönthetnek erről. Nagyjából ötvenezer tonna Magyarországon a lakossági étolaj-felhasználás, és a szakemberek tapasztalatai szerint még mindig jelentős azok száma, akik helytelen módon szabadulnak meg tőle, a lefolyóba öntik, vagy köztéri szemetesbezacskóba, üvegbe, műanyag palackba töltve egyszerűen kidobják, pedig nehezen lebomló környezetszennyező anyag, ami a megfelelő helyre leadva száz százalékban újrahasznosítható.\r\n\r\n„Automata olvasztóberendezésben történő pár napos tisztítás és ülepítés után a legnagyobb részéből, 90 százalékából biodízel készül, amit az uniós szabályozás szerint 8,4 százalékban kötelező az üzemanyaghoz keverni. Az égett prézliből és az olajban visszamaradó ételmaradékokból pedig biogáz lesz” – részletezte Deák Brigitta, az egyik legnagyobb magyarországi használtétolaj-feldolgozó, a Biofilter Zrt. marketingvezetője. Az üzem elsősorban az éttermekből szállítja el a használt sütőolajat, amivel 32 éve foglalkoznak, a lakosságtól tíz éve gyűjtik be a benzinkutaknál, szupermarketeknél erre a célra kihelyezett konténerekből, illetve a hulladékudvari lerakatokból.\r\n\r\nA hazai mennyiség nagyjából 60 százaléka, évente olyan 6000 tonna használt sütőolaj érkezik hozzánk, aminek 7-10 százaléka származik a lakosságtól. Nyáron elsősorban a balatoni vendéglátóhelyek forgalma miatt, a karácsonyi és a húsvéti ünnepek során a háztartások után növekszik a beszállított mennyiség – ismertette a feldolgozó cég képviselője, aki hozzáfűzte, az adataik azt mutatják, hogy növekszik azok száma, akik megtalálják az erre alkalmas gyűjtőpontokat.\r\n\r\nHol tudjuk leadni a fáradt sütőolajat?\r\n\r\nMár több mint tíz éve lehet leadni benzinkutakon, hulladékudvarban a használt sütőolajat, mégis a mai napig sok környezettudatos ember számára okoz fejtörést, hogy mit kezdjen kidobásra ítélt, használt étolajjal. A felmérések szerint a többség tisztában van azzal, hogy az olaj veszélyes hulladék, mégis még mindig sokan inkább a lefolyóba öntik, mintsem hogy leadásra alkalmas gyűjtőpontokat keresgéljenek. \r\n\r\nA legnagyobb forgalmú benzinkutakon vannak használtétolaj-lerakatok, a Molnál több mint 350, a Shellnél 44, de az év végére 120 töltőállomáson, a Mobil Petrol teljes kúthálózatán, a Lukoil és az OIL!-kutakon is lesznek. Sok szupermarket előtt helyeztek ki használtétolaj-lerakatot, az Aldi, a Lidl, a Coop, a Tesco, a Spar több áruházánál is van erre lehetőség. Emellett a Fővárosi Közterület-fenntartó Nonprofit Zrt. honlapján és a társasházaknál is feltüntetett, a lakóhelyhez legközelebbi hulladékudvarba is lehet vinni az olajat, ahol egy személy egyszerre 15, a benzinkutakon 10 kilogrammot adhat le. Deák Brigitta tájékoztatása szerint a legtöbben a töltőállomásokra viszik az olajat, tavaly 420 tonnát gyűjtöttek be innen, a bolthálózatoktól 140 tonnát szállítottak feldolgozóüzemükbe. „A kezdeményezés egyre népszerűbb, a lakossági leadóhelyekről tíz évvel ezelőtt 80-100 tonna használt olajat gyűjtöttünk be, 2020-ban már 500 tonnát, 2021-ben tovább nőtt ez a mennyiség közel 600 tonnára” – említette a Biofilter marketingvezetője, majd hozzáfűzte, hogy honlapjukon is rá lehet keresni a legközelebbi gyűjtőpontokra. \r\nHogyan kell helyesen begyűjteni?\r\n\r\n„Ha már sütésre nem használható az étolaj, aminek színe és szaga is utal erre, kihűlve egy tölcsér segítségével vagy a saját flakonjába, vagy egy üres ásványvizes PET-palackba töltsük bele, jól zárjuk rá a tetejét, és vigyük a feltüntetett lerakók egyikébe” – tanácsolta a feldolgozóüzem munkatársa, ugyanis a jó szándék ellenére gyakran előfordul, hogy valaki műanyag zacskóba, üvegbe töltve dobja ki a konténerbe, illetve nem zárja le megfelelően az edényt, és kifolyik a tartalma.', '04_ujrahasznosithato_a_sutoolaj.jpg'),
(5, 1, '2023-06-19', 'Változások a hulladékgazdálkodási közszolgáltatásban 2023. július 1-től', 'Tisztelt Ingatlanhasználók!\r\n\r\n2023. július 1-től a hulladékgazdálkodás jelenlegi rendszerét egy központosított hulladékgazdálkodási rendszer váltja fel. A feladatokat koncesszió keretében a MOL-csoport részeként létrejött MOHU MOL Hulladékgazdálkodási Zrt. fogja ellátni az egész országra kiterjedően.\r\n\r\nA koncesszió részeként 2023. július 1-től a BMH Nonprofit Kft., mint a Borsod-Abaúj-Zemplén vármegyében hulladékgazdálkodási közszolgáltatási feladat ellátására kijelölt szervezet a közszolgáltatással egybefüggő tevékenységét befejezi.\r\n\r\n2023. július 1-től a szolgáltatási területen a MiReHu Nonprofit Kft., a Zempléni Z.H.K. Nonprofit Kft. és a ZV Zöld Völgy Nonprofit Kft. fogja ellátni a hulladékgazdálkodási tevékenységet, így az átállást követően kizárólag a fenti szervezeteknek van lehetősége a megkereséseket fogadni, illetve azok felülvizsgálatát lefolytatni személyesen, elektronikusan vagy postai úton.\r\n\r\n2023. július 1-től a MiReHu Nonprofit Kft. szolgáltatási területéhez tartozó települések:\r\n\r\nAlsózsolca, Ároktő, Bogács, Borsodgeszt, Borsodivánka, Bükkábrány, Bükkaranyos, Bükkszentkereszt, Bükkzsérc, Cserépfalu, Cserépváralja, Csincse, Egerlövő, Emőd, Gelej, Harsány, Hejőbába, Hejőkeresztúr, Hejőkürt, Hejőpapi, Hejőszalonta, Igrici, Kács, Kisgyőr, Kistokaj, Mályi, Mezőcsát, Mezőkeresztes, Mezőkövesd, Mezőnagymihály, Mezőnyárád, Miskolc, Muhi, Nagycsécs, Négyes, Nemesbikk, Nyékládháza, Ónod, Oszlár, Répáshuta, Sajólád, Sajóörös, Sajópetri, Sajószöged, Sály, Szakáld, Szentistván, Szirmabesenyő, Szomolya, Tard, Tibolddaróc, Tiszabábolna, Tiszadorogma, Tiszakeszi, Tiszapalkonya, Tiszatarján, Tiszavalk, Vatta\r\n\r\n2023. július 1-től a Zempléni Z.H.K. Nonprofit Kft. szolgáltatási területéhez tartozó települések:\r\n\r\nAbaújalpár, Abaújkér, Abaújszántó, Abaújvár, Alsógagy, Alsóregmec, Arka, Baktakék, Baskó, Bekecs, Beret, Bodrogkeresztúr, Bodrogkisfalud, Bodrogolaszi, Boldogkőújfalu, Boldogkőváralja, Bózsva, Büttös, Csenyéte, Csobád, Csobaj, Detek, Encs, Erdőbénye, Erdőhorváti, Fáj, Fancsal, Felsődobsza, Felsőgagy, Felsőregmec, Filkeháza, Fony, Forró, Fulókércs, Füzér, Füzérkajata, Füzérkomlós, Füzérradvány, Gagyapáti, Gagybátor, Gagyvendégi, Garadna, Gibárt, Girincs, Golop, Gönc, Göncruszka, Halmaj, Háromhuta, Hejce, Hercegkút, Hernádbűd, Hernádcéce, Hernádkércs, Hernádpetri, Hernádszentandrás, Hernádszurdok, Hernádvécse, Hidasnémeti, Hollóháza, Ináncs, Kány, Kázsmárk, Kéked, Kenézlő, Keresztéte, Kesznyéten, Kiscsécs, Kishuta, Kiskinizs, Komlóska, Korlát, Kovácsvágás, Köröm, Krasznokvajda, Legyesbénye, Léh, Litka, Mád, Makkoshotyka, Megyaszó, Méra, Mezőzombor, Mikóháza, Mogyoróska, Monok, Nagyhuta, Nagykinizs, Novajidrány, Nyíri, Olaszliszka, Pálháza, Pamlény, Pányok, Pere, Perecse, Prügy, Pusztafalu, Pusztaradvány, Rásonysápberencs, Rátka, Regéc, Sajóhídvég, Sárazsadány, Sárospatak, Sátoraljaújhely, Sima, Szalaszend, Szászfa, Szegi, Szegilong, Szemere, Szentistvánbaksa, Szerencs, Taktabáj, Taktaharkány, Taktakenéz, Taktaszada, Tállya, Tarcal, Telkibánya, Tiszaladány, Tiszalúc, Tiszatardos, Tiszaújváros, Tokaj, Tolcsva, Tornyosnémeti, Vágáshuta, Vajdácska, Vámosújfalu, Vilmány, Vilyvitány, Viss, Vizsoly, Zalkod, Zsujta\r\n\r\n2023. július 1-től a ZV Zöld Völgy Nonprofit Kft. szolgáltatási területéhez tartozó települések:\r\n\r\nAbaújlak, Abaújszolnok, Abod, Aggtelek, Alacska, Alsódobsza, Alsószuha, Alsótelekes, Alsóvadász, Arló, Arnót, Aszaló, Balajt, Bánhorváti, Bánréve, Becskeháza, Berente, Berzék, Bódvalenke, Bódvarákó, Bódvaszilas, Boldva, Borsodbóta, Borsodnádasd, Borsodszentgyörgy, Borsodszirák, Bőcs, Bükkmogyorósd, Csernely, Csokvaomány, Damak, Debréte, Dédestapolcsány, Domaháza, Dövény, Dubicsány, Edelény, Égerszög, Farkaslyuk, Felsőkelecsény, Felsőnyárád, Felsőtelekes, Felsővadász, Felsőzsolca, Gadna, Galvács, Gesztely, Gömörszőlős, Hangács, Hangony, Hegymeg, Hernádkak, Hernádnémeti, Hét, Hidvégardó, Homrogd, Imola, Irota, Izsófalva, Jákfalva, Járdánháza, Jósvafő, Kánó, Kazincbarcika, Kelemér, Királd, Kissikátor, Komjáti, Kondó, Kupa, Kurityán, Ládbesenyő, Lak, Lénárddaróc, Mályinka, Martonyi, Meszes, Monaj, Múcsony, Nagybarca, Nekézseny, Nyésta, Nyomár, Onga, Ormosbánya, Ózd, Parasznya, Perkupa, Putnok, Radostyán, Ragály, Rakaca, Rakacaszend, Rudabánya, Rudolftelep, Sajóbábony, Sajóecseg, Sajógalgóc, Sajóivánka, Sajókápolna, Sajókaza, Sajókeresztúr, Sajólászlófalva, Sajómercse, Sajónémeti, Sajópálfala, Sajópüspöki, Sajósenye, Sajószentpéter, Sajóvámos, Sajóvelezd, Sáta, Selyeb, Serényfalva, Sóstófalva, Szakácsi, Szalonna, Szendrő, Szendrőlád, Szikszó, Szin, Szinpetri, Szögliget, Szőlősardó, Szuhafő, Szuhakálló, Szuhogy, Tardona, Teresztenye, Tomor, Tornabarakony, Tornakápolna, Tornanádaska, Tornaszentandrás, Tornaszentjakab, Trizs, Újcsanálos, Uppony, Vadna, Varbó, Varbóc, Viszló, Zádorfalva, Ziliz, Zubogy\r\n\r\nTájékoztatjuk Önöket, hogy a ZV Zöld Völgy Nonprofit Kft. személyes ügyfélszolgálati irodái 2023. július 3-án és július 4-én technikai okok miatt zárva tartanak.', '05_valtozas_hulladekudvar_szolgaltatas.jpg');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `komment`
--

CREATE TABLE `komment` (
  `szerzoid` int(11) UNSIGNED NOT NULL,
  `hirid` int(11) UNSIGNED NOT NULL,
  `datum` datetime NOT NULL,
  `tartalom` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- A tábla adatainak kiíratása `komment`
--

INSERT INTO `komment` (`szerzoid`, `hirid`, `datum`, `tartalom`) VALUES
(4, 2, '2019-11-08 12:10:23', 'Mindenki menjen a sunyiba! Oldják meg, a veszélyes hulladék csak gyűlik, így is kevés helyen lehet leadni!'),
(2, 1, '2019-08-18 10:23:42', 'Azt gondolná az ember, hogy ezek a nyagy cége rég megoldották maguknak a hulladékelszállítást, erre kiderül, hogy a lakossági lerakóba viszik, ráadásul nagytételben.'),
(5, 2, '2019-11-09 11:34:21', 'Az hogy miért nem tudnak átvenni többet érthető, de talán gondoskodhattak volna valami vésztervről ilyen esetkre.'),
(3, 1, '2019-08-18 10:45:32', 'Nyilván nem egyszerű egy nagy cégnek a szemét eltávolítása, főleg ha az veszélyes hulladék, de talán a 21. században ez már megoldhatónak kellene lennie.'),
(6, 1, '2019-08-18 14:12:54', 'Főleg, hogy az ilyesmire előírásnak kellene lennie, nem jól gondolom?!'),
(1, 3, '2022-09-24 13:54:11', 'Azért azt jó tudni, hogy 4 alkalommal még használhatok egy olajat, persze megfelelő gondozás mellett. Hasznos infó volt az is, hogy milyen környezetrongáló hatásai vannak.'),
(2, 3, '2022-09-24 14:20:21', 'Hogy milyen környezetrongáló hatásai vannak, azt tudjuk, de hogy mire lehet házilag felhasználni azt nem igazán tudom elképzelni. Erről is írhatnának valamit.'),
(6, 4, '2022-10-16 18:22:10', 'Azért nem biztos, hogy mindenkinek van a közelében egy nagy forgalmú benzinkút, más helyen is átvehetnék az ilyesmit.'),
(10, 4, '2022-10-17 09:10:23', 'Már 10 éve le lehet adni? Nem is tudtam. Mi is a kutakon adjuk le mindig.'),
(9, 4, '2022-10-17 12:00:43', 'Megnyugtató, hogy egyre nő a tudatos ember száma, akik leadják az olajakat ahelyett hogy a kukába dobnák.'),
(8, 4, '2022-10-18 10:11:34', 'Nagyon helyes, biodízel kell nekünk, meg biogáz.');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `menu`
--

CREATE TABLE `menu` (
  `url` varchar(30) NOT NULL,
  `nev` varchar(30) NOT NULL,
  `szulo` varchar(30) NOT NULL,
  `jogosultsag` varchar(3) NOT NULL,
  `sorrend` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- A tábla adatainak kiíratása `menu`
--

INSERT INTO `menu` (`url`, `nev`, `szulo`, `jogosultsag`, `sorrend`) VALUES
('admin', 'Admin', '', '001', 80),
('alapinfok', 'Alapinfók', '', '111', 20),
('arfolyam', 'Árfolyam', '', '111', 90),
('belepes', 'Belépés', '', '100', 60),
('elerhetoseg', 'Elérhetőség', 'alapinfok', '111', 40),
('hirek', 'Hírek', '', '111', 100),
('kiegeszitesek', 'Kiegészítések', 'alapinfok', '011', 50),
('kilepes', 'Kilépés', '', '011', 70),
('linkek', 'Linkek', '', '100', 30),
('nyitolap', 'Nyitólap', '', '111', 10),
('soap_kliens', 'Telephelyek', 'alapinfok', '111', 110);

--
-- Indexek a kiírt táblákhoz
--

--
-- A tábla indexei `fajta`
--
ALTER TABLE `fajta`
  ADD PRIMARY KEY (`id`);

--
-- A tábla indexei `felhasznalok`
--
ALTER TABLE `felhasznalok`
  ADD PRIMARY KEY (`id`);

--
-- A tábla indexei `gyujt`
--
ALTER TABLE `gyujt`
  ADD KEY `fajtaid` (`fajtaid`),
  ADD KEY `helyid` (`helyid`);

--
-- A tábla indexei `hely`
--
ALTER TABLE `hely`
  ADD PRIMARY KEY (`id`);

--
-- A tábla indexei `hirek`
--
ALTER TABLE `hirek`
  ADD PRIMARY KEY (`id`),
  ADD KEY `szerzoid` (`szerzoid`);

--
-- A tábla indexei `komment`
--
ALTER TABLE `komment`
  ADD KEY `szerzoid` (`szerzoid`,`hirid`),
  ADD KEY `hirid` (`hirid`);

--
-- A tábla indexei `menu`
--
ALTER TABLE `menu`
  ADD PRIMARY KEY (`url`);

--
-- A kiírt táblák AUTO_INCREMENT értéke
--

--
-- AUTO_INCREMENT a táblához `fajta`
--
ALTER TABLE `fajta`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT a táblához `felhasznalok`
--
ALTER TABLE `felhasznalok`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT a táblához `hely`
--
ALTER TABLE `hely`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT a táblához `hirek`
--
ALTER TABLE `hirek`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Megkötések a kiírt táblákhoz
--

--
-- Megkötések a táblához `gyujt`
--
ALTER TABLE `gyujt`
  ADD CONSTRAINT `gyujt_ibfk_1` FOREIGN KEY (`fajtaid`) REFERENCES `fajta` (`id`),
  ADD CONSTRAINT `gyujt_ibfk_2` FOREIGN KEY (`helyid`) REFERENCES `hely` (`id`);

--
-- Megkötések a táblához `hirek`
--
ALTER TABLE `hirek`
  ADD CONSTRAINT `hirek_ibfk_1` FOREIGN KEY (`szerzoid`) REFERENCES `felhasznalok` (`id`);

--
-- Megkötések a táblához `komment`
--
ALTER TABLE `komment`
  ADD CONSTRAINT `komment_ibfk_1` FOREIGN KEY (`szerzoid`) REFERENCES `felhasznalok` (`id`),
  ADD CONSTRAINT `komment_ibfk_2` FOREIGN KEY (`hirid`) REFERENCES `hirek` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
