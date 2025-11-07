extends ButtonAnim

func _on_mouse_entered() -> void:
	$AnimationResume.play("resume")


func _on_mouse_exited() -> void:
	$AnimationResume.play_backwards("resume")
