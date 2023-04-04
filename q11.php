<?php

class Technician {

    private string $name;
    private array $vehicules = [];

    public function __construct(string $name) {
        $this->name = $name;
    }

    public function addVehicule(?Vehicule $vehicule) : Technician {

        if(!array_search($vehicule, $this->vehicules)){
            array_push($this->vehicules, $vehicule);
            $vehicule->addTechnician($this);
        }
        return $this;
    }

    public function delVehicule(Vehicule $vehicule): Technician
    {
        $key = array_search($vehicule, $this->vehicules);
        if($key)
        {
            unset($this->vehicules[$key]);
            $vehicule->delTechnician($this);
        }
        return $this;
    }

    public function getVehicules() : array {
        return $this->vehicules;
    }
}


class Vehicule {

    private string $registerNumber;
    
    /**
     * @var array Les technicians
     */
    private array $technicians = [];

    public function __construct(string $registerNumber) {
        $this->registerNumber = $registerNumber;
    }
    
    /**
     * Add a technician
     */
    public function addTechnician(Technician $technician): Vehicule
    {
        array_push($this->technicians, $technician);
        return $this;
    }

    /**
     * Remove a technician
     */
    public function delTechnician(Technician $technician): Vehicule
    {
        $key = array_search($technician, $this->technicians);
        unset($this->technicians[$key]);
        return $this;
    }

    public function getTechnicians() : array {
        return $this->technicians;
    }
}



$vA = new Vehicule('AA-666-AA');
$vB = new Vehicule('BB-666-BB');
var_dump($vA);
var_dump($vB);
$paul = new Technician('Paul');
$juliette = new Technician('Juliette');
$jalila = new Technician('Jalila');
var_dump($paul);
var_dump($juliette);
var_dump($jalila);
$paul->addVehicule($vA);
$paul->addVehicule($vB);
$juliette->addVehicule($vA);
$jalila->addVehicule($vB);
var_dump($vA);
var_dump($vB);
$paul->delVehicule($vB);
var_dump($paul);
var_dump($vA);
var_dump($vB);