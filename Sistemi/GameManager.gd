extends Node2D

#riferimento all'enemy spawner
@export var ES : Node
#riferimento al mazzo 
@export var Mazzo : Node

@export var UI : Node

var MaxHPgiocatore : int = 10 :
	set(Mhp): 
		MaxHPgiocatore = Mhp 
		UI.HP.text = "HP \n" + str(HPgiocatore)  + "/" + str(MaxHPgiocatore)

var HPgiocatore : int = 10 : 
	set(hp): 
		HPgiocatore = hp 
		if HPgiocatore <= 0:
			#vai a scena di game over. 
			pass
		elif HPgiocatore > MaxHPgiocatore:
			HPgiocatore = MaxHPgiocatore
		UI.HP.text = "HP \n" + str(HPgiocatore) + str(MaxHPgiocatore)

var MaxHPnemico : int = 10 : 
	set(nhpnem) :
		MaxHPnemico = nhpnem
		if HPnemico > MaxHPnemico:
			HPnemico = MaxHPnemico

var HPnemico : int = 10 :
	set(nhpnem): 
		HPnemico = nhpnem
		if HPnemico <= 0:
			victory()
		elif HPnemico > MaxHPnemico:
			HPnemico = MaxHPnemico
		#modifica UI

var turno : bool = 0 : 
	set(nturno):
		if turno:
			pass
		else:
			pass
		turno = nturno
	get:
		return turno
		

@export var quantita_wave : int = 5

var fase : bool = 0 #0 per preparazione, 1 per comabttimento

var unit_amount : int = 0 :
	set(namnt):
		unit_amount = namnt
		if fase and unit_amount < 0:
			prossima_fase()
		print(unit_amount)

var current_turn : int = 0

func _ready():
	ES.Spawn_wave(turno)
	current_turn += 1
	if current_turn > quantita_wave:
		victory()

func prossimo_turno():
	turno = !turno

func prossima_fase():
	fase = !fase
	if fase: #combattimento
		get_tree().call_group("Entity","on_next_phase",fase)
		Mazzo.on_next_phase(fase)
		UI.lock = true
	else: #preparazione
		ES.Spawn_wave(turno)
		prossimo_turno()
		Mazzo.draw(3)
		get_tree().call_group("Entity","on_next_phase",fase)
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
	pass
	#cambia livello

func defeat():
	pass
	#porta alla scena di defeat
