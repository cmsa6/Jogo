extends TextureButton

var screenOrigin setget set_screenOrigin, get_screenOrigin
var checkingSkills setget set_checkingSkills, get_checkingSkills



func _input(event):
	if event.is_action_released("ui_select") and not self.disabled and self.visible:
		#if event.as_text() == "M":
			#print("//////////////parent name: ", get_parent().get_name())
		emit_signal("pressed")
			
#func _process(delta):
#	if Input.is_action_just_released("ExitHouse"):
#		print("im exiting the house")
#		back_to_map()


		
func back_to_map():
	var rootNode = get_node("/root")
	
	var currentCard = rootNode.get_child(0)
	currentCard.queue_free()
	
	var currentPlayer = SavingManager.current_player
	
	var isItCheckingSkills = get_checkingSkills()
	var origin = get_screenOrigin()

	
	# Load saved scene
	#if isItCheckingSkills:
	#	set_checkingSkills(false)
	#	var scoreInfo = get_node("/root/FurnishedHouse/ScoreInfo/ScoreInfoManager")
	#	scoreInfo.show_bar()
	#	scoreInfo.enable_points()
	#	return

	
	if origin == "Map":
		var saved_scene = SavingManager.saved_scene
		rootNode.add_child(saved_scene)
		print("the orgiin is ", get_screenOrigin())
		

		
		
		
	elif origin != "Map" and (not isItCheckingSkills):
		var saved_scene = SavingManager.saved_scene
		rootNode.add_child(saved_scene)

		var playersNode = get_node("/root/Map1/Spawners")
		var players = playersNode.get_children()
		
		var all = true
		var player
		var onePlayerWon = false
		
		print("number of children in button of housewithforniture: ", players.size())
		for child in players:
			print("child ",  child.get_player_num() -1)
			if ( child.get_player_num() -1 ) == currentPlayer:
				player = child
				child.finished_game()
				if child.check_win():
					child.play_animation(CharactersManager.WIN_ANIM)
				else:
					child.play_animation(CharactersManager.WIN_ANIM)
				#break
			print("have i won? ", child.get_iAlreadyWon())
			if child.get_iAlreadyWon() and (not SavingManager.winning_players.has(child)):
				print("adicionei este player aos vencedores")
				SavingManager.winning_players.append(child)
				onePlayerWon = true
				
		print("# winning players: ", SavingManager.winning_players.size())
		print("total players: ", SettingsManager.num_of_players )
		if SavingManager.winning_players.size() == SettingsManager.num_of_players:
			print("todos ganahram")
			player.all_won_game()
		elif onePlayerWon and SettingsManager.num_of_players >= 2:
			var quitScreen = load("res://UI/QuitMenu/CheckQuit.tscn")
			var quitNode = quitScreen.instance()
			quitNode.set_origin("Won")
			quitNode.set_player(currentPlayer)
			rootNode.add_child(quitNode)
			rootNode.move_child(quitNode,0)
			
		var cellNode = get_node("/root/Map1/Cells")
		var cells = cellNode.get_children()
		
		for cell in cells:
			cell.set_doNotPlay(true)
			
	
	

	
	#var timer_node = get_node("/root/Map1/PlayTimer")
	#timer_node.start(1)
	
	
func set_screenOrigin(orig):
	print("setting screeorig to ", orig)
	screenOrigin = orig
	
func get_screenOrigin():
	return screenOrigin
	
func set_checkingSkills(bol):
	checkingSkills = bol
	
func get_checkingSkills():
	return checkingSkills
	
func disable_and_hide(bol):
	if bol:
		self.visible  = false
		self.disabled = true
	else: 
		self.visible  = true
		self.disabled = false
