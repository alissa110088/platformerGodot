class_name Collectible
extends CharacterBody2D

var _gravity: int = 981

func _process(delta: float) -> void:
	global_position += Vector2.RIGHT
	velocity.y += _gravity * delta
	move_and_slide()
