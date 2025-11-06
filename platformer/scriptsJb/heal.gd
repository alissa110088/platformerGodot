extends CharacterBody2D


func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.is_in_group("Player"):
		body.heal(1)
		queue_free()
