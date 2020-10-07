extends Actor

func _physics_process(delta: float) -> void:
	var direction: = Vector2(Input.get_action_strength("move_right") - Input.get_action_strength("move_left"), 
	-1.0 if Input.is_action_just_pressed("move_jump") and is_on_floor() else 1.0)
	_velocity.x = direction.x * _speed.x
	_velocity.y += gravity * delta
	_velocity = move_and_slide(_velocity)

