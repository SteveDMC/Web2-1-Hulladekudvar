<?php
    $hir = $viewData['hir'];
?>
<?php if ($hir): ?>
    <div class="hir_edit">
    <h2>Hír szerkesztése</h2>
    <form action="<?= SITE_ROOT ?>hir_update" method="post">
        <div class="szerzo">
            <input name="id" value="<?= $hir['id'] ?>" type="hidden">
            <input name="szerzoid" value="<?= $_SESSION['userid'] ?>" type="hidden">
        </div>
        <div class="cim">
            <div class="lab"><label for="cim">Hír címe:</label></div>
            <div class="in"><input name="cim" value="<?= $hir['cim'] ?>" required></div>
        </div>
        <div class="tart">
            <div class="lab"><label for="tartalom">Tartalma:</label></div>
            <div class="in"><textarea name="tartalom" rows="20" required><?= $hir['tartalom'] ?></textarea></div>
        </div>
        <div class="kep">
            <div class="lab"><label for="kep">Kép hozzáadása:</label></div>
            <div class="in"><input name="kep" value="<?= $hir['kep'] ?>" required></div>
        </div>
        <button type="submit">Mentés</button>
    </form>
</div>  
<?php else: ?>
    <div style="text-align: center">
        <br><h2 style="font-size: 5em">404</h2>
        Hiba<br>
        <br>Nincs ilyen hír!<br>
    </div>
<?php endif; ?>