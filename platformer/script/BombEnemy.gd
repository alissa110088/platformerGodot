extends Enemy

func _on_area_2d_body_entered(body: Node2D) -> void:
	TakeDamage(_actualLife)
	var areaExplosion
	
func _explosion_damage_area_2d_body_entered(body: Node2D) -> void:
	body.queue_free()
