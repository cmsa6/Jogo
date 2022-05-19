extends TextureButton

func _input(event):
	if event.is_action_pressed("Escape") and self.visible:
		#if event.as_text() == "E" and self.visible:
		emit_signal("button_down")
		check_quit()

func check_quit():
	var root_node = get_node("/root")

	var playScreen = load("res://UI/QuitMenu/CheckQuit.tscn")
	var play_node = playScreen.instance()
	root_node.add_child(play_node)
	root_node.move_child(play_node,0)
	
	
func hide_button(bol):
	if bol:
		self.visible = false
	else:
		self.visible = true



