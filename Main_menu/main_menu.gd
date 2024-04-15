class_name Main

extends Control

@onready var start_game = $MarginContainer/HBoxContainer/VBoxContainer/Start_game as Button
@onready var options = $MarginContainer/HBoxContainer/VBoxContainer/Options as Button
@onready var exit_game = $MarginContainer/HBoxContainer/VBoxContainer/Exit_game as Button
@onready var continue_game = $MarginContainer/HBoxContainer/VBoxContainer/Continue_game as Button
@onready var options_menu = $Options_menu as OptionMenu
@onready var margin_container = $MarginContainer as MarginContainer
#Mettere la scena principale 
#@onready var start_level = preload("")

func _ready():
	handle_connecting_signals()

	
func on_start_pressed() -> void:
	pass
	#get_tree().change_scene_to_packed(start_level)

func on_options_pressed() -> void:
	margin_container.visible = false
	options_menu.set_process(true)
	options_menu.visible = true
 
func on_exit_pressed()-> void: 
	get_tree().quit()

func on_exit_options_menu() -> void: 
	margin_container.visible = true
	options_menu.visible = false
	
func on_continue_game_pressed() -> void: 
	pass

func handle_connecting_signals() -> void:
	start_game.button_down.connect(on_start_pressed)
	options.button_down.connect(on_options_pressed)
	exit_game.button_down.connect(on_exit_pressed)
	options_menu.exit_options_menu.connect(on_exit_options_menu)
	continue_game.button_down.connect(on_continue_game_pressed)

