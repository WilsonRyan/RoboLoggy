extends TextureButton

class_name LevelButton

@onready var level_label: Label = $LevelLabel

var _level_number: String = "99"
var level: int = 99


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	level_label.text = _level_number
	level = _level_number.to_int()



func setup(ln: String) -> void:
	_level_number = ln



func _on_button_down() -> void:
	level_label.position.y += 3

func _on_button_up() -> void:
	level_label.position.y -= 3

func _on_pressed() -> void:
	GameManager.load_level(level)
