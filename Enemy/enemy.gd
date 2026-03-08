extends CharacterBody2D

const SPEED = 200.0
@export var target: Node2D


func _physics_process(delta: float) -> void:
	if target == null:
		return
	var direction = (target.position - position).normalized()
	velocity = direction * SPEED

	move_and_slide()
