extends Spatial

#onready var evaluatorsIconContainer = $Evaluation/ColorRect/VBoxContainer/OtherPlayers
#onready var evaluatedIcon = $Evaluation/ColorRect/VBoxContainer/Player
#
#onready var approvedIcon = $Approved/ColorRect2/HBoxContainer/VBoxContainer/PlayerIcon
#onready var disapprovedIcon = $Disapproved/ColorRect2/HBoxContainer/VBoxContainer/PlayerIcon
#
onready var evaluationContainer = $Evaluation


onready var rewardPreview     = $Evaluation/ColorRect/VBoxContainer/VBoxContainer/RewardPreview
onready var viewportContainer = $Evaluation/ColorRect/VBoxContainer/VBoxContainer/CenterContainer/ViewportContainer
onready var centerContainer   = $Evaluation/ColorRect/VBoxContainer/VBoxContainer/CenterContainer
onready var objectPlaceHolder = $Evaluation/ColorRect/VBoxContainer/VBoxContainer/CenterContainer/ViewportContainer/Viewport/ObjectPlaceHolder

onready var screenTitle = $Evaluation/ColorRect/VBoxContainer/Instructions
onready var titlePlace = $Evaluation/ColorRect/VBoxContainer/RewardTitle2
onready var rewardTitle = $Evaluation/ColorRect/VBoxContainer/RewardTitle


onready var avatar = $Evaluation/ColorRect/PlayerAvatar



onready var skill = $Evaluation/ColorRect/VBoxContainer/VBoxContainer/SkillsBackground/SkillInfo/Skill
onready var numPoints = $Evaluation/ColorRect/VBoxContainer/VBoxContainer/SkillsBackground/SkillInfo/NumberPoints
onready var skillBackground = $Evaluation/ColorRect/VBoxContainer/VBoxContainer/SkillsBackground


onready var houseScene = preload("res://House Furniture/houseWithFurniture.tscn")

onready var background = $Evaluation/ColorRect





var playerNoLongerPlaying = false setget set_playerNoLongerPlaying, get_playerNoLongerPlaying

var iconScene = preload("res://UI/ChallengeCard/PlayerPlaceHolder.tscn")
var reward = "" setget set_reward, get_reward
var challengeTitle = "" setget set_challenge_title, get_challenge_title

var skillEvaluated = [] 
var cardType setget set_cardType, get_cardType 
var origin = "" setget set_origin, get_origin
var cardData setget set_cardData, get_cardData

func _ready():
	
	var currentPlayer = SavingManager.current_player
	var num_players = SettingsManager.num_of_players
	avatar.set_texture(CharactersManager.get_character_icon(SettingsManager.players[currentPlayer].character))
	#titlePlace.text = "Did the player(s) successed?"
	
	
	if get_origin() == "":
		set_card_color()
		set_text_color(get_cardType())
		


		#avatar.set_texture(CharactersManager.get_character_icon(SettingsManager.players[currentPlayer].character))
		#title.text = get_challenge_title()
		titlePlace.text = get_challenge_title()
		
		reward = get_reward()
		if reward != "none":
			var objectName = "res://House Furniture/" + reward + ".tscn"
			var object = load(objectName)
			objectPlaceHolder.add_child(object.instance())
		else:
			#viewportContainer.visible = false
			set_playerNoLongerPlaying(true)
			centerContainer.visible = false

		var skillBenefit = get_skillEvaluated()

		numPoints.text = "+" + skillBenefit[1]

		var skillName = skillBenefit[0].replace(" ","")
		var skillPath = "res://Cards/Skills/" + skillName + ".png"
		var skillPhoto = load(skillPath)
		skill.texture = skillPhoto 
	
	else:
		set_card_color()
		set_text_color(get_cardType())
		#avatar.set_texture(CharactersManager.get_character_icon(SettingsManager.players[currentPlayer].character))
		#title.text = get_challenge_title()
		titlePlace.text = get_challenge_title()
		

		reward = get_reward()
		if reward != "none":
			var objectName = "res://House Furniture/" + reward + ".tscn"
			var object = load(objectName)
			objectPlaceHolder.add_child(object.instance())
		else:
			#viewportContainer.visible = false
			set_playerNoLongerPlaying(true)
			centerContainer.visible = false
			

		var skillBenefit = get_skillEvaluated()

		numPoints.text = "+" + skillBenefit[1]

		var skillName = skillBenefit[0].replace(" ","")
		var skillPath = "res://Cards/Skills/" + skillName + ".png"
		var skillPhoto = load(skillPath)
		skill.texture = skillPhoto 
	


	
	
func approve(bol):
	
#	reward = get_reward()
#	var rewardPath = "res://House Furniture/Photos/" + reward + ".png"
#	print("dentro do approve ", rewardPath)
#	var rewardPhoto = load(rewardPath)
#	rewardApproved.texture = rewardPhoto
#	rewardDisapproved.texture = rewardPhoto
#
#
#	evaluationContainer.visible = false
#	approvedContainer.visible = bol
#	disapprovedContainer.visible = not bol
	
	if bol: 
		var currentPlayer = SavingManager.current_player
		var spawners =  get_node("/root/Map1/Spawners").get_children()
		#var mapChildren = mapNode.get_children()
		
		#for child in mapChildren:
		#	if child.get_name() == "Spawners":
			#for player in child.get_children():
		var rewardToSend
		for player in spawners:
			
			if currentPlayer == (player.get_player_num() - 1):
				#player.play_animation(CharactersManager.WIN_ANIM)
				var cardReward = get_skillEvaluated()
				
				player.set_points(cardReward[0],cardReward[1])
				#var num = checkReward()
				#print(num)
				if not get_playerNoLongerPlaying():
					rewardToSend = get_reward()
					player.gained_furniture(rewardToSend)
				
				break
				#break
		if not get_playerNoLongerPlaying():
			show_house(rewardToSend)
		else:
			show_map("skill")
	
	else:
		show_map("lost")
	
func set_card_data(dataReceived):
	set_cardData(dataReceived)
	set_reward(dataReceived[11])
	set_challenge_title(dataReceived[1])
	set_skillEvaluated(dataReceived[9], dataReceived[7])
	#reward = reward.replace(" ", "")
	
func set_reward(rew):
	reward = rew
	
func get_reward():
	return reward
	
func set_challenge_title(title):
	challengeTitle = title

func get_challenge_title():
	return challengeTitle
	
func set_skillEvaluated(skill, value):
	skillEvaluated.append(skill)
	skillEvaluated.append(value)
	
func get_skillEvaluated():
	return skillEvaluated


func show_house(reward):
	
	var rootNode = get_node("/root")
	var current_player = SavingManager.current_player
	
	var canvasNode = get_node("/root/Map1/CanvasLayer")
	canvasNode.enable_additional_info()
	
	var currentCard = rootNode.get_child(0)
	currentCard.queue_free()
	
	var house = houseScene.instance()
	house.set_lattestReward(reward)
	rootNode.add_child(house)
	rootNode.move_child(house,0)
	
	#Save current Map as global to use later
	var game_node = get_node("/root/Map1")
	SavingManager.saved_scene = game_node 
	
	
	if rootNode.is_a_parent_of(game_node):
		rootNode.call_deferred("remove_child", game_node)
		
		
func show_map(origin):
	var root_node = get_node("/root")
	var current_player = SavingManager.current_player

	var currentCard = root_node.get_child(0)
	currentCard.queue_free()



	#var mapNode =  get_node("/root/Map1")
	#print(mapNode.get_children())
	#var mapChildren = mapNode.get_children()
	
	var canvasNode = get_node("/root/Map1/CanvasLayer")
	canvasNode.enable_additional_info()
	
	var playersNode = get_node("/root/Map1/Spawners")
	var players = playersNode.get_children()
	

	
	var player


	var numPlayers =  SettingsManager.num_of_players
	for child in players:
		if ( child.get_player_num() -1 ) == current_player:
			player = child
			child.finished_game()
			if origin == "lost":
				child.play_animation(CharactersManager.LOSE_ANIM)
				#timer_node.start(3.5)
			#break
			elif origin == "skill":
				child.play_animation(CharactersManager.WIN_ANIM)
		
		
			
	
func set_playerNoLongerPlaying(bol):
	playerNoLongerPlaying = bol
	
func get_playerNoLongerPlaying():
	return playerNoLongerPlaying
	
	
func set_cardType(type):
	cardType = type
	
	
func get_cardType():
	return cardType
	
func set_card_color():
	var colors = get_cardType()
	
	background.color = colors[1]
	skillBackground.color = colors[0]
	
	titlePlace.set("custom_colors/font_color", colors[2])
	titlePlace.set("custom_colors/font_outline_modulate", colors[0])

	screenTitle.set("custom_colors/font_color", colors[0])
	screenTitle.set("custom_colors/font_outline_modulate", colors[2])
	
	rewardTitle.set("custom_colors/font_color", colors[0])
	rewardTitle.set("custom_colors/font_outline_modulate", colors[2])
	
	numPoints.set("custom_colors/font_color", colors[0])
	numPoints.set("custom_colors/font_outline_modulate", colors[2])
	


func go_back():
	var root_node = get_node("/root")
	

	var currentCard = root_node.get_child(0)
	currentCard.queue_free()
	
	var cardScene = load("res://UI/ChallengeCard/NewCard.tscn")
	var cardInstance = cardScene.instance()

	cardInstance.set_origin("back")
	cardInstance.set_card_data(get_cardData())
	cardInstance.set_cardType(get_cardType())

	
	root_node.add_child(cardInstance)
	root_node.move_child(cardInstance,0)



func set_origin(orig):
	origin = orig
	
func get_origin():
	return origin
	
func set_cardData(data):
	cardData = data
	
func get_cardData():
	return cardData

func set_text_color(colors):
	titlePlace.set("custom_colors/font_color", colors[2])
	titlePlace.set("custom_colors/font_outline_modulate", colors[0])
	



