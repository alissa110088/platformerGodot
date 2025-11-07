extends Enemy

func _ready() -> void:
	super._ready()
	_animated_sprite_reference.play("Run")

func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.is_in_group("Player") && not body.is_invincible:
		body._take_damage(_damages)
