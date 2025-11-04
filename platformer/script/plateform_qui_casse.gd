extends StaticBody2D
@export var _anim: AnimationPlayer
		


func _on_area_2d_body_entered(body: Node2D) -> void:
	#if body is Player:
	_anim.play("PlatformCasse")
	await _anim.animation_finished
	queue_free()
