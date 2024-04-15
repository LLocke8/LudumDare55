extends Control

@export var Mana : Node
@export var HP : Node
@export var Start : Node
@export var turn_counter : Node
@export var deck : Node
@export var gm : Node

func _on_start_pressed():
	gm.prossima_fase()
