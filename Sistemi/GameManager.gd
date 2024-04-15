extends Node2D

#riferimento all'enemy spawner
@export var ES : Node
#riferimento al mazzo 
@export var Mazzo : Node

@export var UI : Node

@export var saveload : Node 

@export var current_level = 1

var MaxHPgiocatore : int = 10 :
	set(Mhp): 
		MaxHPgiocatore = Mhp 
		UI.HP.text = "HP \n" + str(HPgiocatore)  + "/" + str(MaxHPgiocatore)

var HPgiocatore : int = 10 : 
	set(hp): 
		HPgiocatore = hp 
		if HPgiocatore <= 0:
			defeat()
		elif HPgiocatore > MaxHPgiocatore:
			HPgiocatore = MaxHPgiocatore
		UI.HP.text = "HP \n" + str(HPgiocatore) + "/" +str(MaxHPgiocatore)

var MaxHPnemico : int = 10 : 
	set(nhpnem) :
		MaxHPnemico = nhpnem
		if HPnemico > MaxHPnemico:
			HPnemico = MaxHPnemico
		UI.HPnemico.text = "HP \n" + str(HPnemico)  + "/" + str(MaxHPnemico)

var HPnemico : int = 10 :
	set(nhpnem): 
		HPnemico = nhpnem
		if HPnemico <= 0:
			victory()
		elif HPnemico > MaxHPnemico:
			HPnemico = MaxHPnemico
		UI.HPnemico.text = "Enemy HP \n" + str(HPnemico)  + "/" + str(MaxHPnemico)

var turno : bool = 0 : 
	set(nturno):
		if turno:
			pass
		else:
			pass
		turno = nturno
	get:
		return turno
		

var fase : bool = 0 #0 per preparazione, 1 per combattimento

var unit_amount : int = 0 :
	set(namnt):
		unit_amount = namnt
		if fase and unit_amount <= 0:
			prossima_fase()


var current_turn : int = 0 :
		set(nturn):
			current_turn = nturn
			if current_turn >= ES.Waves.size():
				victory()

func _ready():
	ES.Spawn_wave(current_turn)
	saveload.save_game(current_level)

func prossimo_turno():
	current_turn+=1
	turno = !turno

func prossima_fase():
	fase = !fase
	$Switch.play()
	if fase: #combattimento
		get_tree().call_group("Entity","on_next_phase",fase)
		Mazzo.on_next_phase(fase)
		UI.lock = true
	else: #preparazione
		prossimo_turno()
		Mazzo.on_next_phase(fase)
		get_tree().call_group("Entity","on_next_phase",fase)
		ES.Spawn_wave(current_turn)
		UI.lock = false

#func set_Maxanime(maxa):
	#Maxanime = maxa
	#UI.Mana.text = "Mana \n" + str(Anime) + str(Maxanime)

func damagearea_entered(body):
	#contralla se e un entita
	if body is Entity:
	#controlla a chi appartiene
		if body.is_player == false: 
			HPgiocatore -= body.damage_to_opponent #cambia il valore in base agli HP o a qualcos'altro 
		else:
			HPnemico -= body.damage_to_opponent
		body.queue_free()

func victory():
	match current_level:
		1:
			get_tree().change_scene_to_packed(load("res://Map/Livelli/Livello2.tscn"))
		2:
			get_tree().change_scene_to_packed(load("res://Map/Livelli/Livello3.tscn"))
		3:
			get_tree().change_scene_to_packed(load("res://Scenes/Victory/victory.tscn"))

func defeat():
	get_tree().change_scene_to_packed(load("res://Scenes/Game_Over/Game_over.tscn"))
