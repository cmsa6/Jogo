extends TextureButton

var screenOrigin setget set_screenOrigin, get_screenOrigin

func _input(event):
	if event.is_action_released("ExitHouse"):
		if event.as_text() == "M":
			back_to_map()
			
#func _process(delta):
#	if Input.is_action_just_released("ExitHouse"):
#		print("im exiting the house")
#		back_to_map()
		
func back_to_map():
	var rootNode = get_node("/root")
	
	var currentCard = rootNode.get_child(0)
	print("firstChild")	
	print(currentCard)
	currentCard.queue_free()
	print(rootNode.get_children())
	
	var currentPlayer = SavingManager.current_player
	
	# Load saved scene
	var saved_scene = SavingManager.saved_scene
	rootNode.add_child(saved_scene)
	print("the orgiin is ", get_screenOrigin())
	
	if get_screenOrigin() == "Map":
		#var game_node = get_node("/root/Map1")
		#SavingManager.saved_scene = game_node 
		pass
		
		
	else:
		print("entrei mas nao devia ter entrado")
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
				else:
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
	
	
func set_screenOrigin(orig):
	print("setting screeorig to ", orig)
	screenOrigin = orig
	
func get_screenOrigin():
	return screenOrigin
