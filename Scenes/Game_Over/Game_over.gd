extends Control

class_name Gameover

@onready var retry_button = $MarginContainer/HBoxContainer/VBoxContainer/retry_button as Button
@onready var menu_button = $MarginContainer/HBoxContainer/VBoxContainer/menu_button as Button
@onready var gameover = preload("res://Scenes/Main_menu/main_menu.tscn")

func _ready():
	retry_button.button_down.connect(on_retry_pressed)
	menu_button.button_down.connect(on_menu_pressed)
	
func on_retry_pressed() -> void:	
	pass
	
func on_menu_pressed() -> void:
	get_tree().change_scene_to_packed(gameover)

