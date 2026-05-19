extends Node


const SAVE_PATH := "user://save.cfg"

var highest_unlocked_level: int = 1

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	print(ProjectSettings.globalize_path(SAVE_PATH))
	load_progress()


func save_progress() -> void:
	var config := ConfigFile.new()
	config.set_value("progress", "highest_unlocked_level", highest_unlocked_level)
	var error = config.save(SAVE_PATH)
	if error != OK:
		push_warning("Failed to save progress: " + str(error))

func load_progress() -> void:
	var config = ConfigFile.new()
	var error = config.load(SAVE_PATH)
	if error != OK:
		#No save file yet and start fresh
		highest_unlocked_level = 1
		return
	highest_unlocked_level = config.get_value("progress", "highest_unlocked_level", 1)

func complete_level(level_num: int) -> void:
	if level_num >= highest_unlocked_level:
		highest_unlocked_level = level_num + 1
		save_progress()

func is_level_unlocked(level_num: int) -> bool:
	return level_num <= highest_unlocked_level
