extends TextureButton

func _on_mouse_entered() -> void:
	var tween = get_tree().create_tween()
	tween.tween_property($".","scale", Vector2(0.37,0.540), 0.3)
	#$"../AnimationButton".play("animation_options")

func _on_mouse_exited() -> void:
	var tween = get_tree().create_tween()
	tween.tween_property($".","scale", Vector2(0.32,0.533), 0.3)
	#$"../AnimationButton".play_backwards("animation_options")


func _on_pressed() -> void:
	get_tree().quit()
