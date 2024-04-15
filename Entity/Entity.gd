extends CharacterBody2D

class_name Entity

@export var max_hp : int = 100
@export var hp : int = 100 :

	set(nhp):
		$health_bar.max_value = max_hp
		hp = nhp
		if(hp<=0):
			queue_free()
		elif(hp >= max_hp):
			hp = max_hp
		$health_bar.value = hp


@export var is_player : bool = 1 #1 = giocatore, 0 = nemico.
@export var damage_to_opponent : int = 1

var is_stopped : bool = 1 :
	set(state):
		is_stopped = state

func _ready():
	if !is_player:
		$AnimatedSprite2D.flip_h = true

func on_next_phase(phase):
	pass

