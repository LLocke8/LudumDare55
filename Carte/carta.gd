extends Node


# Called when the node enters the scene tree for the first time.
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

