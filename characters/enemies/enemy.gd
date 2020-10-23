extends Actor

func _ready() -> void:
	set_physics_process(false)
	_velocity.x = -speed.x

func _physics_process(delta: float) -> void:
	_velocity = manage_velocity(_velocity)
	if is_on_wall():
		_velocity.x *= -1.0
	_velocity.y = move_and_slide(_velocity, FLOOR_NORMAL).y
	
func manage_velocity(linear_velocity: Vector2) -> Vector2:
	var out: = linear_velocity
	out.y += gravity * get_physics_process_delta_time()
	return out
