extends Control

func _ready() -> void:
	$AnimationPauseMenu.play_backwards("Open_close")
	get_tree().paused = false

func resume():
	get_tree().paused = false
	$AnimationPauseMenu.play("Open_close")

func _on_resume_button_pressed() -> void:
	$ResumeButton.release_focus()
	resume()


func _on_options_button_pressed() -> void:
	$SettinsgsMenu.show()

func _on_settinsgs_menu_close_requested() -> void:
	$SettinsgsMenu.hide()

func _on_quit_button_pressed() -> void:
	get_tree().quit()
