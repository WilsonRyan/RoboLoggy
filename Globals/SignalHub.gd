extends Node


signal on_player_takes_dmg
signal on_player_hits_wall
signal on_player_moves_with_pickup(dest: Vector2i)


func emit_on_player_takes_dmg() -> void:
	on_player_takes_dmg.emit()

func emit_on_player_hits_wall() -> void:
	on_player_hits_wall.emit()

func emit_on_player_moves_with_pickup() -> void:
	on_player_moves_with_pickup.emit()
