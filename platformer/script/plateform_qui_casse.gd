class_name PlatformCasse extends StaticBody2D
@export var _anim: AnimationPlayer
@export var _timer: Timer


func _on_area_2d_body_entered(body: Node2D) -> void:
	if body is not PlatformCasse:
		_timer.start()


func _on_timer_timeout() -> void:
	_anim.play("PlatformCasse")
	await _anim.animation_finished
	queue_free()
