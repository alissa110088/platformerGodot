class_name Player extends CharacterBody2D

var _speed : float = 500.0
var _gravity : int = 1300
var _is_dead: bool = false
@export var jump_impulse: float = 500.0
@export var _game_over: PackedScene
@export var _canvas_layer: CanvasLayer
@export var _animated_sprite: AnimatedSprite2D
@export var baseLife : int = 3
@export var _animated_sprite_bow: AnimatedSprite2D
@export var _heart: Control
var can_climb:bool = false
var can_shoot: bool = true
var _actualLife : int
const projectile_scene: PackedScene = preload("res://Scene/arrow.tscn")
static var check_point_pos: Vector2 = Vector2(193.0, 146.0)

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	get_tree().paused = false
	global_position = check_point_pos
	_actualLife = baseLife
	$Timer.start()
	_animated_sprite_bow.play("idle")
	$PlayerAnimator.play("idle")


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
		
	if can_climb == true:
		velocity.y = Input.get_axis("climb_up","climb_down") * _speed
		
		
		
		
	
	move_and_slide()	
	
func die() -> void:
	_is_dead = true
	var scene = _game_over.instantiate()
	_canvas_layer.add_child(scene)	
	get_tree().paused = true
	
func shoot() -> void:
	_animated_sprite_bow.play("shoot")
	await _animated_sprite_bow.animation_finished
	var projectile: Arrow = projectile_scene.instantiate()
	projectile.global_position = $ArrowAnchor/Origin.global_position
	get_parent().add_child(projectile)
	projectile.global_rotation = $ArrowAnchor/Origin.global_rotation
	_animated_sprite_bow.play("idle")
	$PlayerAnimator.play("idle")

	
func _on_timer_timeout() -> void:
	can_shoot = true

func TakeDamage(value : int) -> void :
	if _actualLife >= 1 :
		print(_actualLife -1)
		var _temp: Control = _heart.get_child(_actualLife -1)
		_temp.visible = false
	_actualLife -= 1
	
	var tween = get_tree().create_tween()
	tween.tween_property($AnimatedSprite2D, "modulate", Color.RED, 0.25)
	tween.tween_property($AnimatedSprite2D, "modulate", Color.WHITE, 0.25)
	if _actualLife <= 0:
		die()
