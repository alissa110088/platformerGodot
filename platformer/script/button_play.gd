extends TextureButton
var current_color: Color

func _on_pressed() -> void:
	get_tree().change_scene_to_file("res://Scene/map.tscn")


func _on_mouse_entered() -> void:
	#$"../AnimationButton".play("animation_play")
	var tween = get_tree().create_tween()
	tween.tween_property($".","scale", Vector2(0.37,0.540), 0.3)
func _on_mouse_exited() -> void:
	var tween = get_tree().create_tween()
	tween.tween_property($".","scale", Vector2(0.32,0.533), 0.3)
	#$"../AnimationButton".play_backwards("animation_play")
