extends Control

@onready var change = $Change as Button


func _ready():
	handle_connecting_signals()
	print("lol")
	
func on_change_pressed() -> void:
	 # Quando il pulsante viene premuto
	print("lol")
	$TextureRect.visible = false  # Nascondi lo sfondo nero
	$Label.visible = false        # Nascondi la Label
	$Button.visible = false       # Nascondi il pulsante

func handle_connecting_signals() -> void:
	print("lol")
	change.button_down.connect(on_change_pressed)
