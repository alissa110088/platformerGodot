extends Control

signal close_requested


func _ready() -> void:
	get_tree().paused = false


func _on_back_button_pressed() -> void:
	close_requested.emit()
