extends Spatial

onready var evaluatorsIconContainer = $Evaluation/ColorRect/VBoxContainer/OtherPlayers
onready var evaluatedIcon = $Evaluation/ColorRect/VBoxContainer/Player

onready var approvedIcon = $Approved/ColorRect2/HBoxContainer/VBoxContainer/PlayerIcon
onready var disapprovedIcon = $Disapproved/ColorRect2/HBoxContainer/VBoxContainer/PlayerIcon

onready var evaluationContainer = $Evaluation
onready var approvedContainer = $Approved
onready var disapprovedContainer = $Disapproved

onready var rewardApproved = $Approved/ColorRect2/HBoxContainer/VBoxContainer/RewardPhotoPlaceholder
onready var rewardDisapproved = $Disapproved/ColorRect2/HBoxContainer/VBoxContainer/RewardPhotoPlaceholder


var iconScene = preload("res://UI/ChallengeCard/PlayerPlaceHolder.tscn")
var reward = "" setget set_card_data, get_reward

func _ready():
	var currentPlayer = SavingManager.current_player
	print("player atual, ", currentPlayer)
	var num_players = SettingsManager.num_of_players
	
	for i in range(0, num_players):
		if i != currentPlayer:
			var instance = iconScene.instance()
			evaluatorsIconContainer.add_child(instance)
			instance.set_icon(CharactersManager.get_character_icon(SettingsManager.players[i].character))
			
		i += 1
		
	evaluatedIcon.set_texture(CharactersManager.get_character_icon(SettingsManager.players[currentPlayer].character))
	approvedIcon.set_texture(CharactersManager.get_character_icon(SettingsManager.players[currentPlayer].character))
	disapprovedIcon.set_texture(CharactersManager.get_character_icon(SettingsManager.players[currentPlayer].character))
	
	
	
	
func approve(bol):
	reward = get_reward()
	var rewardPath = "res://House Furniture/Photos/" + reward + ".png"
	print("dentro do approve ", rewardPath)
	var rewardPhoto = load(rewardPath)
	rewardApproved.texture = rewardPhoto
	rewardDisapproved.texture = rewardPhoto
	
	
	evaluationContainer.visible = false
	approvedContainer.visible = bol
	disapprovedContainer.visible = not bol
	
	if bol: 
		var currentPlayer = SavingManager.current_player
		var mapNode =  get_node("/root/Map1")
		var mapChildren = mapNode.get_children()
		
		for child in mapChildren:
			if child.get_name() == "Spawners":
				for player in child.get_children():
					if currentPlayer == (player.get_player_num() - 1):
						print("i approved")
						#player.play_animation(CharactersManager.WIN_ANIM)
						player.incr_points(1)
						#var num = checkReward()
						#print(num)
						var rewardToSend = get_reward()
						player.gained_furniture(rewardToSend)
						break
				break

	
func set_card_data(dataReceived):
	print("dentro do evaluate card recevi a card data ",dataReceived)
	reward = dataReceived[11]
	#reward = reward.replace(" ", "")
	print("e dei set da reward como ", reward)
	
func get_reward():
	return reward
	
