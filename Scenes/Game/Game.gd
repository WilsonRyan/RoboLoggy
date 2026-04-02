extends Node2D

@onready var player: CharacterBody2D = $Player
@onready var game_grid: TileMapLayer = $Tiles/GameGrid
@onready var acid_tile: TileMapLayer = $Tiles/AcidTile
@onready var tiles: Node2D = $Tiles
@onready var game_ui: Control = $CanvasLayer/GameUI


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	SignalHub.on_player_takes_dmg.connect(on_player_takes_dmg)
	game_ui.hide()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	if tile_is_acid(player._player_tile) == true:
		game_over()

func _unhandled_input(_event: InputEvent) -> void:
	if Input.is_action_just_pressed("test") == true:
		GameManager.load_main_menu()
	if player.get_tree().paused == true and Input.is_action_just_pressed("escape") == true:
		player.get_tree().paused = false
		GameManager.load_main_menu()


func game_over() -> void:
	game_ui.show()
	game_ui.displayGameOver()
	player.get_tree().paused = true

func tile_is_acid(tile: Vector2i) -> bool:
	return tile in acid_tile.get_used_cells()


func on_player_takes_dmg() -> void:
	game_over()
