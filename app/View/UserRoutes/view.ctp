<div class="userRoutes view">
<h2><?php echo __('User Route'); ?></h2>
	<dl>
		<dt><?php echo __('Id'); ?></dt>
		<dd>
			<?php echo h($userRoute['UserRoute']['id']); ?>
			&nbsp;
		</dd>
		<dt><?php echo __('User'); ?></dt>
		<dd>
			<?php echo $this->Html->link($userRoute['User']['id'], array('controller' => 'users', 'action' => 'view', $userRoute['User']['id'])); ?>
			&nbsp;
		</dd>
		<dt><?php echo __('Name'); ?></dt>
		<dd>
			<?php echo h($userRoute['UserRoute']['name']); ?>
			&nbsp;
		</dd>
	</dl>
</div>
<div class="actions">
	<h3><?php echo __('Actions'); ?></h3>
	<ul>
		<li><?php echo $this->Html->link(__('Edit User Route'), array('action' => 'edit', $userRoute['UserRoute']['id'])); ?> </li>
		<li><?php echo $this->Form->postLink(__('Delete User Route'), array('action' => 'delete', $userRoute['UserRoute']['id']), null, __('Are you sure you want to delete # %s?', $userRoute['UserRoute']['id'])); ?> </li>
		<li><?php echo $this->Html->link(__('List User Routes'), array('action' => 'index')); ?> </li>
		<li><?php echo $this->Html->link(__('New User Route'), array('action' => 'add')); ?> </li>
		<li><?php echo $this->Html->link(__('List Users'), array('controller' => 'users', 'action' => 'index')); ?> </li>
		<li><?php echo $this->Html->link(__('New User'), array('controller' => 'users', 'action' => 'add')); ?> </li>
	</ul>
</div>
