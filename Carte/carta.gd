extends MarginContainer


@onready var DatabaseCarte = load("res://Carte/DatabaseCarte.gd")
var NomeCarta = 2
@onready var InfoCarta = DatabaseCarte.DATA[DatabaseCarte.get(NomeCarta)]
@onready var ImgCarta = str("res://Carte/Grafiche/",InfoCarta[0],"/",NomeCarta,".png")
var startpos = 0
var targetpos = 0
var t = 0
var DurataPescata = 2

enum {InMano,
	InGioco,
	InMouse,
	FocusInMano,
	MuoviCartaPescataInMano,
	RiorganizzaInMano
	}
	 
var Stato = InMano

# Called when the node enters the scene tree for the first time.
func _ready():
	#print(InfoCarta)
	
	$Sfondo.texture = load(ImgCarta)
	
	var attacco = str(InfoCarta[1])
	var vita = str(InfoCarta[2])
	var costo = str(InfoCarta[3])
	$barre/TopBarra/Nome/CenterContainer/nome.text = NomeCarta
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
var setup = true
var starscale = Vector2

func _physics_process(delta):
	match Stato:
		InMano:
			pass
		InGioco:
			pass
		InMouse:
			pass
		FocusInMano:
			pass
		MuoviCartaPescataInMano:
			#if t <=1:
				#position = startpos.linear_interpolation(targetpos, t)
				#t += delta/float(DurataPescata)
			#else:
				#position = targetpos
				#Stato = InMano
				#t = 0
			pass
		RiorganizzaInMano:
			if setup:
				setup()
			pass
	
	pass
func setup():
	startpos = position
	startscale = SIZE_EXPAND
	t = 0
	setup = false

func _on_focus_mouse_entered():
	match Stato:
		InMano, RiorganizzaInMano:
			Stato = FocusInMano


func _on_focus_mouse_exited():
	match Stato:
		FocusInMano:
			Stato =  RiorganizzaInMano
