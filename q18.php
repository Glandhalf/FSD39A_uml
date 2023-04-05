<?php

class Waiter {

    private string $name;
    private array $tables = [];

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

    public function addTable(?Table $table) : Waiter | Exception{

        if(!array_search($table, $this->tables)){

            if(count($this->tables) < 4)
            {
                array_push($this->tables, $table);
                return $this;
            }else
            {
                throw new Exception('Pas plus de 4 tables par serveur');
            }
        }   
    }

    public function delTable(Table $table): Waiter
    {
        $key = array_search($table, $this->tables);
        if($key)
        {
            unset($this->tables[$key]);
        }
        return $this;
    }

    public function getTables() : array 
    {
        return $this->tables;
    }
}

class Table {

    private array $waiters = [];

    public function __construct(Waiter $waiter) 
    {
        $this->addWaiter($waiter);
    }

    public function addWaiter(?Waiter $waiter) : Table | Exception
    {
        if(!array_search($waiter, $this->waiters))
        {
            try
            {
                $waiter->addTable($this);
                array_push($this->waiters, $waiter);
                return $this;
            }catch(Exception $e)
            {
                throw $e;
            }
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
                $waiter->delTable($this);
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
$fantasio = new Waiter('fantasio');
$spip = new Waiter('spip');
$champignac = new Waiter('champignac');
$lagaffe = new Waiter('lagaffe');
$moizelleJeanne = new Waiter('moizelleJeanne');
$prunelle = new Waiter('prunelle');
$t1 = new Table($spirou);
$t2 = new Table($lagaffe);
$t3 = new Table($champignac);
$t4 = new Table($moizelleJeanne);
$t5 = new Table($prunelle);
var_dump($t1);
var_dump($t2);
var_dump($spirou);
var_dump($lagaffe);

$t2->addWaiter($fantasio);
var_dump($t2);
$t1->addWaiter($fantasio);
$t3->addWaiter($fantasio);
$t4->addWaiter($fantasio);
// $t5->addWaiter($fantasio);
// $t1->delWaiter($spirou);
