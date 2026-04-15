extends CharacterBody2D

class_name Player

@onready var camera_2d: Camera2D = $Camera2D
@onready var game_grid: TileMapLayer = $"../Tiles/GameGrid"
@onready var hitbox: Area2D = $Hitbox
@onready var move_timer: Timer = $MoveTimer

var _player_tile: Vector2i = Vector2i.ZERO
var _map_size: Vector2i = Vector2i.ZERO
var _last_tile: Vector2i = Vector2i.ZERO
var _can_move: bool = true
var held_package: Package = null
var nearby_package: Package = null


func _enter_tree() -> void:
	add_to_group("Player")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	SignalHub.on_player_hits_wall.connect(on_player_hits_wall)
	_player_tile = GlobalFunctions.POSITION_TO_TILE(position)
	_last_tile = _player_tile
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

func get_input_direction() -> Vector2i:
	var md: Vector2i = Vector2i.ZERO
	if _can_move == false:
		return md
	elif Input.is_action_just_pressed("left"):
		md = Vector2i.LEFT
		reset_move_timer()
	elif Input.is_action_just_pressed("right"):
		md = Vector2i.RIGHT
		reset_move_timer()
	elif Input.is_action_just_pressed("up"):
		md = Vector2i.UP
		reset_move_timer()
	elif Input.is_action_just_pressed("down"):
		md = Vector2i.DOWN
		reset_move_timer()
	return md


func reset_move_timer() -> void:
	move_timer.start()
	_can_move = false

func player_move(md: Vector2i) -> void:
	var dest: Vector2i = _player_tile + md
	_last_tile = _player_tile
	move_player_on_tile(dest)

func move_player_on_tile(tile_coord: Vector2i) -> void:
	if tile_coord.x < 0 or tile_coord.x > _map_size.x:
		return
	if tile_coord.y < 0 or tile_coord.y > _map_size.y:
		return
	position = GlobalFunctions.TILE_TO_POSITION(tile_coord)
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


func on_player_hits_wall() -> void:
	move_player_on_tile(_last_tile)
	_last_tile = _player_tile

func try_pickup() -> void:
	if held_package != null:
		return
	if nearby_package == null:
		return
	held_package = nearby_package
	held_package.pick_up(self)


func _on_hitbox_area_entered(area: Area2D) -> void:
	if area is Package and held_package == null:
		held_package = area
		held_package.pick_up(self)
	elif area.is_in_group("Forklifts"):
		SignalHub.emit_on_player_takes_dmg()
	elif area.is_in_group("dropPoints") and held_package != null:
		held_package.drop_off()
		held_package = null
	elif area is Gate:
		on_player_hits_wall()


func _on_move_timer_timeout() -> void:
	_can_move = true
