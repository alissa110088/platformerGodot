class_name BombEnemy
extends Enemy

func _ready() -> void:
	super._ready()
	animatedSpriteReference.play("Run")

func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.is_in_group("Player"):
		call_deferred("DeferredFunction")
	
	
func _explosion_damage_area_2d_body_entered(body: Node2D) -> void:
	if body.is_in_group("Enemy") or body.is_in_group("Player"):
		body.TakeDamage(damages)
		body.TakeDamage(damages)
	
	
func DeferredFunction() -> void:
	var areaExplosion = preload("res://Scene/BombZone.tscn")
	var areaInstance : Area2D = areaExplosion.instantiate()
	add_child(areaInstance)
	TakeDamage(_actualLife)
	areaInstance.global_position = global_position
	areaInstance.body_entered.connect(_explosion_damage_area_2d_body_entered) 
