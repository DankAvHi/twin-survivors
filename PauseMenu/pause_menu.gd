extends CanvasLayer

signal resume_game

func _on_continue_pressed() -> void:
	resume_game.emit()
