extends KinematicBody

signal play_aguen
signal player_turn_ended
signal game_finished
signal player_points_updated(points)
signal load_minigame(type)
signal walkingSound


export (int) var player_num
export (int) var speed = 16
export(NodePath) var GameManager
export (Array, String) var availableFurniture = []

var animPlayer

var target = null
var target_pos = Vector3.ZERO
var velocity = Vector3.ZERO

var is_my_turn = false
var canMove = false
var adjust = false
var target_count = 0
var cells_to_walk = 0


var furnitureGained = {}
var rng = RandomNumberGenerator.new()

var iAlreadyWon = false setget set_iAlreadyWon, get_iAlreadyWon



var QOLPoints  = {"InterpersonalRelationship" : 0, "SocialInclusion": 0, "Rights": 0, "PersonalDevelopment": 0, "Self-Determination": 0, "PhysicalWellbeing": 0, "MaterialWellbeing": 0, "EmotionalWellbeing": 0}
var CFPoints = {"CalculusandProblemSolving": 0, "Language": 0, "MemoryandAttentiontoDetail": 0, "SpatialOrientation": 0, "SocialandEmotionalWellbeing": 0}
var totalPoints = 0 setget set_totalPoints, get_totalPoints



# Info from gameManager
var gameManager
var cells_size = 0



onready var cam = $Camera
onready var arrow = $Arrow
onready var light = $Highlight

 
func _ready():
	#Spwon character
	
	var instance
	

	
	if(player_num <= SettingsManager.num_of_players):
		
		instance = CharactersManager.get_character_scene(
			SettingsManager.players[player_num - 1].character).instance()
		instance.name = "Body"
		self.add_child(instance)
		
		
		gameManager = get_node(GameManager)
		cells_size = gameManager.get_cells().size()
		
		animPlayer = $Body/AnimationPlayer
		play_animation(CharactersManager.IDLE_ANIM)
		create_furniture_array()
		SavingManager.playersSkillScores[player_num] = 0
		SavingManager.playersQOLSkills[player_num] = QOLPoints
		SavingManager.playersCFSkills[player_num] = CFPoints

		

		
		
	else:
		visible = false

func Move(dice_value):
	cells_to_walk = dice_value
	canMove = true
	is_my_turn = true
	UpdateTarget()

	
func UpdateTarget():
	target_pos = get_target_position()
	


func get_target_position():
	if target_count == 25:
		target_count = 0 
	
	
	target = gameManager.get_node_cell_by_index(target_count)
	return target.transform.origin 
		
		
		

func RotatePlayerToNextTarget():
	look_at(target_pos, Vector3.UP)
	
func player_reached_target(_body):
	
	if is_my_turn:
		target_count += 1
		cells_to_walk -= 1
#	
		if cells_to_walk > 0:
			UpdateTarget()
		
		else:

			# Player reached destiniation cell			
			if target.type == target.TYPE.GAME_COMMERCIAL || target.type == target.TYPE.GAME_LEISURE || target.type == target.TYPE.GAME_HELP || target.type == target.TYPE.GAME_SERVICES:
				var type = get_type(target.type) 
				stop_animation()
				emit_signal("load_minigame", type)
			
			elif target.type == target.TYPE.COMMERCIAL || target.type == target.TYPE.LEISURE || target.type == target.TYPE.HELP || target.type == target.TYPE.SERVICES  || target.type == target.TYPE.INIT:
				stop_animation()
				finished_game()
			canMove = false
			adjust = true
			
			
			
			play_animation(CharactersManager.IDLE_ANIM)
			


			

func _physics_process(_delta):
	if canMove:
		RotatePlayerToNextTarget()
		velocity = -transform.basis.z * speed
		if transform.origin.distance_to(target_pos) > 0.2:
			velocity = move_and_slide(velocity)
		play_animation(CharactersManager.WALK_ANIM)
		emit_signal("walkingSound")


		

# Animation controller
func play_animation(anim_name):
	animPlayer.play(anim_name)
	
func stop_animation():
	animPlayer.stop()	
	

func set_points(type, points_to_add):
	set_totalPoints(points_to_add)
	
	type = type.replace(" ", "")

	
	var category = check_type(type)
	
	var actualPoints
	var p
	var totalPoints	
	
	if category == "QOL":
	
		actualPoints = get_QOLPoints()
		p = actualPoints[type]
		totalPoints =  p + int(points_to_add)
		actualPoints[type] = totalPoints
		SavingManager.playersQOLSkills[player_num] = actualPoints
		
	elif category == "CF":
	
		actualPoints = get_CFPoints()
		p = actualPoints[type]
		totalPoints =  p + int(points_to_add)
		actualPoints[type] = totalPoints
		SavingManager.playersCFSkills[player_num] = actualPoints
	
	
	
	
func get_CFPoints():
	return CFPoints

func get_QOLPoints():
	return QOLPoints
	
func get_player_num():
	return player_num
	
	
func finished_game():
	var game_node = get_node("/root/Map1")
	SavingManager.saved_scene = game_node 
	is_my_turn = false
	play_animation(CharactersManager.IDLE_ANIM)
	UpdateTarget()
	RotatePlayerToNextTarget()
	emit_signal("play_aguen")


	emit_signal("player_turn_ended")

func create_furniture_array():
	
	var maxFurniture = availableFurniture.size()
	for i in range(0, maxFurniture):
		furnitureGained[availableFurniture[i]] = 0
	SavingManager.playersScores[player_num] = furnitureGained
	
		
func gained_furniture(furnitureId):
	furnitureGained[furnitureId] = 1

	
	SavingManager.playersScores[player_num] = furnitureGained
	
	
	var totalFurniture = 0
	var values = furnitureGained.values()
	
	
	for v in values:
		totalFurniture += v
		
	emit_signal("player_points_updated",  totalFurniture)
		

	
func get_gained_furniture():
	return furnitureGained
	
func check_win():
	
	var maxFurniture = availableFurniture.size()
	for i in range(0, maxFurniture):
		
		if furnitureGained[availableFurniture[i]] == 0:
			return false
	
	set_iAlreadyWon(true)	
	
	return true

func all_won_game():
	emit_signal("game_finished")
	
func get_random_reward():
	var maxFurniture = availableFurniture.size()
	var missingRewards = []
	for i in range(0, maxFurniture):
		if  furnitureGained[availableFurniture[i]] == 0:
			missingRewards.append(availableFurniture[i])
	
		

	rng.randomize()
	var maxMissingRewards = missingRewards.size()
	if maxMissingRewards == 0:
		return "none"
	return missingRewards[rng.randi_range(0, maxMissingRewards-1)]
	
	 
	
func set_iAlreadyWon(bol):
	iAlreadyWon = bol
	
func get_iAlreadyWon():
	return iAlreadyWon
	
func get_type(cellType):
	if cellType == 5:
		return "COMMERCIAL"
	elif cellType == 6:
		return "SERVICES"
	elif cellType == 7:
		return "LEISURE"
	elif cellType == 8:
		return "HELP"
	

func set_totalPoints(points):
	totalPoints = int(totalPoints) + int(points)
	SavingManager.playersSkillScores[player_num] = totalPoints

	
	
func get_totalPoints():
	return totalPoints
	
func check_type(type): 
	if type == "InterpersonalRelationship" or type == "SocialInclusion" or type == "Rights" or type == "PersonalDevelopment" or type == "Self-Determination" or type == "PhysicalWellbeing" or type == "MaterialWellbeing" or type == "EmotionalWellbeing":
		return "QOL"
	elif type == "CalculusandProblemSolving" or type == "Language" or type == "MemoryandAttentiontoDetail" or type == "SpatialOrientation" or type == "SocialandEmotionalWellbeing": 
		return "CF"


func show_arrow(playerTurn):

	if playerTurn == (player_num - 1):
		arrow.visible = true

	else:
		arrow.visible = false

		
		

	
