extends Node2D

func save(level : int):
	var save_level = {
		"Level": level,
	}
	return save_level

func _ready():
	pass
	#controlla se esiste il file di salvataggio, se non c'e, chiama save_game(1)

func save_game(level : int):
	var save_game = FileAccess.open("user://savegame.save", FileAccess.WRITE)
	var json_string = JSON.stringify(save(level))
	save_game.store_line(json_string)

func load_game():
	var node_data
	if  FileAccess.file_exists("user://savegame.save"):
		var save_game = FileAccess.open("user://savegame.save", FileAccess.READ)
		while save_game.get_position() < save_game.get_length():
			var json_string = save_game.get_line()
			var json = JSON.new()
			var parse_result = json.parse(json_string)
			node_data = json.get_data()
		
	match node_data["Level"]:
		1:
			pass #get_tree().change_scene_to_packed(preload(""))
		2:
			pass #get_tree().change_scene_to_packed(preload(""))
		3:
			pass #get_tree().change_scene_to_packed(preload(""))

