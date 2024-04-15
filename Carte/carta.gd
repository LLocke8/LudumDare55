extends TextureRect

@onready var CardData = load("res://Carte/CardData.gd")

var nome_carta : String 
var costo : int = 1

var dm : Node

var is_locked : bool = 0 :
	set(lock):
		is_locked = lock

func _ready():
	costo = CardData.DATA[nome_carta][1]
	texture = load(CardData.DATA[nome_carta][3])
	$Label.text = nome_carta
	$HP.text = str(CardData.DATA[nome_carta][2])
	$Mana.text = str(CardData.DATA[nome_carta][1])
	tooltip_text = CardData.DATA[nome_carta][4]
	#aggiungere parte grafica

func play_card(pos : Vector2):
	if !is_locked:
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
