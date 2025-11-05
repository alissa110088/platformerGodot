class_name Player extends CharacterBody2D

var _speed : float = 500.0
var _gravity : int = 1300
var _is_dead: bool = false
@export var jump_impulse: float = 500.0
@export var _game_over: PackedScene
	
func _physics_process(delta: float) -> void:
	if _is_dead:
		return
	
	velocity.x = Input.get_axis("move_left","move_right") * _speed
	
	if is_on_floor() 	and Input.is_action_just_pressed("jump"):
		velocity.y -= jump_impulse + _gravity * delta
	elif not is_on_floor():
		velocity.y += _gravity * delta
		
	move_and_slide()	
	
func die() -> void:
	_is_dead = true
	var scene = _game_over.instantiate()
	owner.add_child(scene)	
	scene.global_position = get_viewport_rect().size/2
