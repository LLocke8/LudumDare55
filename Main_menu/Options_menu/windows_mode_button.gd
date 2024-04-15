extends Control


@onready var option_button = $HBoxContainer/VSeparator/OptionButton as OptionButton

const WINDOWS_MOD_ARRAY : Array[String] = [
	"Window Mode",
	"Full-screen",
	"Borderless Window",
	"Borderless Full-screen"
]

func _ready():
	add_window_mode_items()
	option_button.item_selected.connect(on_window_mode_selected)

func add_window_mode_items() -> void:
	for window_mode in WINDOWS_MOD_ARRAY:
		option_button.add_item(window_mode)




func on_window_mode_selected(index : int) -> void:
	match index:

		0: #Window mode
			DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED)
			DisplayServer.window_set_flag(DisplayServer.WINDOW_FLAG_BORDERLESS, false)
		
		1: #FullscreenS
			DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_FULLSCREEN)
			DisplayServer.window_set_flag(DisplayServer.WINDOW_FLAG_BORDERLESS, false)
		 
		2: #Borderless Window 
			DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED)
			DisplayServer.window_set_flag(DisplayServer.WINDOW_FLAG_BORDERLESS, true)
		
		3: #Borderless Fullscreen
			DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_FULLSCREEN)
			DisplayServer.window_set_flag(DisplayServer.WINDOW_FLAG_BORDERLESS, true)
		
