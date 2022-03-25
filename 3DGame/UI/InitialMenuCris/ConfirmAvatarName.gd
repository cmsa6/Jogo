extends TextureButton


func _input(event):
	print(self.disabled)
	print(self.visible)
	if event.is_action_pressed("acept_name") and not self.disabled and visible:
		print("I WAS PRESSEDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDD")
		emit_signal("pressed")
