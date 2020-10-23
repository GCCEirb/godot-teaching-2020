extends Actor

export var stomp_impulse: = 600.0

func _physics_process(delta: float) -> void:
	var direction: = get_direction()
	
	var is_jump_interrupted: = Input.is_action_just_released("move_jump") and _velocity.y < 0.0
	# Si on arrête d'appuyer sur la touche de saut, on le saura avec ce booléen
	
	_velocity = manage_velocity(_velocity, direction, is_jump_interrupted)
	_velocity = move_and_slide(_velocity, FLOOR_NORMAL)


func manage_velocity(linear_velocity: Vector2, direction: Vector2, is_jump_interrupted: bool) -> Vector2:
	var out: = linear_velocity
	out.x = direction.x * speed.x
	out.y += gravity * get_physics_process_delta_time()
	if direction.y == -1.0:
		out.y += speed.y * direction.y
	if is_jump_interrupted:
		# On annule l'impulsion du saut en y
		out.y = 0.0
	return out


func get_direction() -> Vector2:
	return Vector2(Input.get_action_strength("move_right") - Input.get_action_strength("move_left"), 
	-1.0 if Input.is_action_just_pressed("move_jump") and is_on_floor() else 0.0)


func _on_StompDetector_area_entered(area: Area2D) -> void:
	# On force la vélocité verticale pour donner l'impulsion
	_velocity.y = -stomp_impulse


func _on_Enemy_detector_body_entered(body: PhysicsBody2D) -> void:
	# On tue le joueur
	queue_free()
