<?php
    $hir = $viewData['hir'];
?>
<?php if ($hir): ?>
    <div class="hir"><p>
        <div class="cim"><h2><?= $hir['cim'] ?></h2></div>
        <div class="vak"><?php if ($_SESSION['userid'] == $hir['szerzoid']): ?>
            <a href="<?= SITE_ROOT . 'hir_edit/' . $hir['id'] ?>">
            <button class="gomb">Szerkesztés</button></a>
        <?php endif; ?></div></p>
        <div class="kep"><img src="<?= SITE_ROOT . 'images/' . $hir['kep'] ?>"/></div>
        <div class="szerzo"><?= $hir['csaladi_nev'] ?> <?= $hir['utonev'] ?> (<?= $hir['bejelentkezes'] ?>)</div>
        <div class="datum"><?= $hir['datum'] ?></div>
        <div class="vonal1"></div>
        <div class="tartalom"><?= $hir['tartalom'] ?></div>
        <div class="pont">---</div>
    </div>
    <div class="kommentek">
        <?php if ($_SESSION['userid']): ?>
            <div class="vonal2"></div>
            <div class="uj-komment">
                <form action="<?= SITE_ROOT ?>komment" method="post">
                    <input name="szerzoid" value="<?= $_SESSION['userid'] ?>" type="hidden">
                    <input name="hirid" value="<?= $hir['id'] ?>" type="hidden">
                    <textarea name="tartalom" placeholder="Komment írása" rows="4" required></textarea>
                    <button type="submit">Küldés</button>
                </form>
            </div>                
        <?php endif; ?>
        <?php foreach ($viewData['kommentek'] as $komment): ?>
            <div class="komment">
                <div class="vonal3"></div>
                <div class="szerzo"><?= $komment['bejelentkezes'] ?></div>
                <div class="datum"><?= $komment['datum'] ?></div>
                <div class="tartalom"><?= $komment['tartalom'] ?></div>
            </div>
        <?php endforeach; ?>
    </div>
<?php else: ?>
    <div style="text-align: center">
        <br><h2 style="font-size: 5em">404</h2>
        Hiba<br>
        <br>Nincs ilyen hír!<br>
    </div>
<?php endif; ?>
