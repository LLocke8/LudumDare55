extends Control

@onready var change = $Button as Button


func _ready():
	handle_connecting_signals()

	
func on_change_pressed() -> void:
	

func handle_connecting_signals() -> void:
	change.button_down.connect(on_change_pressed)
