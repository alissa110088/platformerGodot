class_name Player
extends CharacterBody2D

var _speed: float = 500.0
var _gravity: int = 1300
var _is_dead: bool = false
@export var jump_impulse: float = 500.0
@export var _game_over: PackedScene
@export var _canvas_layer: CanvasLayer
@export var _animated_sprite: AnimatedSprite2D
@export var _base_life: int = 3
@export var _animated_sprite_bow: AnimatedSprite2D
@export var _heart: Control
@export var _pause: PackedScene
@export var _timer_invicible: Timer
var is_invincible: bool = false
var can_climb: bool = false
var can_shoot: bool = true
var _actual_life: int
var _max_life : int = 3
var _tween_duration: float = 0.25
const projectile_scene: PackedScene = preload("res://Scene/arrow.tscn")
static var check_point_pos: Vector2 = Vector2(193.0, 146.0)


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	get_tree().paused = false
	global_position = check_point_pos
	_actual_life = _base_life
	$TimerShoot.start()
	_animated_sprite_bow.play("idle")
	$PlayerAnimator.play("idle")


func _physics_process(delta: float) -> void:
	if _is_dead:
		return
	_move()
	_jump(delta)
	_shoot_wait()
	_pause_menu()
	_can_climb()
	move_and_slide()

func _can_climb() ->void:
	if can_climb == true:
		velocity.y = Input.get_axis("climb_up", "climb_down") * _speed

func _pause_menu() -> void:
	if Input.is_action_just_pressed("pause"):
		var pause_menu = _pause.instantiate()
		_canvas_layer.add_child(pause_menu)
		get_tree().paused = true


func _shoot_wait() -> void:
	if Input.is_action_pressed("shoot") and can_shoot == true:
		_shoot()
		can_shoot = false

func _jump(delta) -> void:
	if is_on_floor() and Input.is_action_just_pressed("jump"):
		velocity.y -= jump_impulse + _gravity * delta
	elif not is_on_floor():
		_animated_sprite.play("jump")
		velocity.y += _gravity * delta

func _move() -> void:
	velocity.x = Input.get_axis("move_left", "move_right") * _speed

	if velocity.x == 0:
		_animated_sprite.play("idle")
	else:
		_animated_sprite.play("walk")

func _die() -> void:
	_is_dead = true
	var scene = _game_over.instantiate()
	_canvas_layer.add_child(scene)
	get_tree().paused = true


func _shoot() -> void:
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


func _take_damage(value: int) -> void:
	if is_invincible:
		return
	if _actual_life >= 1 and _actual_life <= _max_life:
		print(_actual_life)
		var _temp: Control = _heart.get_child(_actual_life - 1)
		_temp.visible = false
	_actual_life -= 1

	var tween = get_tree().create_tween()
	tween.tween_property(_animated_sprite, "modulate", Color.RED, _tween_duration)
	tween.tween_property(_animated_sprite, "modulate", Color.WHITE, _tween_duration)
	if _actual_life <= 0:
		_die()


func _heal(value: int) -> void:
	if _actual_life <= 2:
		var _temp: Control = _heart.get_child(_actual_life)
		_temp.visible = true
	_actual_life += 1


func _invincible():
	is_invincible = true
	$PlayerAnimator.play("invincible")
	_timer_invicible.start()


func _on_invicible_timeout() -> void:
	is_invincible = false
	$PlayerAnimator.stop()
	_animated_sprite.play("idle")
