extends Node

const GAME = preload("uid://c7mj1w30cjov5")
const MENU_MAIN = preload("uid://bp3alwr2gjw0d")
const LEVEL_SELECT_MENU = preload("uid://dgmv47hfvsbvt")
const Levels: Array[PackedScene] = [
	preload("uid://c7mj1w30cjov5"),	#Base 0 Level. Not loaded, just to keep index normal
	preload("uid://i6lhevs80d14"),	#lvl 1
	preload("uid://c4n4saibmcec6"),	#lvl 2
	preload("uid://b4asw3c5qoowl"),	#lvl 3
	preload("uid://cpscsos47il0c"),	#lvl 4
	preload("uid://dc5itwm0aem6f"),	#lvl 5
	preload("uid://m4w4utrk21o2")	#lvl 6
]

var selected_level: int = 0


func load_main_menu() -> void:
	get_tree().change_scene_to_packed(MENU_MAIN)

func load_game() -> void:
	get_tree().change_scene_to_packed(GAME)

func exit_game() -> void:
	get_tree().quit()	

func load_level_select_menu() -> void:
	get_tree().change_scene_to_packed(LEVEL_SELECT_MENU)

func load_level(lvl: int) -> void:
	get_tree().change_scene_to_packed(Levels[lvl])
	selected_level = lvl
