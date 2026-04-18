extends Area2D

class_name DropPoint

var _player_ref: Player


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	add_to_group("dropPoints")
	SignalHub.on_package_delivered.connect(on_package_delivered)
	_player_ref = get_tree().get_first_node_in_group("Player")
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass



func on_package_delivered() -> void:
	var dps: Array = get_tree().get_nodes_in_group("dropPoints")
	var closest_dp = null
	var closest_dp_dist = INF
	var dist: float = INF
	for dp in dps:
		dist = dp.global_position.distance_squared_to(_player_ref.global_position)
		if dist < closest_dp_dist:
			closest_dp = dp
			closest_dp_dist = dist
	if closest_dp_dist < 10:
		closest_dp.remove_from_group("dropPoints")
		set_deferred("monitoring", false)
