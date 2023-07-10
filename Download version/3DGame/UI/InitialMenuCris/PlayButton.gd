extends Button

signal start_load_next_scene

func _on_PlayButton_pressed():
	emit_signal("start_load_next_scene")
