extends CharacterBody2D

class_name Forklift

#SPEED = .5 is 1 grid square per second
@export var SPEED: float = 10
@export var DIRECTION: Vector2 = Vector2.LEFT

@onready var hitbox: Area2D = $Hitbox


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	face_forward()
	hitbox.add_to_group("Forklifts")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass

func _physics_process(delta: float) -> void:
	var collision = move_and_collide(SPEED * DIRECTION * delta)
	if collision:
		turn_around()


func turn_around() -> void:
	DIRECTION = DIRECTION * -1
	face_forward()

func face_forward() -> void:
	if DIRECTION == Vector2.LEFT:
		rotation_degrees = 0
	elif DIRECTION == Vector2.RIGHT:
		rotation_degrees = 180
	elif DIRECTION == Vector2.UP:
		rotation_degrees = 90
	elif DIRECTION == Vector2.DOWN:
		rotation_degrees = -90



func _on_turn_timer_timeout() -> void:
	#turn_around()
	pass
