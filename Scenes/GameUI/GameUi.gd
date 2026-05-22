extends Control

@onready var game_over_ui: Control = $GameOverUI
@onready var win_ui: Control = $WinUI
@onready var pause_ui: Control = $PauseUI
@onready var sfx: AudioStreamPlayer2D = $SFX

var win: bool = false
var lose: bool = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	game_over_ui.hide()
	win_ui.hide()
	pause_ui.hide()

func _unhandled_input(_event: InputEvent) -> void:
#resume game from pause menu
	if get_tree().paused == true and Input.is_action_just_pressed("select") == true and lose == false and win == false:
		get_tree().paused = false
		hideUI()
		hide()
#Go to menu after you die or during the pause menu
	elif get_tree().paused == true and Input.is_action_just_pressed("escape") == true:
		get_tree().paused = false
		GameManager.load_main_menu()
#Go to next level when you win
	elif get_tree().paused == true and Input.is_action_just_pressed("select") == true and win == true:
		get_tree().paused = false
		print(GameManager.selected_level + 1)
		GameManager.load_level(GameManager.selected_level + 1)
#pulls up the pause menu
	elif get_tree().paused == false and Input.is_action_just_pressed("escape") == true and lose == false and win == false:
		get_tree().paused = true
		show()
		displayPause()


func displayGameOver() -> void:
	sfx.stream = preload("uid://cabu1rbrvgf82")
	sfx.play()
	game_over_ui.show()
	lose = true

func displayWin() -> void:
	sfx.stream = preload("uid://cufgq3k8wvtu4")
	sfx.play()
	win_ui.show()
	win = true

func displayPause() -> void:
	pause_ui.show()

func hideUI() -> void:
	game_over_ui.hide()
	win_ui.hide()
	pause_ui.hide()
