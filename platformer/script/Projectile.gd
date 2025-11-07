extends PhysicsBody2D

@export var _speed: float = 300.0
@export var _damage: int = 25

var _direction: Vector2


func _physics_process(delta: float) -> void:
	_move(delta)

		
func _move(delta) -> void:
	_direction = Vector2.RIGHT.rotated(global_rotation)
	var _velocity: Vector2 = _direction * _speed * delta
	var _collision: KinematicCollision2D = move_and_collide(_velocity)

	if _collision:
		if _collision.get_collider().is_in_group("Player"):
			var _collider: CollisionObject2D = _collision.get_collider()
			_collider._take_damage(_damage)
		queue_free()

func _bounce(collision: KinematicCollision2D):
	const BIAS: float = 30.0
	var new_direction = _direction.bounce(collision.get_normal())
	global_rotation = new_direction.angle()
	global_position += collision.get_normal() * BIAS
