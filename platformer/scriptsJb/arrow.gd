class_name Arrow
extends CharacterBody2D

@export var timer: Timer
@export var sprite: Sprite2D

var gravity : float = 500.10
var speed : float = 10.0
var appeared : float = 0.05
var power : int = 10
	
func _physics_process(delta: float) -> void:
	var mousePos = (get_global_mouse_position()- global_position).normalized()
	
	velocity += mousePos * 1000 * delta
	
	appeared += 0.01
	#velocity.x = speed * 1/appeared 
	velocity.y += gravity * delta 
	#velocity += Vector2.from_angle(global_rotation)
	
	global_rotation = velocity.angle() 
	
	var collision : KinematicCollision2D = move_and_collide(velocity * delta)
	if collision:
		var collider: CollisionObject2D = collision.get_collider()
		if collider.is_in_group("Enemy"):
			collider.TakeDamage(power)
			queue_free()
			
			 
	move_and_slide()
	
func _on_timer_timeout() -> void:
	var tween = get_tree().create_tween()
	tween.tween_property(sprite, "modulate", Color.TRANSPARENT, 0.5)
	await tween.finished
	queue_free()
