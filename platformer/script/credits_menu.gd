extends Control

signal close_requested

func _on_back_button_pressed() -> void:
	close_requested.emit()
