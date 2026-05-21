extends Node

const GAME = preload("uid://c7mj1w30cjov5")
const MENU_MAIN = preload("uid://bp3alwr2gjw0d")
const LEVEL_SELECT_MENU = preload("uid://dgmv47hfvsbvt")
const LEVELS: Array[String] = [
	"res://Scenes/Game/Game.tscn",	#Base 0 Level. Not loaded, just to keep index normal
	"res://Scenes/Game/Levels/Level01.tscn",	#lvl 1
	"res://Scenes/Game/Levels/Level02.tscn",	#lvl 2
	"res://Scenes/Game/Levels/Level03.tscn",	#lvl 3
	"res://Scenes/Game/Levels/Level04.tscn",	#lvl 4
	"res://Scenes/Game/Levels/Level05.tscn",	#lvl 5
	"res://Scenes/Game/Levels/Level06.tscn"		#lvl 6
]

var max_level: int = LEVELS.size() - 1
var selected_level: int = 0


func get_level_scene(lvl_num: int) -> PackedScene:
	if lvl_num < 0 or lvl_num > LEVELS.size():
		push_error("Invalid level number: " + str(lvl_num))
		return null
	return load(LEVELS[lvl_num])

func load_main_menu() -> void:
	get_tree().change_scene_to_packed(MENU_MAIN)

func load_game() -> void:
	get_tree().change_scene_to_packed(GAME)

func exit_game() -> void:
	get_tree().quit()

func load_level_select_menu() -> void:
	get_tree().change_scene_to_packed(LEVEL_SELECT_MENU)

func load_level(lvl: int) -> void:
	if lvl >= max_level:
		get_tree().change_scene_to_packed(get_level_scene(lvl))
		selected_level = lvl - 1
		return
	get_tree().change_scene_to_packed(get_level_scene(lvl))
	selected_level = lvl
