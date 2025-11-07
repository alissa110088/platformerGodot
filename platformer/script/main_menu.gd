extends Control

func _ready() -> void:
	$CanvasLayer/SettinsgsMenu.visible = false

func _on_options_pressed() -> void:
	$CanvasLayer/SettinsgsMenu.show()


func _on_settinsgs_menu_close_requested() -> void:
	$CanvasLayer/SettinsgsMenu.hide()


func _on_credits_pressed() -> void:
	$CanvasLayer/CreditsMenu.show()


func _on_credits_menu_close_requested() -> void:
	$CanvasLayer/CreditsMenu.hide()

func _on_quit_pressed() -> void:
	get_tree().quit()
