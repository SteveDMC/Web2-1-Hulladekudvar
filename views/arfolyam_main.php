<datalist id="years">
    <?php foreach ($viewData['years'] as $year): ?>
        <option value="<?= $year ?>"></option>
    <?php endforeach; ?>
</datalist>

<datalist id="months">
    <?php foreach ($viewData['months'] as $month): ?>
        <option value="<?= $month ?>"></option>
    <?php endforeach; ?>
</datalist>

<form action="<?= SITE_ROOT ?>arfolyam" method="post">
    <select name='type' onchange="toggle_inputs()">
        <?php foreach ($viewData['types'] as $type => $label): ?>
            <option value="<?= $type ?>" <?php if ($type === $viewData['selected_type']) echo 'selected'?>><?= $label ?></option>
        <?php endforeach; ?>
    </select>
    <?php foreach (range(1, 2) as $idx): ?>
        <select name="currency<?= $idx ?>">
            <?php foreach ($viewData['currencies'] as $currency): ?>
                <option value="<?= $currency ?>" <?php if ($currency === $viewData['currency'.$idx]) echo 'selected'?>><?= $currency ?></option>
            <?php endforeach; ?>
        </select>
        <?php if ($idx === 1): ?>
            <span onclick="swap_currency()" style="cursor: pointer;">&hArr;</span>
        <?php endif; ?>
    <?php endforeach; ?>
    <input type="date" name="given_day" min="<?= $viewData['first_date'] ?>" max="<?= $viewData['last_date'] ?>" value="<?= $viewData['given_day'] ?>">
    <input type="number" name="given_year" min="<?= min($viewData['years']) ?>" max="<?= max($viewData['years']) ?>" value="<?= $viewData['given_year'] ?>" list="years">
    <input type="number" name="given_month" min="<?= min($viewData['months']) ?>" max="<?= max($viewData['months']) ?>" value="<?= $viewData['given_month'] ?>" list="months">
    <button type="submit">Lekérdez</button>
</form>


<?php if ($viewData['daily_rate']): ?>
    <div>
        1 <?= $viewData['currency1'] ?> = <?= round($viewData['daily_rate'], 4) ?> <?= $viewData['currency2'] ?>
    </div>
<?php endif; ?>

<?php if ($viewData['monthly_rate']): ?>
    <table>
        <caption><?= $viewData['currency1'] ?> - <?= $viewData['currency2'] ?> árfolyam</caption>
        <thead>
            <tr>
                <td>Dátum</td>
                <td>Árfolyam az adott napon</td>
            </tr>
        </thead>
        <tbody>
            <?php foreach ($viewData['monthly_rate'] as $date => $rateAtDay): ?>
                <tr>
                    <td><?= $date ?></td>
                    <td><?= round($rateAtDay, 4) ?></td>
                </tr>
            <?php endforeach; ?>
        </tbody>
    </table>

    <canvas id="chart"></canvas>
<?php endif; ?>

<script>
    document.addEventListener("DOMContentLoaded", () => {
        toggle_inputs();
        init_chart();
    });

    function toggle_inputs() {
        const [type] = document.getElementsByName("type");
        const [given_day] = document.getElementsByName("given_day");
        const [given_year] = document.getElementsByName("given_year");
        const [given_month] = document.getElementsByName("given_month");

        if (type.value === 'daily') {
            enable(given_day);
            disable(given_year);
            disable(given_month);
        } else {
            disable(given_day);
            enable(given_year);
            enable(given_month);
        }
    }

    function enable(element) {
        element.required = true;
        element.style.display = 'inline-block';
    }

    function disable(element) {
        element.required = false;
        element.style.display = 'none';
    }

    function swap_currency() {
        const [c1] = document.getElementsByName("currency1");
        const [c2] = document.getElementsByName("currency2");
        [c1.value, c2.value] = [c2.value, c1.value];
    }

    function init_chart() {
        const ctx = document.getElementById('chart');
        if (ctx === null) {
            return;
        }

        const chart_data = <?= json_encode(array_reverse($viewData['monthly_rate'])) ?>;

        new Chart(ctx, {
            type: 'line',
            data: {
                labels: Object.keys(chart_data),
                datasets: [{
                    data: Object.values(chart_data),
                    label: "<?= $viewData['currency1'] ?> - <?= $viewData['currency2'] ?>",
                    tension: 0.1,
                }]
            }
        });
    }
</script>

<script src="https://cdn.jsdelivr.net/npm/chart.js@4.4.0/dist/chart.umd.min.js"></script>
