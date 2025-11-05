class_name Arrow
extends CharacterBody2D


var gravity : float = 500.10
var speed : float = 100.0
var appeared : float = 0.05
var power : int = 10
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
func _physics_process(delta: float) -> void:
	appeared += 0.01
	velocity.x = speed * 1/appeared
	velocity.y = gravity * appeared
	
	global_rotation = velocity.angle() 
	
	var collision : KinematicCollision2D = move_and_collide(velocity * delta)
	if collision:
		var collider: CollisionObject2D = collision.get_collider()
		if collider.is_in_group("Enemy"):
			collider.TakeDamage(power)
			queue_free()
			
			 
	move_and_slide()
	
	
	
	
	
	
	
	
