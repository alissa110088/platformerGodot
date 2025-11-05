extends TextureButton


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_mouse_entered() -> void:
	$"../AnimationButton".play("animation_credits")

func _on_mouse_exited() -> void:
	$"../AnimationButton".play_backwards("animation_credits")
