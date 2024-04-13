extends Node2D

#riferimento all'enemy spawner
#var ES : EnemySpawner = ref
#riferimento al mazzo 
#var Mazzo : Mazzo = ref


var MaxHPgiocatore : int = 10 :
	set(Mhp): set_MaxHPgiocatore(Mhp)
var HPgiocatore : int = 10 : 
	set(hp): set_hp(hp)

var Maxanime : int = 5 :
	set(maxa): set_Maxanime(maxa)
var Anime : int = 5 :
	set(nanime): set_anime(nanime)

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

var fase : bool = 0 : #0 per preparazione, 1 per comabttimento
	set(nfase): prossima_fase(nfase)
	get:
		return turno

func prossimo_turno():
	turno = !turno

func prossima_fase(nfase):
	if !fase:
		prossimo_turno()
	if fase:
		#fai partire le entita
		#get_tree().call_group("Entita","Start")
		#impedisci al giocatore di giocare carte
		#Mazzo.lock()
		pass
	else:
		#rimuovi le unita non persistenti che rimangono
		#get_tree().call_group("Entita","Kill")
		#
		pass
	fase = nfase 

func set_MaxHPgiocatore(Mhp):
	MaxHPgiocatore = Mhp 
	#modifica UI

func set_hp(hp):
	HPgiocatore = hp 
	if HPgiocatore <= 0:
		#vai a scena di game over. 
		pass
	elif HPgiocatore > MaxHPgiocatore:
		HPgiocatore = MaxHPgiocatore
	#modifica UI

func set_Maxanime(maxa):
	Maxanime = maxa
	#modifica UI

func set_anime(nanime):
	Anime = nanime
	if Anime > Maxanime:
		Anime = Maxanime
	#modifica UI

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
	#modifica UI

func damagearea_entered(body):
	#contralla se e un entita
	#if body is Entity:
	#controlla a chi appartiene
	#	if body.belongs == 1: 
	#		HPgiocatore -= 1 #cambia il valore in base agli HP o a qualcos'altro 
	#	else:
	#		HPnemico -= 1
	#	body.queue_free()
	pass
