extends TextureButton

func _input(event):
	#if not self.modulate == HIDDEN:
	if self.name == "ExitGame":
		print("foi aqui5")
		if event.is_action_pressed("ui_accept"):
			print("foi aqui36")
			emit_signal("pressed")
