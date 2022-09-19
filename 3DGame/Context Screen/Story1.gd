extends ColorRect

onready var welcomeText = $HBoxContainer/VBoxContainer/WelcomeText
onready var players = $HBoxContainer/VBoxContainer/PlayersList

var iconScene = preload("res://Context Screen/AvatarImage.tscn")

signal talk(text)

func _ready():
	var numPlayers = SettingsManager.num_of_players
	var playersNames = SavingManager.playersNames
	
	
	for i in range(0, numPlayers):
		welcomeText.text += playersNames[i+1]
		if numPlayers > 1 and i != (numPlayers - 1):
			welcomeText.text = welcomeText.text + ", "
		
		var instance = iconScene.instance()
		players.add_child(instance)
		instance.set_texture(CharactersManager.get_character_icon(SettingsManager.players[i].character))
	welcomeText.text = welcomeText.text + "!"
	
	#SettingsManager.set_ttsEnabled(true)
	#if SettingsManager.get_ttsEnabled():
	#	emit_signal("talk", welcomeText.text)
	
		
