extends TextureButton

export(NodePath) var detailedVersions
export(NodePath) var allPlayers

signal finish_game()

func _input(event):
	#if not self.modulate == HIDDEN:
	if self.name == "ExitGame":
		if event.is_action_pressed("ui_accept"):
			emit_signal("button_down")
			emit_signal("pressed")
			
			
func button_pressed():
#	var children = get_node(detailedVersions).get_children()
#	var showAllPlayers = get_node(allPlayers)
#
#	for child in children:
#		if child.visible:
#			child.visible = false
#			showAllPlayers.visible = true
#			return
			
	
	emit_signal("finish_game")
