extends Node2D

const carta = preload("res://Carte/carta.tscn")
const ManodelGiocatore = preload("res://Carte/ManodelGiocatore.gd")
var CartaSelezionata = []
@onready var DimensioneDeck = ManodelGiocatore.ListaCarte.size()

#@onready var CentroCarteOvale = get_viewport().size * Vector2(0.5, 1.3)
#@onready var RaggioOriz = get_viewport().size.x*0.45
#@onready var RaggioVert = get_viewport().size.x*0.4
var angolo = deg_to_rad(90)
#var VettoreAngoloOvale = Vector2()


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#  pass


func _draw():
	var carta_nuova = carta.instantiate()
	CartaSelezionata = randi() % DimensioneDeck
	carta_nuova.NomeCarta = ManodelGiocatore.ListaCarte[CartaSelezionata]
	carta_nuova.position.add_child($posizionecarte)
	#VettoreAngoloOvale = Vector2 (RaggioOriz * cos(angolo), - RaggioVert * sin(angolo))
	#carta_nuova.position = CentroCarteOvale + VettoreAngoloOvale - carta_nuova.rect_size/2
	$Carte.add_child(carta_nuova)
	ManodelGiocatore.ListaCarte.erase(ManodelGiocatore.ListaCarte[CartaSelezionata])
	angolo += 0.2
	DimensioneDeck -= 1
	return DimensioneDeck
