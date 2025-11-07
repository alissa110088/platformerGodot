extends TextureButton
var _base_scale: Vector2 = Vector2(0.37, 0.540)
var _target_scale: Vector2 = Vector2(0.32,0.533)
var _speed_tween: float = 0.3

func _on_mouse_entered() -> void:
	var tween = get_tree().create_tween()
	tween.tween_property($".","scale", _base_scale, _speed_tween)

func _on_mouse_exited() -> void:
	var tween = get_tree().create_tween()
	tween.tween_property($".","scale", _target_scale, _speed_tween)


func _on_pressed() -> void:
	get_tree().quit()
