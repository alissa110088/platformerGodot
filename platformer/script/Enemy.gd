class_name Enemy
extends CharacterBody2D

@export var pos1 : Marker2D
@export var pos2 : Marker2D
@export var speed : float = 300
@export var damages : int = 10
@export var stiffness : float = 5
@export var baseLife : int = 30
@export var animationPlayerReference : AnimationPlayer
@export var particleReference : GPUParticles2D
@export var animatedSpriteReference : AnimatedSprite2D 

var _actualTargetPos : Vector2
var _direction : Vector2
var _actualLife : int
var _canMove = true


func _ready() -> void:
	_actualLife = baseLife
	_actualTargetPos = pos1.global_position

func _physics_process(delta: float) -> void:
	if global_position.distance_to(pos1.global_position) < 3 :
		_actualTargetPos = pos2.global_position
	
	elif global_position.distance_to(pos2.global_position) < 3 : 
		_actualTargetPos = pos1.global_position
		
	if _canMove:
		var targetDirection = global_position.direction_to(_actualTargetPos)
		_direction = lerp(_direction, targetDirection, delta * stiffness)
		velocity = _direction * speed	
	
	move_and_slide()


func TakeDamage(value : int) -> void:
	_actualLife -= value
	CheckDeath()
	
func CheckDeath() -> void:
	if _actualLife <= 0:
		_canMove = false
		animationPlayerReference.play("Enemy explode")
		animationPlayerReference.animation_finished.connect(_on_animation_death_finished)
func _on_animation_death_finished(anim_name: StringName):
	get_node("Sprite2D").queue_free()
	get_node("Area2D").queue_free()
	get_node("CollisionShape2D").queue_free()
	particleReference.emitting = true 
	particleReference.finished.connect(_on_particles_death_finished)
	
func _on_particles_death_finished():
	queue_free()
