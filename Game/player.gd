extends CharacterBody2D

const SPEED = 300.0
const JOYSTICK_DEADZONE = 10.0  
const MAX_JOYSTICK_RADIUS = 100.0

var is_dragging = false
var drag_start_position = Vector2.ZERO

func _physics_process(delta: float) -> void:
	var horizontal_direction := Input.get_axis("ui_left", "ui_right")
	var vertical_direction := Input.get_axis("ui_up", "ui_down")
	
	if Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT):
		var current_mouse_pos = get_viewport().get_mouse_position()
		
		if not is_dragging:
			drag_start_position = current_mouse_pos
			is_dragging = true
		
		var joystick_vector = current_mouse_pos - drag_start_position
		
		if joystick_vector.length() > JOYSTICK_DEADZONE:
			var clamped_vector = joystick_vector
			if clamped_vector.length() > MAX_JOYSTICK_RADIUS:
				clamped_vector = clamped_vector.normalized() * MAX_JOYSTICK_RADIUS
			
			var normalized_strength = clamped_vector / MAX_JOYSTICK_RADIUS
			horizontal_direction = normalized_strength.x
			vertical_direction = normalized_strength.y
		else:
			horizontal_direction = 0
			vertical_direction = 0
	else:
		is_dragging = false
	
	var direction := Vector2(horizontal_direction, vertical_direction)
	if direction.length() > 1.0:
		direction = direction.normalized()
	
	velocity = direction * SPEED
	
	move_and_slide()
