extends Control


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$SettinsgsMenu.visible = false


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_options_pressed() -> void:
	$SettinsgsMenu.show()


func _on_settinsgs_menu_close_requested() -> void:
	$SettinsgsMenu.hide()
