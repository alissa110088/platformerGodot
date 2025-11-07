extends TextureButton


	

func _on_mouse_entered() -> void:
	$AnimationBack.play("Back")

func _on_mouse_exited() -> void:
	$AnimationBack.play_backwards("Back")
