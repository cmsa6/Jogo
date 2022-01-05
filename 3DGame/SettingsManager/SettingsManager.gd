extends Node

# type of game
enum GAME_TYPE {
	SINGLE,
	LOCAL_MULTI,
}
var game_type = null

# Players
var players = []
var num_of_players = 0

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
	
func create_players():
	for i in range(0, num_of_players):
		var player = Player.new()
		player.character = null
		if i == 0:
			player.color = Color(1, 0, 0)
		elif i == 1:
			player.color = Color(0, 0, 1)
		
		players.insert(i, player)
