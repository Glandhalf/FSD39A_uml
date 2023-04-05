<?php

class Waiter {

    private string $name;

    public function __construct($name) {
        $this->name = $name;
    }

    public function getName(): string
    {
        return $this->name;
    }

    
    public function setName(string $name): self
    {
        $this->name = $name;
        return $this;
    }
}

class Table {

    private array $waiters = [];

    public function __construct(Waiter $waiter) 
    {
        $this->addWaiter($waiter);
    }

    public function addWaiter(?Waiter $waiter) : Table
    {
        if(!array_search($waiter, $this->waiters))
        {
            array_push($this->waiters, $waiter);
            return $this;
        }  
    }

    public function delWaiter(Waiter $waiter): Table | Exception
    {
        if(count($this->waiters) > 1)
        {
            $key = array_search($waiter, $this->waiters);
            if($key)
            {
                unset($this->waiters[$key]);
            }
            return $this;
        }else
        {
            throw new Exception('Une Table sans serveur, c\'est triste !');
        }
    }

    public function getWaiters() : array {
        return $this->waiters;
    }
}

$spirou = new Waiter('spirou');
$lagaffe = new Waiter('lagaffe');

$t1 = new Table($spirou);
$t2 = new Table($lagaffe);

var_dump($t1);
var_dump($t2);
var_dump($spirou);
var_dump($lagaffe);

$t2->addWaiter($lagaffe);
var_dump($t2);
// $t5->addWaiter($fantasio);
$t1->delWaiter($spirou);