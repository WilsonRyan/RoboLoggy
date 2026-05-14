extends Node2D

@onready var player: CharacterBody2D = $Player
@onready var game_grid: TileMapLayer = $Tiles/GameGrid
@onready var acid_tiles: TileMapLayer = $Tiles/AcidTiles
@onready var tiles: Node2D = $Tiles
@onready var game_ui: Control = $CanvasLayer/GameUI
@onready var wall_tiles: TileMapLayer = $Tiles/WallTiles


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	SignalHub.on_player_takes_dmg.connect(on_player_takes_dmg)
	SignalHub.on_player_goes_through_gate.connect(on_player_goes_through_gate)
	game_ui.hide()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	if tile_is_acid(player._player_tile) == true:
		game_over()

func _unhandled_input(_event: InputEvent) -> void:
	pass
	#if get_tree().paused == false and Input.is_action_just_pressed("test") == true:
		#get_tree().paused = true
		#game_ui.show()
		#game_ui.displayPause()
	#elif get_tree().paused == true and Input.is_action_just_pressed("pause") == true:

	#elif player.get_tree().paused == true and Input.is_action_just_pressed("escape") == true:
		#player.get_tree().paused = false
		#GameManager.load_main_menu()



func player_wins() -> void:
	print("YOU WIN!")
	game_ui.show()
	game_ui.displayWin()
	player.get_tree().paused = true
	

func game_over() -> void:
	game_ui.show()
	game_ui.displayGameOver()
	player.get_tree().paused = true

func tile_is_acid(tile: Vector2i) -> bool:
	return tile in acid_tiles.get_used_cells()

func tile_is_wall(tile: Vector2i) -> bool:
	return tile in wall_tiles.get_used_cells()



func on_player_takes_dmg() -> void:
	game_over()

func on_player_goes_through_gate() -> void:
	player_wins()
	
