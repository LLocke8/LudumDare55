extends Node2D

#var enemy_scene = preload("res://Scenes/Enemy.tscn")
class_name MyClass


# Called when the node enters the scene tree for the first time.


func spawn_wave(enemyspawn:Dictionary): #enemy has  EnemyTipe -> point
	var c = 0 # simply counter
	var enemy_type = enemyspawn.keys() # take all the type  of the enemy and put them to an array
	#var spawnpoint = enemyspawn.values()# take all the spawnpoint and put them to an array
	while c < enemyspawn.size(): # while the enemy exist
		var quantity_of_enemy = enemyspawn[c] # take the time that you must spawn the specific enemy
		var i = 0 # simply counter
		while i < quantity_of_enemy.size(): # how many time the same enemy must be spawned
			var enemy_scene = load("res://Scenes/Enemy_" + enemy_type[c] + ".tscn") #Load the specific enemy
			var enemy = enemy_scene.instantiate()# instantiate it
			var nodes = get_tree().get_nodes_in_group("spawn")#get all the possible spawn position
			var node = nodes[enemyspawn[c][i]] # get the exactly position where the enemy spawn
			$SpawnLocation.position = node.position  #target the position
			enemy.position = $SpawnLocation.position#set the position
			add_child(enemy) # spawn the enemy_type at the spawnpoint point
			i= i + 1 # just an increase
		c= c + 1# just an increase




