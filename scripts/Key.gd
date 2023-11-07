extends CharacterBody2D


const SPEED = 25.0

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

func get_input():
	velocity.x = 0
	
func _physics_process(delta):
	var direction = Input.get_axis("ui_left", "ui_right")
	var up_down = Input.get_axis("ui_up", "ui_down")
	if direction:
		velocity.x = direction * SPEED
	elif up_down:
		velocity.y = up_down * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		velocity.y = move_toward(velocity.y, 0, SPEED)

	move_and_slide()
