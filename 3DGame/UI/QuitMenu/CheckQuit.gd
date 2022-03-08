extends Spatial


onready var avatar = $Control/QuitManager/QuitInfo/HBoxContainer/Avatar
onready var avatarName = $Control/QuitManager/QuitInfo/HBoxContainer/PlayerName

var player = -1 setget set_player, get_player

func _ready():
	var mapNode = get_node("/root/Map1/CanvasLayer")
	mapNode.disable_additional_info()
	var current_player = get_player()
	if current_player == -1:
		current_player = SavingManager.current_player
	avatar.set_texture(CharactersManager.get_character_icon(SettingsManager.players[current_player].character))
	avatarName.text = "Jogador " + str(current_player + 1)
	
	
	
func set_player(num):
	player = num
	
func get_player():
	return player
	
	
	


