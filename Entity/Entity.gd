extends CharacterBody2D

class_name Entity

@export var max_hp : int = 100
@export var hp : int = 100 : 
	set(nhp): 
		hp = nhp
		#print(nhp)
		if(hp<=0):
			queue_free()
		elif(hp >= 100):
			pass

@export var is_player : bool = 1 #1 = giocatore, 0 = nemico.

