<?php
use backend\assets\AppAsset;
use yii\helpers\Html;
use yii\bootstrap\Nav;
use yii\bootstrap\NavBar;
use yii\widgets\Breadcrumbs;
use common\models\PermisosHelpers;
use backend\assets\FontAwesomeAsset;
/**
 * @var \yii\web\View $this
 * @var string $content
 */
?>

<?php $this->beginPage() ?>

    <!DOCTYPE html>

    <html lang="<?= Yii::$app->language ?>">

    <head>
        <meta charset="<?= Yii::$app->charset ?>"/>

        <meta name="viewport" content="width=device-width, initial-scale=1">

        <?= Html::csrfMetaTags() ?>

        <title><?= Html::encode($this->title) ?></title>

        <?php $this->head() ?>

    </head>

    <body>
    <?php $this->beginBody() ?>

    <div class="wrap">


        <?php
        if (!Yii::$app->user->isGuest){
            $es_admin = PermisosHelpers::requerirMinimoRol('Administrador');
            NavBar::begin([
                'brandLabel' => 'Yii 2 Built <i class="fa fa-plug"></i> Admin',
                'brandUrl' => Yii::$app->homeUrl,
                'options' => [
                    'class' => 'navbar-inverse navbar-fixed-top',
                ],
            ]);
        } else {
            NavBar::begin([
                'brandLabel' => 'Yii 2 Built <i class="fa fa-plug"></i>',
                'brandUrl' => Yii::$app->homeUrl,
                'options' => [
                    'class' => 'navbar-inverse navbar-fixed-top',
                ],
            ]);
        }
        if (Yii::$app->user->isGuest) {
            $menuItemsLogOut[] = ['label' => 'Login', 'url' => ['site/login']];
        } else {
            $menuItemsLogOut[] = [
                'label' => 'Logout (' . Yii::$app->user->identity->username . ')',
                'url' => ['/site/logout'],
                'linkOptions' => ['data-method' => 'post']
            ];
        }
        echo Nav::widget([
            'options' => ['class' => 'navbar-nav navbar-right'],
            'items' => $menuItemsLogOut
        ]);
        if (!Yii::$app->user->isGuest &&  $es_admin) {
            echo Nav::widget([
                'options' => ['class' => 'navbar-nav navbar-right'],
                'items' => [
                    ['label' => 'Users', 'items' => [
                        ['label' => 'Users', 'url' => ['user/index']],
                        ['label' => 'Perfiles', 'url' => ['perfil/index']],
                    ]],
                    ['label' => 'RBAC', 'items' => [
                        ['label' => 'Roles', 'url' => ['rol/index']],
                        ['label' => 'Tipos de Usuario', 'url' => ['tipo-usuario/index']],
                        ['label' => 'Estados', 'url' => ['estado/index']],
                    ]],
                ],
            ]);
        }
        $menuItems = [['label' => 'Home', 'url' => ['site/index']],
        ];
        echo Nav::widget([
            'options' => ['class' => 'navbar-nav navbar-right'],
            'items' => $menuItems
        ]);
        NavBar::end();
        ?>


        <div class="container">

            <?= Breadcrumbs::widget([
                'links' => isset($this->params['breadcrumbs']) ?
                    $this->params['breadcrumbs'] : [],
            ])?>

            <?= $content ?>

        </div>
    </div>

    <footer class="footer">

        <div class="container">

            <p class="pull-left">&copy; Yii 2 Build <?= date('Y') ?></p>

            <p class="pull-right"><?= Yii::powered() ?></p>

        </div>

    </footer>

    <?php $this->endBody() ?>

    </body>
    </html>

<?php $this->endPage() ?>