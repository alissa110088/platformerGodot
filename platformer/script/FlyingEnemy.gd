class_name FlyingEnemy
extends Enemy

@export var cooldown: Timer
@export var anchor: Node2D

var _canShoot : bool = true
var _player: CharacterBody2D
var _playerInTrigger : bool = false

func _ready() -> void:
	super._ready()
	animatedSpriteReference.play("Idle")

func _physics_process(delta: float) -> void:
	if !_playerInTrigger:
		return
	
	if  _canShoot:
		_canShoot = false
		cooldown.start()
		Shoot()
		
	anchor.look_at(_player.global_position)

func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.is_in_group("Player"):
		_player = body
		_playerInTrigger = true


func _on_area_2d_body_exited(body: Node2D) -> void:
	if animatedSpriteReference != null:
		animatedSpriteReference.play("Idle")
	if body.is_in_group("Player"):
		_player = body
		_playerInTrigger = false
		
func _on_timer_timeout() -> void:
	_canShoot = true
	
func Shoot() -> void:
	animatedSpriteReference.play("Shoot")
	var projectileScene: PackedScene = preload("res://Scene/Projectile.tscn")
	var projectile: CharacterBody2D = projectileScene.instantiate()
	get_parent().add_child(projectile)
	projectile.global_position = $Anchor/Marker2D.global_position
	projectile.global_rotation = $Anchor/Marker2D.global_rotation
