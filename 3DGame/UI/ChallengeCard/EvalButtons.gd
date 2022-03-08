extends TextureButton


func _input(event):
	if event.is_action_pressed("Evaluate"):
		print(self.name)
		print(event.as_text())
		print(event.as_text() == "A")
		
		
		if self.name == "ApproveButton" and event.as_text() == "A":
			print("entreiii")
			emit_signal("pressed")
		if self.name == "DisapproveButton" and event.as_text() == "B":
			emit_signal("pressed")
