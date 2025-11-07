class_name MovingPlatform
extends StaticBody2D

@export var _target1: Marker2D
@export var _target2: Marker2D
@export var _speed: float = 100.0

var _current_target: Marker2D
var _dir
var _margin: int = 2.0

func _ready():
	_current_target = _target1

func _physics_process(delta):
	_dir = (_current_target.global_position - global_position).normalized()
	global_position += _dir * _speed * delta
	if global_position.distance_to(_current_target.global_position) < _margin:
		_current_target = _target2 if _current_target == _target1 else _target1
