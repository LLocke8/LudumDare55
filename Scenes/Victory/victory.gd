extends Control

class_name Victory

@onready var victory_button = $MarginContainer/HBoxContainer/VBoxContainer/victory_button as Button
@onready var main_menu = preload("res://Scenes/Main_menu/main_menu.tscn")


func _ready():
	victory_button.button_down.connect(on_retry_pressed)
	
func on_retry_pressed() -> void:
	get_tree().change_scene_to_packed(main_menu)

