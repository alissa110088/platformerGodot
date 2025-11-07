class_name BombEnemy
extends Enemy

func _ready() -> void:
	super._ready()
	_animated_sprite_reference.play("Run")

func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.is_in_group("Player"):
		call_deferred("DeferredFunction")

func _explosion_damage_area_2d_body_entered(body: Node2D) -> void:
	if body is Player and body.is_invincible:
		return
	if body.is_in_group("Enemy") or body.is_in_group("Player"):
		body._take_damage(_damages)
		body._take_damage(_damages)

func DeferredFunction() -> void:
	var area_explosion = preload("res://Scene/BombZone.tscn")
	var area_instance: Area2D = area_explosion.instantiate()
	add_child(area_instance)
	_take_damage(_actual_life)
	area_instance.global_position = global_position
	area_instance.body_entered.connect(_explosion_damage_area_2d_body_entered)
