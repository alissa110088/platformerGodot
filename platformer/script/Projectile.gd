extends PhysicsBody2D

@export var speed: float = 300.0
@export var damage: int = 25

var _direction: Vector2

func _physics_process(delta: float) -> void:
	_direction = Vector2.RIGHT.rotated(global_rotation)
	
	var velocity: Vector2 = _direction * speed * delta
	
	var collision: KinematicCollision2D = move_and_collide(velocity)
	
	if collision:
		var collider: CollisionObject2D = collision.get_collider() 
		if collider.is_in_group("Obstacle"):
			bounce(collision)
		elif collider.is_in_group("Player"):
			collider.TakeDamage(damage)
			queue_free()


func bounce(collision: KinematicCollision2D):
	const BIAS: float = 30.0
	var new_direction = _direction.bounce(collision.get_normal())
	global_rotation = new_direction.angle()
	global_position += collision.get_normal() * BIAS
