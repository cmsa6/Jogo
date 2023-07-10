extends TextureButton

export(NodePath) var detailedVersions
export(NodePath) var allPlayers

signal finish_game()

func _input(event):
	if self.name == "ExitGame":
		if event.is_action_pressed("RightArrow") and self.visible:
			emit_signal("button_down")
			emit_signal("pressed")
			
			
func button_pressed():
	emit_signal("finish_game")
