extends Area2D
class_name Bullet

var _velocity: Vector2 = Vector2.ZERO
export var speed: float = 300.0
var _direction: Vector2 = Vector2.ZERO

func _ready() -> void:
	set_as_toplevel(true)


func init(direction: Vector2) -> void:
	_direction = direction
	_velocity = direction * speed


func _physics_process(delta: float) -> void:
	_velocity = manage_velocity(_velocity, _direction)
	position += _velocity


func manage_velocity(linear_velocity: Vector2, direction: Vector2) -> Vector2:
	var out: = linear_velocity
	out.x = direction.x * speed
	out.y += gravity * get_physics_process_delta_time()
	return out

func _on_Enemy_detector_body_entered(body: PhysicsBody2D) -> void:
	# On tue le joueur
	queue_free()


func _on_Bullet_body_entered(body: Node) -> void:
	queue_free()
