extends Area2D

class_name Gate

@onready var timer: Timer = $Timer
@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var closed_collision_shape_2d: CollisionShape2D = $closedCollisionShape2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	SignalHub.on_all_packages_delivered.connect(on_all_packages_delivered)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass


func open() -> void:
	animation_player.play("open")
	set_deferred("monitoring", false)
	set_deferred("monitorable", false)
	closed_collision_shape_2d.set_deferred("disabled", true)
	print("gate opens")

func close() -> void:
	animation_player.play("close")
	set_deferred("monitoring", true)
	set_deferred("monitorable", true)
	closed_collision_shape_2d.set_deferred("disabled", false)
	print("gate closed")


func on_all_packages_delivered() -> void:
	open()


func _on_finish_line_body_entered(body: Node2D) -> void:
	if body is Player:
		SignalHub.emit_on_player_goes_through_gate()
