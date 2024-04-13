extends MarginContainer


@onready var DatabaseCarte = load("res://Carte/DatabaseCarte.gd")
var NomeCarta = 'ScheletroScudo'
@onready var InfoCarta = DatabaseCarte.DATA[DatabaseCarte.get(NomeCarta)]
@onready var ImgCarta = str("res://Carte/Grafiche/",InfoCarta[0],"/",NomeCarta,".png")



# Called when the node enters the scene tree for the first time.
func _ready():
	print(InfoCarta)
	$Sfondo.texture = load(ImgCarta)
	var attacco = str(InfoCarta[1])
	var vita = str(InfoCarta[2])
	var costo = str(InfoCarta[3])
	$barre/TopBarra/Nome/CenterContainer/nome.text = NomeCarta
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
