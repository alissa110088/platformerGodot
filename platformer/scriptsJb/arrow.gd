class_name Arrow
extends CharacterBody2D


var gravity : float = 500.10
var speed : float = 100.0
var appeared : float = 0.05

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
func _physics_process(delta: float) -> void:
	appeared += 0.01
	velocity.x = speed * 1/appeared
	velocity.y = gravity * appeared
	
	global_rotation = velocity.angle() 
	
	move_and_slide()
	
	
	
	
	
	
	
