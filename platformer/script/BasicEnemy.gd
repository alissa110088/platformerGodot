extends Enemy

func _ready() -> void:
	super._ready()
	animatedSpriteReference.play("Run")

func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.is_in_group("Player"):
		body.TakeDamage(damages)
