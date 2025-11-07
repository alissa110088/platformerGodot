class_name Arrow
extends CharacterBody2D

@export var _sprite: Sprite2D

var _gravity: float = 500.10
var _appeared: float = 0.05
var _power: int = 10
var _speed: int = 1000
var _friction: float = 0.01
var _speed_tween: float = 0.5

func _physics_process(delta: float) -> void:

	_movement(delta)
	_collision_gestion(delta)
	move_and_slide()

func _movement(delta) -> void:
	var mousePos = (get_global_mouse_position() - global_position).normalized()
	velocity += mousePos * _speed * delta
	_appeared += _friction
	velocity.y += _gravity * delta
	global_rotation = velocity.angle()

func _collision_gestion(delta) -> void:
	var _collision: KinematicCollision2D = move_and_collide(velocity * delta)
	if _collision:
		var _collider: CollisionObject2D = _collision.get_collider()
		if _collider.is_in_group("Enemy"):
			_collider._take_damage(_power)
			queue_free()

func _on_timer_timeout() -> void:
	var tween = get_tree().create_tween()
	tween.tween_property(_sprite, "modulate", Color.TRANSPARENT, _speed_tween)
	await tween.finished
	queue_free()
