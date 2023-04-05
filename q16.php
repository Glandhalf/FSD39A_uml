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

    private string $ref;

    public function __construct(string $ref) 
    {
        $this->ref = $ref;
    }

    public function getRef(): string
    {
        return $this->ref;
    }

    public function setRef(string $ref): self
    {
        $this->ref = $ref;
        return $this;
    }
}

$spirou = new Waiter('spirou');
$fantasio = new Waiter('fantasio');

$t1 = new Table('404');
$t2 = new Table('666');
$t3 = new Table('118');
$t4 = new Table('218');
$t5 = new Table('000');
var_dump($t1);
var_dump($t2);
var_dump($spirou);

$fantasio->addTable($t1);
var_dump($fantasio);
$fantasio->addTable($t2)->addTable($t3)->addTable($t4)->addTable($t5);

