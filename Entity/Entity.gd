extends CharacterBody2D

class_name Entity

@export var max_hp : int = 100
@export var hp : int = 100 :

	set(nhp):
		$health_bar.max_value = max_hp
		hp = nhp
		$health_bar.value = hp
		print(name," HA ",hp)
		if(hp<=0):
			queue_free()
		elif(hp >= 100):
			pass
		

@export var is_player : bool = 1 #1 = giocatore, 0 = nemico.

func _ready():
	if !is_player:
		$AnimatedSprite2D.flip_h = true
