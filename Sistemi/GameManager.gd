extends Node2D

#riferimento all'enemy spawner
@export var ES : Node
#riferimento al mazzo 
@export var Mazzo : Node

@export var UI : Node

var MaxHPgiocatore : int = 10 :
	set(Mhp): set_MaxHPgiocatore(Mhp)
var HPgiocatore : int = 10 : 
	set(hp): set_hp(hp)

#var Maxanime : int = 5 :
	#set(maxa): set_Maxanime(maxa)
var Anime : int = 5 :
	set(nanime): set_anime(nanime)
var anime_turno : int = 5 

var MaxHPnemico : int = 10 : 
	set(nmaxhpn) : set_MaxHPnemico(nmaxhpn)
var HPnemico : int = 10 :
	set(nhpnem) : set_HPnemico(nhpnem)

var turno : bool = 0 : #0 per giocatore, 1 per nemico
	set(nturno):
		if turno:
			pass
		else:
			pass
		turno = nturno
	get:
		return turno

var fase : bool = 0 #0 per preparazione, 1 per comabttimento

var current_turn : int = 0

func prossimo_turno():
	turno = !turno

func prossima_fase():
	fase = !fase
	if fase: #combattimento
		ES.Spawn_wave(turno)
		get_tree().call_group("Entita","on_next_phase",fase)
		#impedisci al giocatore di giocare carte
		Mazzo.on_next_phase(fase)
	else: #preparazione
		prossimo_turno()
		Anime += anime_turno
		Mazzo.draw(3)
		ES.next_wave()
		get_tree().call_group("Entita","on_next_phase",fase)

func set_MaxHPgiocatore(Mhp):
	MaxHPgiocatore = Mhp 
	UI.HP.text = "HP \n" + str(HPgiocatore) + str(MaxHPgiocatore)

func set_hp(hp):
	HPgiocatore = hp 
	if HPgiocatore <= 0:
		#vai a scena di game over. 
		pass
	elif HPgiocatore > MaxHPgiocatore:
		HPgiocatore = MaxHPgiocatore
	UI.HP.text = "HP \n" + str(HPgiocatore) + str(MaxHPgiocatore)

#func set_Maxanime(maxa):
	#Maxanime = maxa
	#UI.Mana.text = "Mana \n" + str(Anime) + str(Maxanime)

func set_anime(nanime):
	Anime = nanime
	#if Anime > Maxanime:
		#Anime = Maxanime
	UI.Mana.text = "Mana \n" + str(Anime)

func set_MaxHPnemico(nmaxhpn):
	HPnemico = nmaxhpn 
	if HPnemico <= 0:
		#vai a scena di vittoria/al prossimo livello. 
		pass
	elif HPnemico > MaxHPnemico:
		HPnemico = MaxHPnemico
	#modifica UI

func set_HPnemico(nhpnem):
	HPnemico = nhpnem
	#Aggiorna UI

func damagearea_entered(body):
	#contralla se e un entita
	if body is Entity:
	#controlla a chi appartiene
		if body.is_player == 1: 
			HPgiocatore -= body.damage_to_opponent #cambia il valore in base agli HP o a qualcos'altro 
		else:
			HPnemico -= body.damage_to_opponent
		body.queue_free()
