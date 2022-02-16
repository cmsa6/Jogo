extends Node

signal on_players_turn_changed(playersTurn)
export (Array, NodePath) var cells = [] setget , get_cells 
export (Array, NodePath) var players = []
#export (NodePath) var timerNode

# Players Manager
var playersTurn = 0




func _ready():
	get_node("/root/Map1/MainCam").make_current()
	remove_players()
	start_game()
	print("atualizei o current_player para 0")
	SavingManager.current_player = 0
#	get_node(timerNode).start(1.2)
	

func start_game():
	# for now starts player one	
	emit_signal("on_players_turn_changed", playersTurn)
	#print("DEI UPDATE")
	#SavingManager.current_player = playersTurn
	UpdateActivePlayersCam()

func get_cells():
	return cells

func get_cell_by_index(index):
	return cells[index]

func get_node_cell_by_index(index):
	return get_node(cells[index])

func _on_Dado_dice_used(value):
	print("////// estou na funcao on_dado_dice_used || PLAYER: ", playersTurn)
	var player = get_player_by_index(playersTurn)
	player.Move(value)

func UpdatePlayersTurn():
	playersTurn += 1
	SavingManager.current_player = playersTurn
	if playersTurn >= players.size():
		playersTurn = 0
		SavingManager.current_player = 0
		print("atualizei o current_player para 0")
	else:
		print("atualizei o current_player para ", playersTurn)
	emit_signal("on_players_turn_changed", playersTurn)
	#SavingManager.current_player = playersTurn
	#print("DEI UPDATE")
	#print(SavingManager.current_player)
	
	#UpdateActivePlayersCam()

func get_player_by_index(index):
	return get_node(players[index])
	
func UpdateActivePlayersCam():
	for player_index in len(players):
		if player_index == playersTurn:
			pass
			#get_player_by_index(player_index).cam.make_current()

func remove_players():
	var num_players = SettingsManager.num_of_players
	
	# Disable other players
	for player_index in len(players):
		if player_index >= num_players:
			get_player_by_index(player_index).visible = false
	
	# Remove them from players list
	var aux = players.slice(0, num_players - 1)
	players = aux
