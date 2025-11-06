extends Control


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$AnimationPauseMenu.play("Open_close")
	get_tree().paused = false


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	esc()


func resume():
	get_tree().paused = false
	$AnimationPauseMenu.play("Open_close")
	
	
func pause():
	get_tree().paused = true
	$AnimationPauseMenu.play_backwards("Open_close")
	
func esc():
	if Input.is_action_just_pressed("pause") and !get_tree().paused:
		pause()
	elif Input.is_action_just_pressed("pause") and get_tree().paused:
		resume()

func _on_resume_button_pressed() -> void:
	resume()


func _on_options_button_pressed() -> void:
	$SettinsgsMenu.show()

func _on_settinsgs_menu_close_requested() -> void:
	$SettinsgsMenu.hide()

func _on_quit_button_pressed() -> void:
	get_tree().quit()
