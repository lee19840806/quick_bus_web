<?php

class PagesController extends AppController
{
	public $components = array('Session');

    public function display()
    {
        $this->set('user', $this->Auth->user());
    }
}
