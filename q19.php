<?php

class Technician {

    private string $name;
    private Technician $superior;
    private array $subordinates = [];

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

    public function getSuperior(): Technician
    {
        return $this->superior;
    }

    public function setSuperior(?Technician $superior): self
    {
        $this->superior = $superior;
        return $this;
    }

    public function getSubordinates(): array
    {
        return $this->subordinates;
    }

    public function addSubordinate(Technician $subordinate): self
    {
        if(!array_search($subordinate, $this->subordinates) && ($subordinate !== $this))
        {
            array_push($this->subordinates, $subordinate);
            $subordinate->setSuperior($this);
        }
        return $this;
    }

    public function delSubordinate(Technician $subordinate): self
    {
        $key = array_search($subordinate, $this->subordinates);
        if($key)
        {
            unset($this->subordinates[$key]);
            $subordinate->setSuperior(null);
        }
        return $this;
    }
}

$mario = new Technician('mario');
$luigi = new Technician('luigi');
$peach = new Technician('peach');
$toad = new Technician('toad');
$yoshi = new Technician('yoshi');
$bowser = new Technician('bowser');

$peach->addSubordinate($toad);
$toad->addSubordinate($mario)->addSubordinate($luigi);
$mario->addSubordinate($yoshi);
var_dump($peach);
var_dump($toad);
var_dump($mario);
var_dump($luigi);
var_dump($yoshi);
var_dump($bowser);

$bowser->addSubordinate($bowser);