extends Control

func _ready() -> void:
	$AnimationPauseMenu.play_backwards("Open_close")
	get_tree().paused = false

func resume():
	get_tree().paused = false
	$AnimationPauseMenu.play("Open_close")

func _on_resume_button_pressed() -> void:
	resume()
