extends CharacterBody2D

@onready var camera_2d: Camera2D = $Camera2D

var _tile_size: int = 32
var _player_tile: Vector2i = Vector2i.ZERO

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	_player_tile = position
	print(_player_tile)

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
		print(_player_tile)

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
	place_player_on_tile(dest)

func place_player_on_tile(tile_coord: Vector2i) -> void:
	position = Vector2(tile_coord * _tile_size) + Vector2(16,16)
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
