extends Control

@export var Mana : Node
@export var HP : Node
@export var Start : Node
@export var turn_counter : Node
@export var deck : Node
@export var gm : Node
@export var HPnemico : Node

var lock : bool = false

func _on_start_pressed():
	if !lock:
		gm.prossima_fase()
