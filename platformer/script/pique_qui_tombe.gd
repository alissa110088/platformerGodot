extends RigidBody2D

func _ready() -> void:
	gravity_scale = 0.0


func _on_area_2d_body_entered(body: Node2D) -> void:
	if body is Player:
		gravity_scale = 9.81

		


func _on_area_2d_2_body_entered(body: Node2D) -> void:
	if body is Player:
		body.TakeDamage(20)
