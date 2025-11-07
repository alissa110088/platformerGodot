extends StaticBody2D

@export var _power_up: Array[PackedScene]
@export var _animation: AnimationPlayer
@export var _spawn_pos: Marker2D
var _played: bool = false


func _on_area_2d_body_entered(body: Node2D) -> void:
	if body is Player && !_played:
		_played = true
		_animation.play("randomPowerUp")
		await _animation.animation_finished
		var item = _power_up.pick_random()
		var instanciated_item: Node2D = item.instantiate()
		owner.add_child(instanciated_item)
		instanciated_item.global_position = _spawn_pos.global_position
