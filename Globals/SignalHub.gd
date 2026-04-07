extends Node


signal on_player_takes_dmg
signal on_player_hits_wall


func emit_on_player_takes_dmg() -> void:
	on_player_takes_dmg.emit()

func emit_on_player_hits_wall() -> void:
	on_player_hits_wall.emit()
