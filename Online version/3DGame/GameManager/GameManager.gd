extends Node

signal on_players_turn_changed(playersTurn)
export (Array, NodePath) var cells = [] setget , get_cells 
export (Array, NodePath) var players = []

#export (NodePath) var timerNode

# Players Manager
var playersTurn = 0

var occupations = {}




func _ready():
	get_node("/root/Map1/MainCam").make_current()
	remove_players()
	start_game()
	SavingManager.current_player = 0

	

func start_game():
	# for now starts player one	
	emit_signal("on_players_turn_changed", playersTurn)


func get_cells():
	return cells

func get_cell_by_index(index):
	return cells[index]

func get_node_cell_by_index(index):
	return get_node(cells[index])

func _on_Dado_dice_used(value):
	var player = get_player_by_index(playersTurn)
	player.Move(value)

func UpdatePlayersTurn():
	playersTurn += 1
	SavingManager.current_player = playersTurn
	if playersTurn >= players.size():
		playersTurn = 0
		SavingManager.current_player = 0
		
	emit_signal("on_players_turn_changed", playersTurn)
	#SavingManager.current_player = playersTurn

	
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


func register_occupation(playerNum, cellName):
	occupations[playerNum] = cellName
	
func get_occupations():
	return occupations
	
