extends Node


@export var TILE_SIZE: float = 32
@export var HALF_TILE: float = TILE_SIZE/2


func POSITION_TO_TILE(pos: Vector2) -> Vector2i:
	return Vector2i((pos - Vector2(HALF_TILE, HALF_TILE)) / TILE_SIZE)

func TILE_TO_POSITION(grid: Vector2i) -> Vector2:
	return (Vector2(grid * TILE_SIZE) + Vector2(HALF_TILE, HALF_TILE))
