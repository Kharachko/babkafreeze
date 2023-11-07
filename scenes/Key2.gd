extends CharacterBody2D

var SPEED = 20

func _process(delta):
	if Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT):
		var target_position = get_global_mouse_position()
		var direction = (target_position - position).normalized()
		if direction:
			velocity = direction * SPEED
		else:
			velocity.x = move_toward(velocity.x, 0, SPEED)
			velocity.y = move_toward(velocity.y, 0, SPEED)
		move_and_slide()
