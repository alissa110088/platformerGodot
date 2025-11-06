extends TextureButton	

func _on_mouse_entered() -> void:
	$AnimationQuit.play("Quit")

func _on_mouse_exited() -> void:
	$AnimationQuit.play_backwards("Quit")


func _on_pressed() -> void:
	get_tree().quit()
