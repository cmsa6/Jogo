extends VBoxContainer

onready var rewardPlaceHolder = $RewardPlaceholder

export(NodePath) var playerAvatar
export(NodePath) var ChallengeTitle


signal save_card_data(data)
signal update_card_status(card_title)

var reward = "" setget set_reward, get_reward
var rng = RandomNumberGenerator.new()

func _ready():
	#escolhe randomnly um valor que corresponde a uma carta
	var randomFile = select_random_file()
	
	var fileName = "res://Cards/Cognitive Card/" + randomFile
	print("it selected the file ", fileName)
	var file = File.new()
	file.open(fileName, File.READ)
	var content = file.get_as_text()
	file.close()
	
	var newcontent = content.split("|")
	
	#emit_signal("update_card_status", newcontent[1])
	set_card_status(newcontent[1])
	
	
#	var reward = newcontent[11]
#	reward = reward.replace(" ", "")
	reward = check_player_rewards()
	
	newcontent.append("REWARD")
	#reward = " " + reward
	newcontent.append(reward) 
	
	var rewardPath = "res://House Furniture/Photos/" + reward + ".png"
	var rewardPhoto = load(rewardPath)

	rewardPlaceHolder.texture = rewardPhoto
	emit_signal("save_card_data", newcontent)
	
	
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
	
func check_player_rewards():
	var currentPlayer = SavingManager.current_player
	var mapNode =  get_node("/root/Map1")
	var mapChildren = mapNode.get_children()
	
	for child in mapChildren:
		if child.get_name() == "Spawners":
			for player in child.get_children():
				if currentPlayer == (player.get_player_num() - 1):
					return player.get_random_reward()


func set_card_status(cardTitle):
	var currentPlayer = SavingManager.current_player
	get_node(playerAvatar).set_texture(CharactersManager.get_character_icon(SettingsManager.players[currentPlayer].character))
	
	var title = get_node(ChallengeTitle)
	title.text =  cardTitle
