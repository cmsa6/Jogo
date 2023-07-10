extends Control

onready var avatarImage = $Card/CardStatus/PlayerAvatar
onready var title = $Card/CardStatus/VBoxContainer/ChallengeTitle


func update_title_image(cardTitle):
	var playerTurn = SavingManager.current_player
	
	
	title.text =  cardTitle
	avatarImage.set_texture(CharactersManager.get_character_icon(SettingsManager.players[playerTurn].character))
