extends CharacterBody2D

var direction: float = 0.0
var speed : float = 500.0
var gravity : int = 1300
@export var jump_impulse: float = 500.0

var can_shoot: bool = true

const projectile_scene: PackedScene = preload("res://Scene/arrow.tscn")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
func _physics_process(delta: float) -> void:
	velocity.x = Input.get_axis("move_left","move_right") * speed
	
	
	if is_on_floor() 	and Input.is_action_just_pressed("jump"):
		print("test")
		velocity.y -= jump_impulse + gravity * delta
	elif not is_on_floor():
		velocity.y += gravity * delta
		
		
	if Input.is_action_pressed("shoot") and can_shoot == true:
		shoot()
		can_shoot = false
		
	
	move_and_slide()
	
	
func shoot() -> void:
	var projectile: Arrow = projectile_scene.instantiate()

	projectile.global_position = $ArrowAnchor/Origin.global_position
	get_parent().add_child(projectile)
	projectile.global_rotation = $ArrowAnchor/Origin.global_rotation
	
	
	
