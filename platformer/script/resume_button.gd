extends TextureButton

func _on_mouse_entered() -> void:
	$AnimationResume.play("resume")


func _on_mouse_exited() -> void:
	$AnimationResume.play_backwards("resume")


func _on_pressed() -> void:
	get_tree().paused = false
	get_parent().queue_free()
