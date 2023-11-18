<h2>Hírek</h2>
<div class="hirek">
    <?php foreach ($viewData['hirek'] as $hir): ?>
        <a href="">
            <div class="hir">
                <div class="kep"><img src="<?= SITE_ROOT . 'images/' . $hir['kep'] ?>"/></div>
                <div class="cim">
                    <h2><?= $hir['cim'] ?></h2>
                    <p><?= substr($hir['tartalom'], 0, 400) ?>...</p>
                </div>
            </div>
        </a>
    <?php endforeach; ?>
    
</div>