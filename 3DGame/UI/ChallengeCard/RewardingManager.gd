extends HBoxContainer

onready var player = $CardInfo/AvatarIcon
onready var rewardPlaceHolder = $CardInfo/RewardPlaceholder

signal save_reward(reward)

func _ready():
	print("preview")
	print(SavingManager.current_player)
	var playerTurn = SavingManager.current_player
	player.set_texture(CharactersManager.get_character_icon(SettingsManager.players[playerTurn].character))
	
	#escolhe randomnly um valor que corresponde a uma carta
	var file = File.new()
	file.open("res://Cards/Cognitive Card/Jogo da Memoria.tres", File.READ)
	var content = file.get_as_text()
	file.close()
	
	var newcontent = content.split("|")
	
	var reward = newcontent[11]
	reward = reward.replace(" ", "")
	var rewardPath = "res://House Furniture/Photos/" + reward + ".png"
	var rewardPhoto = load(rewardPath)

	#var rewardScene = load(rewardPath)
	#var rewardInstance = rewardPlaceHolder
	#rewardPlaceHolder.add_child(rewardInstance)
	rewardPlaceHolder.texture = rewardPhoto
	emit_signal("save_reward", reward)
	
	print(reward)
	
	
