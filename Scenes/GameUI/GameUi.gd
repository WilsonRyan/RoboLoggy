extends Control

@onready var game_over_ui: Control = $GameOverUI
@onready var win_ui: Control = $WinUI


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	game_over_ui.hide()
	win_ui.hide()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass


func displayGameOver() -> void:
	game_over_ui.show()

func displayWin() -> void:
	win_ui.show()
