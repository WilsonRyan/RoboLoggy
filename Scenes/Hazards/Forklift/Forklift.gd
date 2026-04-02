extends CharacterBody2D

#SPEED = .5 is 1 grid square per second
@export var SPEED: float = 0.25 
@export var DIRECTION: Vector2 = Vector2.LEFT


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	global_position += SPEED * DIRECTION
