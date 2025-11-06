class_name Collectible extends CharacterBody2D


func _process(delta: float) -> void:
	global_position += Vector2.RIGHT
	velocity.y += 981 * delta
	move_and_slide()
