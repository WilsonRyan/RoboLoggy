extends Control

var LEVELS_COUNT: int = GameManager.Levels.size() - 1
const LEVEL_BUTTON = preload("uid://cqdopyy2873is")


@onready var grid_container: GridContainer = $TextureRect/MainMenuMC/VBoxContainer/GridContainer


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	setup_grid()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass

func _unhandled_input(_event: InputEvent) -> void:
	if Input.is_action_just_pressed("escape") == true:
		GameManager.load_main_menu()


func setup_grid() -> void:
	print(SaveManager.highest_unlocked_level)
	for level in range(SaveManager.highest_unlocked_level):
		var lb = LEVEL_BUTTON.instantiate()
		lb.setup(str(level+1))
		grid_container.add_child(lb)
