class_name Buttons extends TextureButton


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_mouse_entered() -> void:
	#$AnimationButton.play("mouse_entered")
	pass
	
func _on_mouse_exited() -> void:
	#$AnimationButton.play("mouse_exited")
	pass

func _on_pressed() -> void:
	get_tree().change_scene_to_file("res://Scene/map.tscn")
