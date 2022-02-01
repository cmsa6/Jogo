extends ColorRect

onready var diceContainerAvatar = $DiceContainer/HBoxContainer/Avatar
onready var diceResumoAvatar = $DiceResumo/Avatar

func _ready():
	print("SETTING IMAGES")
	var current_player = SavingManager.current_player
	diceContainerAvatar.set_texture(CharactersManager.get_character_icon(SettingsManager.players[current_player].character))
	diceResumoAvatar.set_texture(CharactersManager.get_character_icon(SettingsManager.players[current_player].character))


	

