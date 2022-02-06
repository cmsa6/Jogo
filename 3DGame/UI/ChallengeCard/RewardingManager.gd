extends HBoxContainer

onready var player = $CardInfo/AvatarIcon
onready var rewardPlaceHolder = $CardInfo/RewardPlaceholder

signal save_card_data(data)

var reward = "" setget set_reward, get_reward
var rng = RandomNumberGenerator.new()

func _ready():
	var playerTurn = SavingManager.current_player
	player.set_texture(CharactersManager.get_character_icon(SettingsManager.players[playerTurn].character))
	
	#escolhe randomnly um valor que corresponde a uma carta
	var randomFile = select_random_file()
	
	var fileName = "res://Cards/Cognitive Card/" + randomFile
	print("it selected the file ", fileName)
	var file = File.new()
	file.open(fileName, File.READ)
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
	emit_signal("save_card_data", newcontent)
	
	print(reward)
	
func set_reward(rewardReceived):
	reward = rewardReceived
	
func get_reward():
	return reward
	

func select_random_file():
	var files = []
	var dir = Directory.new()
	dir.open("res://Cards/Cognitive Card/")
	dir.list_dir_begin()
	
	while true:
		var file = dir.get_next()
		if file == "":
			break
		elif not file.begins_with("."):
			files.append(file)

	dir.list_dir_end()

	rng.randomize()
	var fileSelected = rng.randi_range(0, files.size() - 1)
	return files[fileSelected]
