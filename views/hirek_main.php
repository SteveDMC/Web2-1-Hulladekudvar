<h2>Hírek</h2>
<div class="hirek">
    <table>
        <thead>
            <tr>
                <th>Kép</th>
                <th>Cím</th>
            </tr>
        </thead>
        <tbody>
            <?php foreach ($viewData['hirek'] as $hir): ?>
                <tr>
                    <td><?= $hir['kep'] ?></td>
                    <td><?= $hir['cim'] ?></td>
                </tr>
            <?php endforeach; ?>
        </tbody>
    </table>
</div>