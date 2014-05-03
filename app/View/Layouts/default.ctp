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
<html>
<head>
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
<body>
    <div class="container" style="margin-top: 20px">
            <?php echo $this->element('global_header'); ?>
            <?php echo $this->fetch('content'); ?>
    </div>
</body>
</html>
