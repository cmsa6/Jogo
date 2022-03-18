extends Spatial


onready var avatar = $Control/QuitManager/QuitInfo/HBoxContainer/Avatar
onready var avatarName = $Control/QuitManager/QuitInfo/HBoxContainer/PlayerName
onready var text = $Control/QuitManager/QuitInfo/Text

var player = -1 setget set_player, get_player
var origin setget set_origin, get_origin

func _ready():
	var mapNode = get_node("/root/Map1/CanvasLayer")
	mapNode.disable_additional_info()
	var current_player = get_player()
	if current_player == -1:
		current_player = SavingManager.current_player
	
	if get_origin() == "Won":
		text.text = "Congratulations! You just completed your house!! Do you want to finish the game?"
	avatar.set_texture(CharactersManager.get_character_icon(SettingsManager.players[current_player].character))
	avatarName.text = "Jogador " + str(current_player + 1)
	
	
	
func set_player(num):
	player = num
	
func get_player():
	return player
	
func set_origin(orig):
	origin = orig
	
func get_origin():
	return origin
	
	
	


