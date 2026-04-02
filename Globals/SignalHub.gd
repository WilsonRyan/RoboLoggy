extends Node


signal on_player_takes_dmg


func emit_on_player_takes_dmg() -> void:
	on_player_takes_dmg.emit()
