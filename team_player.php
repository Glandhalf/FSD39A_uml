<?php

class Team {

    private string $name;
    private array $players = [];

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

    public function addPlayer(Player $player)
    {
        if(count($this->players) < 6){
            if(!array_search($player, $this->players))
            {
                array_push($this->players, $player);
            }
        }
        return $this;
    }

    public function delPlayer(Player $player)
    {
        $key = array_search($player, $this->players);
        if($key)
        {
            unset($this->players[$key]);
        }
        return $this;
    }
}

class Player {
    private string $name;
    private Team $team;

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

    public function getTeam(): Team
    {
        return $this->team;
    }

    public function setTeam(Team $team): self
    {
        $this->team->delPlayer($this);
        $this->team = $team;
        $team->addPlayer($this);
        return $this;
    }
}