extends KinematicBody2D
class_name Actor

export var gravity: float = 3000.0
var _velocity: Vector2 = Vector2.ZERO
export var speed: Vector2 = Vector2(200.0, 300)

const FLOOR_NORMAL = Vector2.UP
