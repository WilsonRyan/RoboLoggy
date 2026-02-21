extends Control


const MENU_ORANGE_78 = preload("uid://c0tfrqh8lyrgh")
const MENU_WHITE_78 = preload("uid://b6xxf6rqjm8mu")

@onready var play_label: Label = $MainMenuMC/VBMainMenu/PlayLabel
@onready var options_label: Label = $MainMenuMC/VBMainMenu/OptionsLabel
@onready var exit_label: Label = $MainMenuMC/VBMainMenu/ExitLabel

var menu_labels: Dictionary = {}
var menu_selection: int = 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	menu_labels = {
		0: play_label,
		1: options_label,
		2: exit_label
	}
	label_selected(menu_labels[menu_selection])

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass

func _unhandled_input(_event: InputEvent) -> void:
	if Input.is_action_just_pressed("down") == true:
		label_not_selected(menu_labels[menu_selection])
		menu_selection = (menu_selection + 1) % 3
		label_selected(menu_labels[menu_selection])
	if Input.is_action_just_pressed("up") == true:
		label_not_selected(menu_labels[menu_selection])
		menu_selection = (menu_selection + 2) % 3
		label_selected(menu_labels[menu_selection])
	if Input.is_action_just_pressed("select") == true:
		select_pressed()


func select_pressed() -> void:
	if menu_labels == null: return
	if menu_labels[menu_selection] == play_label:
		GameManager.load_game()
	if menu_labels[menu_selection] == options_label:
		print("NO OPTIONS MADE YET")
	if menu_labels[menu_selection] == exit_label:
		GameManager.exit_game()

func label_not_selected(l: Label) -> void:
	l.label_settings = MENU_WHITE_78

func label_selected(l: Label) -> void:
	l.label_settings = MENU_ORANGE_78
