extends Area2D

class_name Package

var carrier: Node2D = null
var carry_offset: Vector2 = Vector2(0,-12)
var _player_ref: Player


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	add_to_group("pickups")
	_player_ref = get_tree().get_first_node_in_group("Player")
	SignalHub.on_player_moves_with_pickup.connect(on_player_moves_with_pickup)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(_delta: float) -> void:
	if carrier != null:
		global_position = carrier.global_position + carry_offset

func pick_up(player: Node2D) -> void:
	carrier = player

func drop_off() -> void:
	carrier = null
	set_deferred("monitoring", false)
	set_deferred("monitorable", false)
	global_position += (carry_offset) * -1
	remove_from_group("pickups")
	if get_tree().get_nodes_in_group("pickups").size() == 0:
		SignalHub.emit_on_all_packages_delivered()

func on_player_moves_with_pickup() -> void:
	position = _player_ref.global_position + carry_offset
