<div class="doboz">
    <div class="telep">
        <form name="hulladekudvarok" action="<?= SITE_ROOT ?>nyitolap/soap_kliens" method="post">
            <select name='fajta' onchange="javascript:hulladekudvarok.submit();">
                <option value="">-- összes hulladékudvar --</option>
                <?php foreach ($viewData['fajtak'] as $fajta): ?>
                    <option value="<?= $fajta['nev'] ?>" <?php if ($fajta['nev'] === $viewData['selected_fajta']) echo 'selected'?>><?= $fajta['nev'] ?></option>
                <?php endforeach; ?>
            </select>
        </form>

        <table>
            <caption>Lerakóhelyek hulladékfajták szerint</caption>
            <thead>
                <tr>
                    <th>#</th>
                    <th>Kerület</th>
                    <th>Cím</th>
                </tr>
            </thead>
            <tbody>
                <?php foreach ($viewData['helyek'] as $hely): ?>
                    <tr>
                        <td><?= $hely['id'] ?></td>
                        <td><?= $hely['kerulet'] ?></td>
                        <td><?= $hely['cim'] ?></td>
                    </tr>
                <?php endforeach; ?>
            </tbody>
        </table>
    </div>
    <div class="kep">
        <img src="<?= SITE_ROOT . 'images/bp_keruletek.jpg' ?>"/>
    </div>
</div>