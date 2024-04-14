extends Control

var Panello_Carte : Node
var Mana : Node
var HP : Node
var Start : Node
var turn_counter : Node

func _ready():
	Panello_Carte = $VBoxContainer/Panello_inferiore/HBoxContainer/Carte
	Mana = $VBoxContainer/Panello_inferiore/HBoxContainer/TextureRect/Mana
	HP = $VBoxContainer/Panello_inferiore/HBoxContainer/TextureRect2/HP
	Start = $VBoxContainer/Panello_inferiore/HBoxContainer/Start
	turn_counter = $"VBoxContainer/Panello_superiore/VBoxContainer/Turn Counter"
	

