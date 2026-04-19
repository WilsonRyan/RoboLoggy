extends Control

@onready var game_over_ui: Control = $GameOverUI
@onready var win_ui: Control = $WinUI
@onready var pause_ui: Control = $PauseUI


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	game_over_ui.hide()
	win_ui.hide()
	pause_ui.hide()

func _unhandled_input(_event: InputEvent) -> void:
	if get_tree().paused == true and Input.is_action_just_pressed("pause") == true:
		get_tree().paused = false
		hideUI()
		hide()
	elif get_tree().paused == true and Input.is_action_just_pressed("escape") == true:
		get_tree().paused = false
		GameManager.load_main_menu()
	elif get_tree().paused == false and Input.is_action_just_pressed("pause") == true:
		get_tree().paused = true
		show()
		displayPause()


func displayGameOver() -> void:
	game_over_ui.show()

func displayWin() -> void:
	win_ui.show()

func displayPause() -> void:
	pause_ui.show()

func hideUI() -> void:
	game_over_ui.hide()
	win_ui.hide()
	pause_ui.hide()
