extends Area2D

class_name Gate

@onready var timer: Timer = $Timer
@onready var animation_player: AnimationPlayer = $AnimationPlayer


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
	print("gate opens")

func close() -> void:
	animation_player.play("close")
	set_deferred("monitoring", true)
	set_deferred("monitorable", true)
	print("gate closed")


func on_all_packages_delivered() -> void:
	open()
