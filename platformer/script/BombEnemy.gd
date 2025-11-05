class_name BombEnemy
extends Enemy

func _on_area_2d_body_entered(body: Node2D) -> void:
	TakeDamage(_actualLife)
	var areaExplosion = preload("res://Scene/BombZone.tscn")
	var areaInstance : Area2D = areaExplosion.instantiate()
	add_child(areaInstance)
	areaInstance.global_position = global_position
	areaInstance.body_entered.connect(_explosion_damage_area_2d_body_entered)
	
	
func _explosion_damage_area_2d_body_entered(body: Node2D) -> void:
	if body.is_in_group("Enemy"):
		body = body as Enemy
		body.TakeDamage(damages)
	elif body.is_in_group("Player"):
		body = body as Player
		body.TakeDamage(damages)
	
	
