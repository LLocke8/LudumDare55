extends Node2D

@onready var CardData = load("res://Carte/CardData.gd")

@export var STARTING_DECK = ["ScheletroSpada","ScheletroSpada","ScheletroSpada","ScheletroArco","ScheletroArco",'ScheletroScudo','ScheletroScudo']
const DRAW_AMOUNT = 3

var deck = []
var discard = []
var CartaSelezionata : Node

@export var nodoui : Node
@export var nodospawn : Node

func _ready():
	deck.assign(STARTING_DECK)
	deck.shuffle()
	draw(5)

func draw(amount : int):
	var c = amount
	while c > 0:
		if deck.size() > 0:
			var carta_nuova_nome = deck.pop_back()
			var scena_carta_nuova = load(CardData.DATA[carta_nuova_nome][5])
			var carta_nuova = scena_carta_nuova.instantiate()
			carta_nuova.nome_carta = carta_nuova_nome
			carta_nuova.dm = self
			nodoui.deck.add_child(carta_nuova)
		else:
			deck.assign(discard)
			deck.shuffle()
			discard.clear()
		c -= 1

func card_played(card : Node):
	discard.append(card.nome_carta)

func selected(carta : Node):
	CartaSelezionata = carta

func play_selected(pos):
	CartaSelezionata.play_card(pos)

func on_next_phase(phase):
	for card in nodoui.deck.get_children():
		card.is_locked = phase 

func _on_area_posizionamento_input_event(viewport, event, shape_idx):
	if Input.is_action_just_pressed("leftclick"):
		if CartaSelezionata != null:
			play_selected(get_global_mouse_position())
		
