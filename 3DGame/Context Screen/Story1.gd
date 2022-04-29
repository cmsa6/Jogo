extends ColorRect

onready var welcomeText = $VBoxContainer/WelcomeText
onready var players = $VBoxContainer/PlayersList

var iconScene = preload("res://UI/QuitMenu/Avatar.tscn")

func _ready():
	print("ready dos textos")
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
		
