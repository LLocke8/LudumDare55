extends Node2D

@onready var CardData = load("res://Carte/CardData.gd")

const STARTING_DECK = ["ScheletroSpada","ScheletroSpada","ScheletroSpada","ScheletroArco","ScheletroArco",'ScheletroScudo','ScheletroScudo']
const DRAW_AMOUNT = 3

var deck = []
var discard = []
var CartaSelezionata : Node

@export var nododeck : Node
@export var nodospawn : Node

func _ready():
	deck.assign(STARTING_DECK)
	deck.shuffle()

func draw(amount : int):
	var c = amount
	while c > 0:
		if deck.size() > 0:
			var carta_nuova_nome = deck.pop_back()
			var scena_carta_nuova = CardData[carta_nuova_nome][4]
			var carta_nuova = scena_carta_nuova.instantiate(carta_nuova_nome,self)
			
			nododeck.add_child(carta_nuova)
		else:
			deck.assign(discard)
			deck.shuffle()
		c -= 1

func card_played(card : Node):
	discard.append(card.nome_carta)

func selected(carta : Node):
	CartaSelezionata = carta

func play_selected(pos):
	CartaSelezionata.play_card(pos)

