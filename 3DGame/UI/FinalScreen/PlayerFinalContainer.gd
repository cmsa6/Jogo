extends VBoxContainer

onready var playerName = $Label
onready var playerAvatar = $Avatar
onready var house = $ViewportContainer/FinalViewport/FurnishedHouse




func _ready():
	pass



func show_houses(playerID):
	playerName.text = "Jogador " + str(playerID + 1)
	playerAvatar.set_texture(CharactersManager.get_character_icon(SettingsManager.players[playerID].character))
	house.show_final_house(playerID)
