class_name Enemy
extends CharacterBody2D

@export var _pos1: Marker2D
@export var _pos2: Marker2D
@export var _speed: float = 300
@export var _damages: int = 10
@export var _stiffness: float = 5
@export var _base_life: int = 30
@export var _animation_player_reference: AnimationPlayer
@export var _particle_reference: GPUParticles2D
@export var _animated_sprite_reference: AnimatedSprite2D

var _actual_target_pos: Vector2
var _direction: Vector2
var _actual_life: int
var _can_move = true
var _margin: int = 3

func _ready() -> void:
	_actual_life = _base_life
	_actual_target_pos = _pos1.global_position


func _physics_process(delta: float) -> void:
	
	_move(delta)
	move_and_slide()


func _move(delta) -> void:
	if !_can_move:
		return
		
	if global_position.distance_to(_pos1.global_position) < _margin:
		_animated_sprite_reference.flip_h = false
		_actual_target_pos = _pos2.global_position

	elif global_position.distance_to(_pos2.global_position) < _margin:
		_actual_target_pos = _pos1.global_position
		_animated_sprite_reference.flip_h = true

	var target_direction = global_position.direction_to(_actual_target_pos)
	_direction = lerp(_direction, target_direction, delta * _stiffness)
	velocity = _direction * _speed

func _take_damage(value: int) -> void:
	_actual_life -= value
	_check_death()


func _check_death() -> void:
	if _actual_life <= 0:
		_can_move = false
		_animation_player_reference.play("Enemy explode")
		var anim_name = await _animation_player_reference.animation_finished
		_on_animation_death_finished(anim_name)


func _on_animation_death_finished(anim_name: StringName):
	get_node("Sprite2D").queue_free()
	get_node("Area2D").queue_free()
	get_node("CollisionShape2D").queue_free()
	_particle_reference.emitting = true
	await _particle_reference.finished
	_on_particles_death_finished()


func _on_particles_death_finished():
	queue_free()
