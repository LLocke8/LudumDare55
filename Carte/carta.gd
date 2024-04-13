extends MarginContainer


@onready var DatabaseCarte = load("res://Carte/DatabaseCarte.gd")
var NomeCarta = 'ScheletroSpada'
@onready var InfoCarta = DatabaseCarte.DATA[DatabaseCarte.get(NomeCarta)]
@onready var ImgCarta = str("res://Carte/Grafiche/",InfoCarta[0],"/",NomeCarta,".png")



# Called when the node enters the scene tree for the first time.
func _ready():
	print(ImgCarta)
	$Sfondo.texture = load(ImgCarta)


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
