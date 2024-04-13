extends Node2D

const carta = preload("res://Carte/carta.tscn")
const ManodelGiocatore = preload("res://Carte/ManodelGiocatore.gd")
var CartaSelezionata = []
@onready var DimensioneDeck = ManodelGiocatore.ListaCarte.size()
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#  pass


func _input(InputEvent):
	if Input.is_action_just_released("leftclick"):
		var carta_nuova = carta.instance()
		CartaSelezionata = randi() % DimensioneDeck
		carta_nuova.NomeCarta = ManodelGiocatore.ListaCarte[CartaSelezionata]
		carta_nuova.position = get_global_mouse_position()
		$Carte.add_child(carta_nuova)
		ManodelGiocatore.ListaCarte.erase(ManodelGiocatore.ListaCarte[CartaSelezionata])
		DimensioneDeck -= 1
		
