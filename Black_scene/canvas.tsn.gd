extends CanvasLayer

@onready var color_rect = $ColorRect
@onready var animation_player = $AnimationPlayer
@onready var button = $Control/Button
@onready var label = $Control/Label

# Called when the node enters the scene tree for the first time.
func _ready():
	button.button_down.connect(on_button_pressed)
	animation_player.animation_finished.connect(on_animation_finished)

func transtition(): 
	animation_player.play("black_fade")
	
func on_animation_finished():
	label.visible = false
	button.visible = false
	color_rect = false
	
func on_button_pressed():	
	button.disabled = true
	transtition()
