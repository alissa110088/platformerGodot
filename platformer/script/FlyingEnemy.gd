class_name FlyingEnemy
extends Enemy

@export var _cooldown: Timer
@export var _anchor: Node2D

var _can_shoot: bool = true
var _player: CharacterBody2D
var _playerInTrigger: bool = false


func _ready() -> void:
	super._ready()
	_animated_sprite_reference.play("Idle")


func _physics_process(delta: float) -> void:
	if !_playerInTrigger:
		return

	if _can_shoot:
		_can_shoot = false
		_cooldown.start()
		_shoot()

	_anchor.look_at(_player.global_position)


func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.is_in_group("Player"):
		_player = body
		_playerInTrigger = true


func _on_area_2d_body_exited(body: Node2D) -> void:
	if _animated_sprite_reference != null:
		_animated_sprite_reference.play("Idle")
	if body.is_in_group("Player"):
		_player = body
		_playerInTrigger = false


func _on_timer_timeout() -> void:
	_can_shoot = true


func _shoot() -> void:
	_animated_sprite_reference.play("Shoot")
	var projectile_scene: PackedScene = preload("res://Scene/Projectile.tscn")
	var projectile: CharacterBody2D = projectile_scene.instantiate()
	get_parent().add_child(projectile)
	projectile.global_position = $Anchor/Marker2D.global_position
	projectile.global_rotation = $Anchor/Marker2D.global_rotation
