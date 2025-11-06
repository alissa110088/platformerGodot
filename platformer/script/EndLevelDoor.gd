extends StaticBody2D

var _base_pos: Vector2 = Vector2(193.0, 146.0)

func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.is_in_group("Player"):
		Player.check_point_pos = _base_pos
		get_tree().change_scene_to_file("res://Scene/main_menu.tscn")
