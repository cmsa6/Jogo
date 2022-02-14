extends TextureButton

	
func discardCurrentCard(eval):
	var root_node = get_node("/root")
	var current_player = SavingManager.current_player

	var currentCard = root_node.get_child(0)
	currentCard.queue_free()



	#var mapNode =  get_node("/root/Map1")
	#print(mapNode.get_children())
	#var mapChildren = mapNode.get_children()
	
	var canvasNode = get_node("/root/Map1/CanvasLayer")
	canvasNode.enable_canvas()
	
	var playersNode = get_node("/root/Map1/Spawners")
	var players = playersNode.get_children()
	
	var timer_node = get_node("/root/Map1/PlayTimer")
	
	print(eval)

	for child in players:
		if ( child.get_player_num() -1 ) == current_player:
			print("im finishing the game on evaluateCard")
			child.finished_game()
			if eval == "Approved":
				if not child.check_win():
					child.play_animation(CharactersManager.WIN_ANIM)
					timer_node.start(3.5)
				else:
					child.won_game()
			elif eval == "Disapproved":
				child.play_animation(CharactersManager.LOSE_ANIM)
				timer_node.start(3.5)
			break

			
	

	
func discard_dice_info():
	var root_node = get_node("/root")

	var currentCard = root_node.get_child(0)
	print("a sair do dado")
	print(currentCard.get_children())
	currentCard.queue_free()
	
	var canvasNode = get_node("/root/Map1/CanvasLayer")
	canvasNode.enable_canvas()
	
	
	
	
