extends Spatial

#onready var evaluatorsIconContainer = $Evaluation/ColorRect/VBoxContainer/OtherPlayers
#onready var evaluatedIcon = $Evaluation/ColorRect/VBoxContainer/Player
#
#onready var approvedIcon = $Approved/ColorRect2/HBoxContainer/VBoxContainer/PlayerIcon
#onready var disapprovedIcon = $Disapproved/ColorRect2/HBoxContainer/VBoxContainer/PlayerIcon
#
onready var evaluationContainer = $Evaluation
onready var approvedContainer = $Approved
onready var disapprovedContainer = $Disapproved
#
onready var rewardApproved = $Approved/ColorRect2/HBoxContainer/VBoxContainer/RewardPhotoPlaceholder
onready var rewardDisapproved = $Disapproved/ColorRect2/HBoxContainer/VBoxContainer/RewardPhotoPlaceholder
onready var rewardPreview = $Evaluation/ColorRect/VBoxContainer/VBoxContainer/HBoxContainer/RewardPreview

onready var title = $Evaluation/ColorRect/CardHeader/VBoxContainer/ChallengeTitle
onready var approvedTitle = $Approved/ColorRect2/CardHeader/VBoxContainer/ChallengeTitle
onready var disapprovedTitle = $Disapproved/ColorRect2/CardHeader/VBoxContainer/ChallengeTitle

onready var avatar = $Evaluation/ColorRect/CardHeader/PlayerAvatar
onready var approvedIcon = $Approved/ColorRect2/CardHeader/PlayerAvatar
onready var disapprovedIcon = $Disapproved/ColorRect2/CardHeader/PlayerAvatar


onready var skill = $Evaluation/ColorRect/VBoxContainer/VBoxContainer/HBoxContainer/HBoxContainer/Skill
onready var numPoints = $Evaluation/ColorRect/VBoxContainer/VBoxContainer/HBoxContainer/HBoxContainer/NumberPoints 

onready var houseScene = preload("res://House Furniture/houseWithFurniture.tscn")



var playerNoLongerPlaying = false setget set_playerNoLongerPlaying, get_playerNoLongerPlaying

var iconScene = preload("res://UI/ChallengeCard/PlayerPlaceHolder.tscn")
var reward = "" setget set_card_data, get_reward
var challengeTitle = "" setget set_challenge_title, get_challenge_title

var skillEvaluated = [] 

func _ready():
	var currentPlayer = SavingManager.current_player
	print("player atual, ", currentPlayer)
	var num_players = SettingsManager.num_of_players
	
#	for i in range(0, num_players):
#		if i != currentPlayer:
#			var instance = iconScene.instance()
#			evaluatorsIconContainer.add_child(instance)
#			instance.set_icon(CharactersManager.get_character_icon(SettingsManager.players[i].character))
#
#		i += 1
#
#	evaluatedIcon.set_texture(CharactersManager.get_character_icon(SettingsManager.players[currentPlayer].character))
	
	approvedIcon.set_texture(CharactersManager.get_character_icon(SettingsManager.players[currentPlayer].character))
	disapprovedIcon.set_texture(CharactersManager.get_character_icon(SettingsManager.players[currentPlayer].character))
	
	avatar.set_texture(CharactersManager.get_character_icon(SettingsManager.players[currentPlayer].character))
	title.text = get_challenge_title()
	approvedTitle.text = get_challenge_title()
	disapprovedTitle.text = get_challenge_title()
	
	reward = get_reward()
	if reward != "none":
		var rewardPath = "res://House Furniture/Photos/" + reward + ".png"
		var rewardPhoto = load(rewardPath)
		rewardPreview.texture = rewardPhoto
	else:
		rewardPreview.visible = false
		set_playerNoLongerPlaying(true)
	
	var skillBenefit = get_skillEvaluated()
	
	numPoints.text = skillBenefit[1]
	
	var skillName = skillBenefit[0].replace(" ","")
	var skillPath = "res://Cards/Skills/" + skillName + ".png"
	var skillPhoto = load(skillPath)
	skill.texture = skillPhoto 
	
	
func approve(bol):
	print("no approve")
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
		for player in spawners:
			
			if currentPlayer == (player.get_player_num() - 1):
				print("i approved")
				#player.play_animation(CharactersManager.WIN_ANIM)
				var cardReward = get_skillEvaluated()
				
				player.set_points(cardReward[0],cardReward[1])
				#var num = checkReward()
				#print(num)
				if not get_playerNoLongerPlaying():
					var rewardToSend = get_reward()
					player.gained_furniture(rewardToSend)
				
				break
				#break
		if not get_playerNoLongerPlaying():
			show_house()
		else:
			show_map()
	
	else:
		show_map()
	
func set_card_data(dataReceived):
	print(dataReceived)
	reward = dataReceived[11]
	set_challenge_title(dataReceived[1])
	set_skillEvaluated(dataReceived[9], dataReceived[7])
	#reward = reward.replace(" ", "")
	print("e dei set da reward como ", reward)
	
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


func show_house():
	
	var rootNode = get_node("/root")
	var current_player = SavingManager.current_player
	
	var canvasNode = get_node("/root/Map1/CanvasLayer")
	canvasNode.enable_additional_info()
	
	var currentCard = rootNode.get_child(0)
	currentCard.queue_free()
	
	var house = houseScene.instance()
	rootNode.add_child(house)
	rootNode.move_child(house,0)
	
	#Save current Map as global to use later
	var game_node = get_node("/root/Map1")
	SavingManager.saved_scene = game_node 
	
	
	if rootNode.is_a_parent_of(game_node):
		rootNode.call_deferred("remove_child", game_node)
		
		
func show_map():
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

	print("num players: ", players.size())
	var numPlayers =  SettingsManager.num_of_players
	for child in players:
		if ( child.get_player_num() -1 ) == current_player:
			player = child
			child.finished_game()
			child.play_animation(CharactersManager.LOSE_ANIM)
				#timer_node.start(3.5)
			#break
		
		
			
	
func set_playerNoLongerPlaying(bol):
	playerNoLongerPlaying = bol
	
func get_playerNoLongerPlaying():
	return playerNoLongerPlaying
