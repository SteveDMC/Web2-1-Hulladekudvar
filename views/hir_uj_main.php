<h2><?= (isset($viewData['uzenet']) ? $viewData['uzenet'] : "") ?></h2>

<div class="hir_uj">
    <h2>Új hír írása</h2>
    <form action="<?= SITE_ROOT ?>hir_add" method="post" enctype="multipart/form-data">
        <div class="szerzo">
            <input name="szerzoid" value="<?= $_SESSION['userid'] ?>" type="hidden">
        </div>
        <div class="cim">
            <div class="lab"><label for="cim">Hír címe:</label></div>
            <div class="in"><input name="cim" required></div>
        </div>
        <div class="tart">
            <div class="lab"><label for="tartalom">Tartalma:</label></div>
            <div class="in"><textarea name="tartalom" rows="20" required></textarea></div>
        </div>
        <div class="kep">
            <div class="lab"><label for="kep">Kép hozzáadása:</label></div>
            <div class="in"><input name="kep" type="file" accept="image/*" required></div>
        </div>
        <button type="submit">Mentés</button>
    </form>
</div>