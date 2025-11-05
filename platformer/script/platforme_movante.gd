class_name MovingPlatform
extends StaticBody2D

@export var target1: Marker2D
@export var target2: Marker2D
@export var speed: float = 100.0

var _current_target: Marker2D

func _ready():
	_current_target = target1

func _physics_process(delta):
	var dir = (_current_target.global_position - global_position).normalized()
	global_position += dir * speed * delta

	if global_position.distance_to(_current_target.global_position) < 2.0:
		_current_target = target2 if _current_target == target1 else target1
