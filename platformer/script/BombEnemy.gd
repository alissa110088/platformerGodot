extends Enemy
	
func _explosion_damage_area_2d_body_entered(body: Node2D) -> void:
	body.queue_free()
