<?php
/**
 *
 *
 * @link          http://cakephp.org CakePHP(tm) Project
 * @package       app.View.Layouts
 * @since         CakePHP(tm) v 0.10.0.1076
 */
?>
<!DOCTYPE html>
<html style="height: 100%">
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1">
	<?php echo $this->Html->charset(); ?>
	<title>
		Quick Bus
	</title>
	<?php
		echo $this->Html->meta('icon');

        echo $this->Html->css('bootstrap');
        echo $this->Html->css('leaflet');
        echo $this->Html->css('cake.paginator');
        
        echo $this->Html->script('jquery-1.11.0');

		echo $this->fetch('meta');
		echo $this->fetch('css');
		echo $this->fetch('script');
	?>
</head>
<body style="height: 100%; font-family: 'Microsoft YaHei',微软雅黑,宋体,Arial,sans-serif;">
    <div class="container-fluid" style="margin-left: 50px; margin-right: 50px; margin-top: -120px; height: 100%; padding: 120px 0 0 0;">
        <?php echo $this->fetch('content'); ?>
    </div>
</body>
</html>
