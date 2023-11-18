<div class="hir">
    <div class="cim"><h2><?= $hir['cim'] ?></h2></div>
    <div class="kep"><img src="<?= SITE_ROOT . 'images/' . $hir['kep'] ?>"/></div>
    <div class="szerzo"><?= $hir['szerzoid'] ?></div>
    <div class="datum"><?= $hir['datum'] ?></div>
    <div class="tartalom"><?= $hir['tartalom'] ?></div>
</div>
<div class="kommentek">
    <?php foreach ($viewData['kommentek'] as $komment): ?>
        <a href="">
            <div class="komment">
                <div class="szerzo"><?= $komment['szerzoid'] ?></div>
                <div class="datum"><?= $komment['datum'] ?></div>
                <div class="tartalom"><?= $komment['tartalom'] ?></div>
            </div>
        </a>
    <?php endforeach; ?>
</div>