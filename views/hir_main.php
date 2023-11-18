<?php
    $hir = $viewData['hir'];
?>
<?php if ($hir): ?>
    <div class="hir">
        <div class="cim"><h2><?= $hir['cim'] ?></h2></div>
        <div class="kep"><img src="<?= SITE_ROOT . 'images/' . $hir['kep'] ?>"/></div>
        <div class="szerzo"><?= $hir['szerzoid'] ?></div>
        <div class="datum"><?= $hir['datum'] ?></div>
        <div class="tartalom"><?= $hir['tartalom'] ?></div>
    </div>
    <div class="kommentek">
        <?php if ($_SESSION['userid']): ?>
            <div class="uj-komment">
                <form action="<?= SITE_ROOT ?>komment" method="post">
                    <input name="szerzoid" value="<?= $_SESSION['userid'] ?>" type="hidden">
                    <input name="hirid" value="<?= $hir['id'] ?>" type="hidden">
                    <textarea name="tartalom" placeholder="Komment írása" required></textarea>
                    <button type="submit">Küldés</button>
                </form>
            </div>
        <?php endif; ?>
        <?php foreach ($viewData['kommentek'] as $komment): ?>
            <div class="komment">
                <div class="szerzo"><?= $komment['bejelentkezes'] ?></div>
                <div class="datum"><?= $komment['datum'] ?></div>
                <div class="tartalom">
                    <?= $komment['tartalom'] ?>
                </div>
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
