<div class="userRoutes form">
<?php echo $this->Form->create('UserRoute'); ?>
	<fieldset>
		<legend><?php echo __('Add User Route'); ?></legend>
	<?php
		echo $this->Form->input('user_id');
		echo $this->Form->input('name');
	?>
	</fieldset>
<?php echo $this->Form->end(__('Submit')); ?>
</div>
<div class="actions">
	<h3><?php echo __('Actions'); ?></h3>
	<ul>

		<li><?php echo $this->Html->link(__('List User Routes'), array('action' => 'index')); ?></li>
	</ul>
</div>
