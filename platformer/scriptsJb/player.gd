class_name Player extends CharacterBody2D

var _speed : float = 500.0
var _gravity : int = 1300
var _is_dead: bool = false
@export var jump_impulse: float = 500.0
@export var _game_over: PackedScene
@export var _animated_sprite: AnimatedSprite2D
@export var baseLife : int = 100
var can_shoot: bool = true
var _actualLife : int
const projectile_scene: PackedScene = preload("res://Scene/arrow.tscn")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	_actualLife = baseLife


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

	
func _physics_process(delta: float) -> void:
	if _is_dead:
		return
	
	velocity.x = Input.get_axis("move_left","move_right") * _speed
	
	if velocity.x == 0:
		_animated_sprite.play("idle")
	else:
		_animated_sprite.play("walk")
	
	if is_on_floor() 	and Input.is_action_just_pressed("jump"):
		velocity.y -= jump_impulse + _gravity * delta
	elif not is_on_floor():
		_animated_sprite.play("jump")
		velocity.y += _gravity * delta
		
		
	if Input.is_action_pressed("shoot") and can_shoot == true:
		shoot()
		can_shoot = false
		
	if Input.is_action_pressed("shoot") and can_shoot == true:
		shoot()
		can_shoot = false
	
	move_and_slide()	
	
func die() -> void:
	_is_dead = true
	var scene = _game_over.instantiate()
	owner.add_child(scene)	
	scene.global_position = get_viewport_rect().size/2

		
	
func shoot() -> void:
	var projectile: Arrow = projectile_scene.instantiate()

	projectile.global_position = $ArrowAnchor/Origin.global_position
	get_parent().add_child(projectile)
	projectile.global_rotation = $ArrowAnchor/Origin.global_rotation

func TakeDamage(value : int) -> void :
	_actualLife -= value
	print(_actualLife) 
