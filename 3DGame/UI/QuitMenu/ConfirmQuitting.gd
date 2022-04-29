extends TextureButton

func _input(event):
	if event.is_action_pressed("Evaluate"):
		if self.name == "Confirm" and event.as_text() == "A":
			emit_signal("button_down")
			emit_signal("pressed")
		if self.name == "NotConfirm" and event.as_text() == "B":
			emit_signal("button_down")
			emit_signal("pressed")
			
#	if (not self.disabled) and event.is_action_pressed("ui_accept"):
#		emit_signal("pressed")

	
func go_back_game():
	var rootNode = get_node("/root")
	
	var currentCard = rootNode.get_child(0)
	currentCard.queue_free()

	
	
	# Load saved scene
	var saved_scene = SavingManager.saved_scene
	rootNode.add_child(saved_scene)
	
	var mapNode = get_node("/root/Map1/CanvasLayer")
	mapNode.enable_additional_info()
	

			
	

	
func quit():
	var playersNode = get_node("/root/Map1/Spawners")
	var players = playersNode.get_children()
	
	players[0].all_won_game()

	





func _on_NotConfirm_pressed():
	print("helloooo")
