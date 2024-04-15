extends TextureRect

@onready var CardData = load("res://Carte/CardData.gd")

var nome_carta : String 
var costo : int = 1

var dm : Node

var is_locked : bool = 0 :
	set(lock):
		is_locked = lock

func _ready():
	pass
	#aggiungere parte grafica

func play_card(pos : Vector2):
	if !is_locked:
		dm.card_played(self)
		card_effect(pos)
		queue_free()

func _on_button_pressed():
	if !is_locked:
		dm.selected(self)

func card_effect(pos : Vector2):
	var spawn = load(CardData.DATA[nome_carta][6])
	var inst_spawn = spawn.instantiate()
	inst_spawn.global_position = pos
	dm.nodospawn.add_child(inst_spawn)
