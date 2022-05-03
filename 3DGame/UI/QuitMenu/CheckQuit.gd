extends Spatial


onready var players = $Control/QuitManager/QuitInfo/PlayersContainer
onready var avatarName = $Control/QuitManager/QuitInfo/HBoxContainer/PlayerName
onready var text = $Control/QuitManager/QuitInfo/Text
onready var audio = $AudioStreamPlayer

onready var translator = $TranslationManager

var iconScene = preload("res://UI/QuitMenu/Avatar.tscn")

var player = -1 setget set_player, get_player
var origin setget set_origin, get_origin

func _ready():
	var mapNode = get_node("/root/Map1/CanvasLayer")
	mapNode.disable_additional_info()
	var current_player = get_player()
	if current_player == -1:
		current_player = SavingManager.current_player
		
	var name = SavingManager.playersNames[current_player + 1]
#	if name == "" or name == " ":
#		#avatarName.text = "Jogador " + str(current_player + 1)
#		name = "Player " + str(current_player + 1)

	#else:
	#	avatarName.text = name
	
	if get_origin() == "Won":
		audio.play(0)
		translator.translate_win(name)
		#var string = "Congratulations " + name + "! You just completed your house!! Do we want to end the game now?"
		#text.text = string
	
	#avatar.set_texture(CharactersManager.get_character_icon(SettingsManager.players[current_player].character))
	var numPlayers = SettingsManager.num_of_players
	for i in range(0, numPlayers):
		var instance = iconScene.instance()
		players.add_child(instance)
		instance.set_texture(CharactersManager.get_character_icon(SettingsManager.players[i].character))
		
	

	
	
	
func set_player(num):
	player = num
	
func get_player():
	return player
	
func set_origin(orig):
	origin = orig
	
func get_origin():
	return origin
	
	
	


