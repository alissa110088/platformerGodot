class_name Rebond extends StaticBody2D

@export var _jump_force: float = 1.5

func _on_area_2d_body_entered(body: Node2D) -> void:
	if body is Player:
		body.velocity.y -= body.jump_impulse  * _jump_force
