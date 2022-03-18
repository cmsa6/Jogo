extends VBoxContainer

onready var rewardPlaceHolder = $RewardPlaceholder
export(NodePath) var numPoints
export(NodePath) var skill

var type setget set_type, get_type

export(NodePath) var playerAvatar
export(NodePath) var ChallengeTitle


signal save_card_data(data)
signal update_card_status(card_title)

var reward = "" setget set_reward, get_reward
var rng = RandomNumberGenerator.new()

func _ready():
	#escolhe randomnly um valor que corresponde a uma carta
	var cardType = get_type()
	#var randomFile = select_random_file(cardType)
	
	var randomFile = select_random_file_name(cardType)
	var fileName = "res://Cards/" + str(cardType) + "/" + randomFile
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
	
	if reward != "none":
		var rewardPath = "res://House Furniture/Photos/" + reward + ".png"
		var rewardPhoto = load(rewardPath)
		rewardPlaceHolder.texture = rewardPhoto
	else:
		rewardPlaceHolder.visible = false
	
	get_node(numPoints).text = newcontent[7] 
	var skillDev = newcontent[9].replace(" ","")
	print("skill being developed: ", skillDev)
	var skillPath = "res://Cards/Skills/" + skillDev + ".png"
	var skillPhoto = load(skillPath)
	get_node(skill).texture = skillPhoto
	
	emit_signal("save_card_data", newcontent)
	
	
func set_reward(rewardReceived):
	reward = rewardReceived
	
func get_reward():
	return reward
	

func select_random_file(folder):
	var files = []
	var dir = Directory.new()
	var folderName = "res://Cards/" + str(folder) + "/"
	#dir.open("res://Cards/Cognitive Card/")
	dir.open(folderName)
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
	
	
func select_random_file_name(folder):
	var files = [] 
	
	files = check_challenge_array(folder)

		
		
	if files.size() == 0:
		ChallengesManager.register_cards(folder)
		files  = check_challenge_array(folder)
		
	rng.randomize()
	var fileSelected = rng.randi_range(0, files.size() - 1)
	var file = files[fileSelected]
	files.remove(fileSelected)
	return file
	
	
func check_challenge_array(folder):
	if folder == "COMMERCIAL":
		return ChallengesManager.COMMERCIAL_challenges
	elif folder == "LEISURE":
		return  ChallengesManager.LEISURE_challenges
	elif folder == "HELP":
		return  ChallengesManager.HELP_challenges
	elif folder == "SERVICES":
		return  ChallengesManager.SERVICES_challenges
	
	
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


func set_type(t):
	type = t
	
func get_type():
	return type
