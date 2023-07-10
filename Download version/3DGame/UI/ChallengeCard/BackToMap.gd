extends TextureButton

onready var parent = get_parent()
onready var grandparent = parent.get_parent()
onready var grandgrandparent = grandparent.get_parent()


func _input(event):
	if (not self.disabled) and self.visible and event.is_action_pressed("RightArrow"):
		emit_signal("pressed")

	
func discardCurrentCard(eval):
	
	var root_node = get_node("/root")
	var current_player = SavingManager.current_player

	var currentCard = root_node.get_child(0)
	currentCard.queue_free()


	
	var canvasNode = get_node("/root/Map1/CanvasLayer")

	
	var playersNode = get_node("/root/Map1/Spawners")
	var players = playersNode.get_children()
	
	var player


	var numPlayers =  SettingsManager.num_of_players
	for child in players:
		if ( child.get_player_num() -1 ) == current_player:
			player = child
			child.finished_game()
			if eval == "Approved":
				if not child.check_win():
					child.play_animation(CharactersManager.WIN_ANIM)

			elif eval == "Disapproved":
				child.play_animation(CharactersManager.LOSE_ANIM)

		
	
		if child.get_iAlreadyWon():
			SavingManager.winning_players.append(child)
	
	if SavingManager.winning_players.size() == SettingsManager.num_of_players:

		player.all_won_game()
			
	

	
func discard_dice_info():
	var root_node = get_node("/root")

	var currentCard = root_node.get_child(0)
	currentCard.queue_free()
	
	var canvasNode = get_node("/root/Map1/CanvasLayer")
	canvasNode.erase_text()

	
