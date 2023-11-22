<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <title>Hulladékudvar - MVC</title>
        <link rel="stylesheet" type="text/css" href="<?php echo SITE_ROOT?>css/main_style.css">
        <?php if($viewData['style']) echo '<link rel="stylesheet" type="text/css" href="'.$viewData['style'].'">'; ?>
    </head>
    <body>
        <header>
            <h1 class="header">Hulladékudvar - MVC alkalmazás</h1>
            <?php if ($_SESSION['userid']): ?>
                <div id="user">Bejelentkezett: <em><?= $_SESSION['userlastname']." ".$_SESSION['userfirstname'] ?> (<?= $_SESSION['nickname'] ?>)</em></div>
            <?php endif; ?>
        </header>
        <nav>
            <?php echo Menu::getMenu($viewData['selectedItems']); ?>
        </nav>
        <section>
            <?php if($viewData['render']) include($viewData['render']); ?>
        </section>

        <footer>&copy; NJE - GAMF - Informatika Tanszék <?= date("Y") ?></footer>
    </body>
</html>
