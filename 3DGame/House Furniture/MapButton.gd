extends TextureButton

func back_to_map():
	var rootNode = get_node("/root")
	
	var currentCard = rootNode.get_child(0)
	currentCard.queue_free()
	
	var currentPlayer = SavingManager.current_player
	
	# Load saved scene
	var saved_scene = SavingManager.saved_scene
	rootNode.add_child(saved_scene)
	
	var playersNode = get_node("/root/Map1/Spawners")
	var players = playersNode.get_children()
	
	var all = true
	var player
	
	for child in players:
		if ( child.get_player_num() -1 ) == currentPlayer:
			player = child
			child.finished_game()
			if child.check_win():
				child.play_animation(CharactersManager.WIN_ANIM)
			#break
		print("have i won? ", child.get_iAlreadyWon())
		if child.get_iAlreadyWon():
			SavingManager.winning_players.append(child)
	print(all)
	if SavingManager.winning_players.size() == SettingsManager.num_of_players:
		player.all_won_game()
			
	
	

	
	#var timer_node = get_node("/root/Map1/PlayTimer")
	#timer_node.start(1)
