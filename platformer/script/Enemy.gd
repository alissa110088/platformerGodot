extends CharacterBody2D

@export var pos1 : Marker2D
@export var pos2 : Marker2D
@export var speed : float = 300
@export var damages : int = 10
@export var stiffness : float = 5
@export var baseLife : int = 30

var _actualTargetPos : Vector2
var _direction : Vector2
var _actualLife : int


func _ready() -> void:
	_actualLife = baseLife
	_actualTargetPos = pos1.global_position

func _physics_process(delta: float) -> void:
	if global_position.distance_to(pos1.global_position) < 0.5 :
		_actualTargetPos = pos2.global_position
	
	elif global_position.distance_to(pos2.global_position) < 0.5 : 
		_actualTargetPos = pos1.global_position
	
	var targetDirection = global_position.direction_to(_actualTargetPos)
	_direction = lerp(_direction, targetDirection, delta * stiffness)
	velocity = _direction * speed	
	
	move_and_slide()
