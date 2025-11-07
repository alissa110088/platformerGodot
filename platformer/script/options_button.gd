extends TextureButton

func _on_mouse_entered() -> void:
	$AnimationOptions.play("Options")


func _on_mouse_exited() -> void:
	$AnimationOptions.play_backwards("Options")
