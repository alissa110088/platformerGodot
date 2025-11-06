extends Area2D


func _on_body_entered(body: Node2D) -> void:
	if body is Player:
		Player.check_point_pos = global_position
	$GPUParticles2D.emitting = true
