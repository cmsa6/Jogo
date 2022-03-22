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
#export(NodePath) var timer_node
export (Array, String) var availableFurniture = []

var animPlayer

var target = null
var target_pos = Vector3.ZERO
var velocity = Vector3.ZERO

var is_my_turn = false
var canMove = false
var target_count = 0
var cells_to_walk = 0

#var points = 0 setget incr_points

var furnitureGained = {}
var rng = RandomNumberGenerator.new()

var iAlreadyWon = false setget set_iAlreadyWon, get_iAlreadyWon


#var points = {"InterpersonalRelationship" : 0, "SocialInclusion": 0, "Rights": 0, "PersonalDevelopment": 0, "Self-Determination": 0, "PhysicalWellbeing": 0, "MaterialWellbeing": 0, "EmotionalWellbeing": 0, "CalculusandProblemSolving": 0, "Language": 0, "MemoryandAttentiontoDetail": 0, "SpatialOrientation": 0, "SocialandEmotionalWellbeing": 0}
var QOLPoints  = {"InterpersonalRelationship" : 0, "SocialInclusion": 0, "Rights": 0, "PersonalDevelopment": 0, "Self-Determination": 0, "PhysicalWellbeing": 0, "MaterialWellbeing": 0, "EmotionalWellbeing": 0}
var CFPoints = {"CalculusandProblemSolving": 0, "Language": 0, "MemoryandAttentiontoDetail": 0, "SpatialOrientation": 0, "SocialandEmotionalWellbeing": 0}
var totalPoints = 0 setget set_totalPoints, get_totalPoints



# Info from gameManager
var gameManager
var cells_size = 0



onready var cam = $Camera

 
func _ready():
	#Spwon character
	var instance
	if(player_num <= SettingsManager.num_of_players):
		print( "creating player with number: ", SettingsManager.players[player_num-1])
		instance = CharactersManager.get_character_scene(
			SettingsManager.players[player_num - 1].character).instance()
		instance.name = "Body"
		self.add_child(instance)
		print("nasci aqui: ", transform.origin)
		
		gameManager = get_node(GameManager)
		cells_size = gameManager.get_cells().size()
		
		animPlayer = $Body/AnimationPlayer
		play_animation(CharactersManager.IDLE_ANIM)
		create_furniture_array()
		SavingManager.playersSkillScores[player_num] = 0
		SavingManager.playersQOLSkills[player_num] = QOLPoints
		SavingManager.playersCFSkills[player_num] = CFPoints
		#incr_points(0)
		#set_points(0)
		

		
		
	else:
		visible = false

func Move(dice_value):
	cells_to_walk = dice_value
	canMove = true
	is_my_turn = true
	UpdateTarget()
	print("AFTER MOVE")
	print(target_pos)
	print("canMove: ", canMove)
	
func UpdateTarget():
	target_pos = get_target_position()
	#print("posicao do target: ", target_pos)

func get_target_position():
	if target_count == 25:
		target_count = 0 
	#print("trying to solve problem, target: ", target_count)
	target = gameManager.get_node_cell_by_index(target_count)
	return target.transform.origin

func RotatePlayerToNextTarget():
	look_at(target_pos, Vector3.UP)
	
func player_reached_target(_body):
	if is_my_turn:
		target_count += 1
		cells_to_walk -= 1
#		if target_count >= cells_size || target.type == target.TYPE.END:
#			print("game ended")
#			#game finished
#			canMove = false
#			play_animation(CharactersManager.IDLE_ANIM)
#			emit_signal("game_finished")
		if cells_to_walk > 0:
			UpdateTarget()
			#incr_points(1)
		else:
			# Player reached destiniation cell
			if target.type == target.TYPE.GAME_COMMERCIAL || target.type == target.TYPE.GAME_LEISURE || target.type == target.TYPE.GAME_HELP || target.type == target.TYPE.GAME_SERVICES:
				#SavingManager.current_player = player_num - 1
				#play_animation(CharactersManager.IDLE_ANIM)
				var type = get_type(target.type)
				
				#set_points(type, 1)
				#print("player points: ", get_points())
				stop_animation()
				emit_signal("load_minigame", type)
			
			elif target.type == target.TYPE.COMMERCIAL || target.type == target.TYPE.LEISURE || target.type == target.TYPE.HELP || target.type == target.TYPE.SERVICES  || target.type == target.TYPE.INIT:
				#get_node(timer_node).start(3.5)
				finished_game()
			canMove = false
			
			#is_my_turn = false
			#play_animation(CharactersManager.IDLE_ANIM)
			#UpdateTarget()
			#RotatePlayerToNextTarget()
			#emit_signal("play_aguen")
			#emit_signal("player_turn_ended")
			

func _physics_process(_delta):
	if canMove:
		print("MOving")
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
	
# Get && Set
#func incr_points(point_to_add):
func set_points(type, points_to_add):
	set_totalPoints(points_to_add)
	
	type = type.replace(" ", "")
	print(type)
	
	var category = check_type(type)
	print(category)
	var actualPoints
	var p
	var totalPoints	
	
	if category == "QOL":
		print("hello entrei no qol")
		actualPoints = get_QOLPoints()
		p = actualPoints[type]
		totalPoints =  p + int(points_to_add)
		actualPoints[type] = totalPoints
		SavingManager.playersQOLSkills[player_num] = actualPoints
		
	elif category == "CF":
		print("hello entrei no cf")
		actualPoints = get_CFPoints()
		p = actualPoints[type]
		totalPoints =  p + int(points_to_add)
		actualPoints[type] = totalPoints
		SavingManager.playersCFSkills[player_num] = actualPoints
	
	
	#var actualPoints = get_points()

	
	
	
	#points += point_to_add
	
	#print("I updated my points to ", get_points())
	
	#emit_signal("player_points_updated",  totalPoints)
	
#func get_points():
#	return points
	
func get_CFPoints():
	return CFPoints

func get_QOLPoints():
	return QOLPoints
	
func get_player_num():
	return player_num
	
	
func finished_game():
	#canMove = false
	print("finishged game")
	var game_node = get_node("/root/Map1")
	SavingManager.saved_scene = game_node 
	is_my_turn = false
	play_animation(CharactersManager.IDLE_ANIM)
	UpdateTarget()
	RotatePlayerToNextTarget()
	emit_signal("play_aguen")
	print("who am i")
	print(self)

	emit_signal("player_turn_ended")

func create_furniture_array():
	print("create array")
	var maxFurniture = availableFurniture.size()
	for i in range(0, maxFurniture):
		furnitureGained[availableFurniture[i]] = 0
	SavingManager.playersScores[player_num] = furnitureGained
	print("scores dos players: ", SavingManager.playersScores)
		
func gained_furniture(furnitureId):
	print("dentro do gained furniture: ", furnitureId)
	#furnitureGained.insert(furnitureId,1)
	furnitureGained[furnitureId] = 1
	print(furnitureGained)
	
	SavingManager.playersScores[player_num] = furnitureGained
	print("scores dos players: ", SavingManager.playersScores)
	
	var totalFurniture = 0
	var values = furnitureGained.values()
	
	print(values)
	for v in values:
		totalFurniture += v
		
	emit_signal("player_points_updated",  totalFurniture)
		
	#furnitureGained[furnitureId] = 1
	
func get_gained_furniture():
	return furnitureGained
	
func check_win():
	print("checkwin: ", furnitureGained)
	var maxFurniture = availableFurniture.size()
	for i in range(0, maxFurniture):
		print(furnitureGained[availableFurniture[i]])
		if furnitureGained[availableFurniture[i]] == 0:
			return false
	
	set_iAlreadyWon(true)	
	print("ja ganhei tudo")
	return true

func all_won_game():
	print("all won game!")
	#var allPlayers = get_node("/root/Map1/Spawners").get_children()
	
	#for player in allPlayers:
	#	SavingManager.playersScores[player.get_player_num()] = player.get_gained_furniture()
		
	emit_signal("game_finished")
	
func get_random_reward():
	var maxFurniture = availableFurniture.size()
	var missingRewards = []
	for i in range(0, maxFurniture):
		if  furnitureGained[availableFurniture[i]] == 0:
			missingRewards.append(availableFurniture[i])
	
		
	print(availableFurniture)
	print("faltam me as rewards ", missingRewards)
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

