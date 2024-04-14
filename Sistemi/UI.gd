extends Control

var Panello_Carte : Node
var Mana : Node
var Hp : Node
var Start : Node
var turn_counter : Node

func _ready():
	Panello_Carte = $Panello_inferiore/HBoxContainer/Carte
	Mana = $Panello_inferiore/HBoxContainer/Mana
	Hp = $Panello_inferiore/HBoxContainer/HP
	Start = $Panello_inferiore/HBoxContainer/Start
	turn_counter = $"Panello_superiore/VBoxContainer/Turn Counter"
	

