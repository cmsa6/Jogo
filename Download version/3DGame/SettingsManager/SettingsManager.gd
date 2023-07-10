extends Node



enum GAME_TYPE {
	ONE_PLAYER,
	TWO_PLAYER,
	THREE_PLAYER,
	FOUR_PLAYER,
}

var game_type = null

var ttsEnabled = false setget set_ttsEnabled, get_ttsEnabled


# Players
var players = []
var num_of_players = 0
var language = "en"

class Player:
	var character
	var color

func _on_SinglePlayer_Selected():
	game_type = GAME_TYPE.SINGLE
	num_of_players = 1
	create_players()

func _on_Local_Multiplayer_Selected():
	game_type = GAME_TYPE.LOCAL_MULTI
	num_of_players = 2
	create_players()
	
func x_players_selected(x):
	if x == 1:
		game_type = GAME_TYPE.ONE_PLAYER
		num_of_players = 1
	elif x == 2:
		game_type = GAME_TYPE.TWO_PLAYER
		num_of_players = 2
	elif x == 3:
		game_type = GAME_TYPE.THREE_PLAYER
		num_of_players = 3
	elif x == 4:
		game_type = GAME_TYPE.FOUR_PLAYER
		num_of_players = 4
		
	create_players()
	
func create_players():
	for i in range(0, num_of_players):
		var player = Player.new()
		player.character = null
		if i == 0:
			player.color = Color(1, 0, 0)
		elif i == 1:
			player.color = Color(0, 0, 1)
		
		players.insert(i, player)
		
		
func set_ttsEnabled(bol):
	ttsEnabled = bol
	
func get_ttsEnabled():
	return ttsEnabled
