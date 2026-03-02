extends Control

signal resume_game

func _on_continue_pressed() -> void:
	resume_game.emit()
	pass 

var button_cooldown = false

func _ready() -> void:
	await get_tree().create_timer(0.8,false).timeout
	button_cooldown = true

func _process(delta: float) -> void:
	if(Input.is_action_just_pressed("ui_cancel") and button_cooldown):
		resume_game.emit()