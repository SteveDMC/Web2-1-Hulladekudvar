<div>
    <form action="<?= SITE_ROOT ?>arfolyam" method="post">
        <?php foreach (range(1, 2) as $idx): ?>
            <select name="currency<?= $idx ?>">
                <?php foreach ($viewData['currencies'] as $currency): ?>
                    <option value="<?= $currency ?>" <?php if ($currency === $viewData['currency'.$idx]) echo 'selected'?>><?= $currency ?></option>
                <?php endforeach; ?>
            </select>
        <?php endforeach; ?>
        <input type="date" name="given_day" min="<?= $viewData['first_date'] ?>" max="<?= $viewData['last_date'] ?>" value="<?= $viewData['given_day']?>" required>
        <button type="submit">Lekérdez</button>
    </form>
    <div>
        <?php if ($viewData['daily_rate']): ?>
            1 <?= $viewData['currency1'] ?> = <?= number_format($viewData['daily_rate'], 4) ?> <?= $viewData['currency2'] ?>
        <?php endif; ?>
    </div>
</div>
