extends HBoxContainer

#onready var rewardPlaceHolder = $RewardPlaceholder

onready var objectPlaceHolder = $CenterContainer/ViewportContainer/Viewport/ObjectPlaceHolder
onready var viewportContainer = $CenterContainer/ViewportContainer


export(NodePath) var numPoints
export(NodePath) var skill
export(NodePath) var rewardTitle

var type setget set_type, get_type
var cardData setget set_cardData, get_cardData

export(NodePath) var playerAvatar
export(NodePath) var ChallengeTitle
#export(NodePath) var title
export(NodePath) var backgroundColor
export(NodePath) var SkillBackgroundColor


signal save_card_data(data)
signal save_card_type(type)
signal save_cardTypeName(typeName)
signal update_card_status(card_title)
signal save_cardId(card_Id)
signal talk(text)

var reward     = "" setget set_reward, get_reward
var origin     = "" setget set_origin, get_origin
var rewardSkip = "" setget set_rewardSkip, get_rewardSkip
var cardTypeName = "" setget set_cardTypeName, get_cardTypeName

var rng = RandomNumberGenerator.new()

func _ready():
	#escolhe randomnly um valor que corresponde a uma carta
	if get_origin() == "" or get_origin() == "skip":
		
		var cardType = get_type()
		emit_signal("save_cardTypeName", cardType)
		var language = SettingsManager.language
		
		var randomFile = select_random_file_name(cardType)
		var fileName = "res://Cards/" + str(language) + "/" + str(cardType) + "/" + randomFile
		
		
	
		
		var file = File.new()
		file.open(fileName, File.READ)
		var content = file.get_as_text()
		file.close()
		
		var newcontent = content.split("|")

		
		set_card_status(newcontent[1])
		
		var reward
		if get_origin() == "skip":
			reward = get_rewardSkip()
		else:
			reward = check_player_rewards()
		
		newcontent.append("REWARD")
		newcontent.append(reward) 
		
		if reward != "none":
			var objectName = "res://House Furniture/" + reward + ".tscn"
			var object = load(objectName)
			objectPlaceHolder.add_child(object.instance())
		else:
			#viewportContainer.visible = false
			self.visible = false

		
		get_node(numPoints).text = "+" + newcontent[7] 
		var skillDev = newcontent[9].replace(" ","")
		
		var skillPath = "res://Cards/Skills/" + skillDev + ".png"
		var skillPhoto = load(skillPath)
		get_node(skill).texture = skillPhoto
		
		emit_signal("save_card_data", newcontent)
		
		var colors = get_type_colors(type)
		set_cardColor(colors)
		

		emit_signal("save_card_type", colors)
		emit_signal("save_cardId", randomFile)
		
	elif get_origin() == "back":		
		set_card_status(get_cardData()[1]) 
		var reward = get_cardData()[11]
		if reward != "none":
			var objectName = "res://House Furniture/" + reward + ".tscn"
			var object = load(objectName)
			objectPlaceHolder.add_child(object.instance())
		else:
			#viewportContainer.visible = false
			self.visible = false

		
		get_node(numPoints).text = "+" + get_cardData()[7]
		var skillDev = get_cardData()[9].replace(" ","")
	
		
		var skillPath = "res://Cards/Skills/" + skillDev + ".png"
		var skillPhoto = load(skillPath)
		get_node(skill).texture = skillPhoto
		
		set_cardColor(get_type())
		
		emit_signal("save_card_data", get_cardData())

		emit_signal("save_card_type", get_type())
	
	
	
	
func set_reward(rewardReceived):
	reward = rewardReceived
	
func get_reward():
	return reward
	

#func select_random_file(folder):
#	var files = []
#	var dir = Directory.new()
#	var folderName = "res://Cards/" + str(folder) + "/"
#	#dir.open("res://Cards/Cognitive Card/")
#	dir.open(folderName)
#	dir.list_dir_begin()
#
#	while true:
#		var file = dir.get_next()
#		if file == "":
#			break
#		elif not file.begins_with("."):
#			files.append(file)
#
#	dir.list_dir_end()
#
#	rng.randomize()
#	var fileSelected = rng.randi_range(0, files.size() - 1)
#	return files[fileSelected]
#
	
func select_random_file_name(folder):
	var files = [] 
	
	#these files will already be in the designated language
	files = check_challenge_array(folder)
	#print(files)
		
	if files.size() == 0:
		ChallengesManager.register_cards(folder)
		files  = check_challenge_array(folder)
		
	rng.randomize()
	var fileSelected = rng.randi_range(0, files.size() - 1)
	var file = files[fileSelected]
	files.remove(fileSelected)
	#print(files)
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
	
	
	if SettingsManager.get_ttsEnabled():
		emit_signal("talk", cardTitle)


func set_type(t):
	type = t
	
func get_type():
	return type
	
func get_type_colors(type):
	var fontColor    = Color8(0, 0, 0, 255)
	var backColor    = Color8(0, 0, 0, 255)
	var outlineColor = Color8(0, 0, 0, 255)
	
	if type == "COMMERCIAL":
		backColor    = Color8(244, 202, 156, 200)
		fontColor    = Color8(223, 135, 31, 255)
		outlineColor = Color8(159, 86, 0, 255)
		
	elif type == "SERVICES":
		backColor    = Color8(180, 193, 149, 200)
		fontColor    = Color8(81, 132, 26, 255)
		outlineColor = Color8(56, 100, 7, 255)
		
	elif type == "LEISURE":
		backColor    = Color8(231, 189, 232, 200)
		fontColor    = Color8(186, 74, 169, 255)
		outlineColor = Color8(116, 19, 101, 255)
		
	elif type == "HELP":		
		fontColor    = Color8(74, 139, 186, 255)
		outlineColor = Color8(15, 86, 177, 255)
		backColor    = Color8(184, 206, 222, 200)
		
	return [fontColor, backColor, outlineColor]
	
	
func set_cardColor(colors):
	
	#var card = get_node(cardColor)
	var background = get_node(backgroundColor)
	var skillBackground = get_node(SkillBackgroundColor)
	#var titleFont = get_node(title)
	var challengeTitlefont = get_node(ChallengeTitle)
	var numPointsFont = get_node(numPoints)
	
	var rewardTitleText = get_node(rewardTitle)
	
	var fontColor    = colors[0]
	var backColor    = colors[1]
	var outlineColor = colors[2]
	
	
	
		
		
		
	background.color = backColor
	skillBackground.color = fontColor
	#titleFont.set("custom_colors/font_color", fontColor)
	#titleFont.set("custom_colors/font_outline_modulate", outlineColor)
	
	#challengeTitlefont.set("custom_colors/font_color", outlineColor)
	#challengeTitlefont.set("custom_colors/font_outline_modulate", fontColor)
	
	challengeTitlefont.set("custom_colors/font_color", fontColor)
	challengeTitlefont.set("custom_colors/font_outline_modulate", outlineColor)
	
	rewardTitleText.set("custom_colors/font_color", fontColor)
	rewardTitleText.set("custom_colors/font_outline_modulate", outlineColor)

	numPointsFont.set("custom_colors/font_color", fontColor)
	numPointsFont.set("custom_colors/font_outline_modulate", outlineColor)
	

	
	
func set_origin(orig):
	origin = orig

func get_origin():
	return origin
	
func set_cardData(data):
	cardData = data
	
func get_cardData():
	return cardData
	
func set_rewardSkip(r):
	rewardSkip = r
	
func get_rewardSkip():
	return rewardSkip


func set_cardTypeName(name):
	cardTypeName = name
	
func get_cardTypeName():
	return cardTypeName
