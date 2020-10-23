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


func _on_StompDetector_body_entered(body: PhysicsBody2D) -> void:
	if body.global_position.y > get_node("StompDetector").global_position.y:
		return
	# On désactive les collisions
	get_node("CollisionShape2D").disabled = true
	# On tue l'ennemi
	queue_free()
