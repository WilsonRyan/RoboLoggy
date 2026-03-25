extends CharacterBody2D

@onready var camera_2d: Camera2D = $Camera2D
@onready var game_grid: TileMapLayer = $"../Tiles/GameGrid"


var _tile_size: float = 32
var _player_tile: Vector2i = Vector2i.ZERO
var _half_tile: float = _tile_size/2
var _map_size: Vector2i = Vector2i.ZERO

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	_player_tile = Vector2i((position - Vector2(_half_tile, _half_tile)) / _tile_size)
	_map_size = game_grid.get_used_rect().size + Vector2i(-1,-1)
	camera_clamp((_map_size.x + 2) * 32, (_map_size.y + 2) * 32)
	print("Map Size: ", _map_size)
	print("Player tile position: ", _player_tile)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass

func _unhandled_input(_event: InputEvent) -> void:
	if Input.is_action_just_pressed("zoom_in") == true:
		camera_zoom("in")
	if Input.is_action_just_pressed("zoom_out") == true:
		camera_zoom("out")
	var md: Vector2i = get_input_direction()
	if md != Vector2i.ZERO:
		player_move(md)
		print("Player tile position: ", _player_tile)

func get_input_direction() -> Vector2i:
	var md: Vector2i = Vector2i.ZERO
	if Input.is_action_just_pressed("left"):
		md = Vector2i.LEFT
	elif Input.is_action_just_pressed("right"):
		md = Vector2i.RIGHT
	elif Input.is_action_just_pressed("up"):
		md = Vector2i.UP
	elif Input.is_action_just_pressed("down"):
		md = Vector2i.DOWN
	return md



func player_move(md: Vector2i) -> void:
	var dest: Vector2i = _player_tile + md
	move_player_on_tile(dest)

func move_player_on_tile(tile_coord: Vector2i) -> void:
	if tile_coord.x < 0 or tile_coord.x > _map_size.x:
		return
	if tile_coord.y < 0 or tile_coord.y > _map_size.y:
		return
	position = Vector2(tile_coord * _tile_size) + Vector2(_half_tile, _half_tile)
	_player_tile = tile_coord

func camera_zoom(dir: String) -> void: #string = "in" or "out"
	if dir == "in": 
		if camera_2d.zoom >= Vector2(4,4): return
		camera_2d.zoom += Vector2(0.25, 0.25)
	elif dir == "out":
		if camera_2d.zoom <= Vector2(1,1): return
		camera_2d.zoom += Vector2(-0.25, -0.25)
	else:
		print("input needs to be either IN or OUT")

func camera_clamp(right: int, bottom: int) -> void:
	camera_2d.limit_top = -32
	camera_2d.limit_bottom = bottom
	camera_2d.limit_left = -32
	camera_2d.limit_right = right
