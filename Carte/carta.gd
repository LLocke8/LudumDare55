extends MarginContainer

@onready var CardData = load("res://Carte/CardData.gd")

var nome_carta : String 
var dm : Node

func _init(ncarta : String,deck_manager : Node):
	nome_carta = ncarta
	dm = deck_manager

func _ready():
	pass
	#aggiungere parte grafica

func play_card(pos : Vector2):
	dm.card_played(self)
	card_effect(pos)

func _on_button_pressed():
	dm.selected(self)

func card_effect(pos : Vector2):
	var spawn = CardData.DATA[nome_carta][4]
	var inst_spawn = spawn.instantiate()
	inst_spawn.global_position = pos
	dm.nodospawn.add_child(inst_spawn)
