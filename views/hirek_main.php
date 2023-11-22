<div class="cimsor">
    <div class="nev"><h2>Hírek</h2></div>
    <div class="vak"><?php if ($_SESSION['userid']): ?>
            <a href="<?= SITE_ROOT . 'hir_uj' ?>">
            <button class="gomb">Új hír létrehozása</button></a>
        <?php endif; ?>
    </div>
</div>

<div class="hirek">
    <?php foreach ($viewData['hirek'] as $hir): ?>
        <a href="<?= SITE_ROOT . 'hir/' . $hir['id'] ?>">
            <div class="hir">
                <div class="kep"><img src="<?= SITE_ROOT . 'images/' . $hir['kep'] ?>"/></div>
                <div class="cim">
                    <h2><?= $hir['cim'] ?></h2>
                    <p><?= substr($hir['tartalom'], 0, 200) ?></b>...</p>
                </div>
            </div>
        </a>
    <?php endforeach; ?>
</div>