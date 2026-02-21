extends Node

const GAME = preload("uid://c7mj1w30cjov5")
const MENU_MAIN = preload("uid://bp3alwr2gjw0d")


func load_main_menu() -> void:
	get_tree().change_scene_to_packed(MENU_MAIN)

func load_game() -> void:
	get_tree().change_scene_to_packed(GAME)

func exit_game() -> void:
	get_tree().quit()
