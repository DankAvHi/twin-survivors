extends CharacterBody2D

const SPEED = 200.0
@export var target: NodePath


func _physics_process(delta: float) -> void:
	if(target == null):
		return
	var target_node = get_node(target)
	var direction = (target_node.position - position).normalized()
	velocity = direction * SPEED

	move_and_slide()
