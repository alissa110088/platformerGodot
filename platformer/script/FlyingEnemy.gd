class_name FlyingEnemy
extends Enemy

var _canShoot : bool = false

func _physics_process(delta: float) -> void:
	pass


func _on_area_2d_body_entered(body: Node2D) -> void:
	_canShoot = true


func _on_area_2d_body_exited(body: Node2D) -> void:
	_canShoot = true
