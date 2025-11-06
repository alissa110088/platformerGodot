extends StaticBody2D
@export var power_up : Array[PackedScene]
@export var animation : AnimationPlayer
@export var spawn_pos : Marker2D

func _on_area_2d_body_entered(body: Node2D) -> void:
	if body is Player:
		animation.play("randomPowerUp")
		await animation.animation_finished
		var item = power_up.pick_random()
		var instanciated_item: Node2D =  item.instantiate()
		owner.add_child(instanciated_item)
		instanciated_item.global_position = spawn_pos.global_position
		
