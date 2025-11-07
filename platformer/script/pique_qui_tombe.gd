extends RigidBody2D

@export var _damage: int = 20
var _gravity = 9.81

func _ready() -> void:
	gravity_scale = 0.0

func _on_area_2d_body_entered(body: Node2D) -> void:
	if body is Player:
		gravity_scale = _gravity

func _on_area_2d_2_body_entered(body: Node2D) -> void:
	if body is Player:
		body._take_damage(_damage)
