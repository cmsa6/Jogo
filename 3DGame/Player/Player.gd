extends KinematicBody

signal play_aguen
signal player_turn_ended
signal game_finished
signal player_points_updated(points)
signal load_minigame
signal walkingSound

export (int) var player_num
export (int) var speed = 5
export(NodePath) var GameManager
export (Array, String) var availableFurniture = []

var animPlayer

var target = null
var target_pos = Vector3.ZERO
var velocity = Vector3.ZERO

var is_my_turn = false
var canMove = false
var target_count = 0
var cells_to_walk = 0

var points = 0 setget incr_points

var furnitureGained = {}





# Info from gameManager
var gameManager
var cells_size = 0



onready var cam = $Camera

 
func _ready():
	#Spwon character
	var instance
	if(player_num <= SettingsManager.num_of_players):
		print(SettingsManager.players[player_num-1])
		instance = CharactersManager.get_character_scene(
			SettingsManager.players[player_num - 1].character).instance()
		instance.name = "Body"
		self.add_child(instance)
		
		gameManager = get_node(GameManager)
		cells_size = gameManager.get_cells().size()
		
		animPlayer = $Body/AnimationPlayer
		play_animation(CharactersManager.IDLE_ANIM)
		create_furniture_array()
		incr_points(0)
		
		
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
	target = gameManager.get_node_cell_by_index(target_count)
	return target.transform.origin

func RotatePlayerToNextTarget():
	look_at(target_pos, Vector3.UP)
	
func player_reached_target(_body):
	if is_my_turn:
		target_count += 1
		cells_to_walk -= 1
		if target_count >= cells_size || target.type == target.TYPE.END:
			print("game ended")
			#game finished
			canMove = false
			play_animation(CharactersManager.IDLE_ANIM)
			emit_signal("game_finished")
		elif cells_to_walk > 0:
			UpdateTarget()
			#incr_points(1)
		else:
			# Player reached destiniation cell
			if target.type == target.TYPE.GAME:
				#SavingManager.current_player = player_num - 1
				#play_animation(CharactersManager.IDLE_ANIM)
				emit_signal("load_minigame")
				
			canMove = false
			#is_my_turn = false
			#play_animation(CharactersManager.IDLE_ANIM)
			#UpdateTarget()
			#RotatePlayerToNextTarget()
			#emit_signal("play_aguen")
			#emit_signal("player_turn_ended")
			

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
	
	
# Get && Set
func incr_points(point_to_add):
	#print("mesmo no inciio ", point_to_add)
	#if point_to_add == 0:
	#	create_furniture_array()
	#else:
	#	gained_furniture(0)
	points += point_to_add
	emit_signal("player_points_updated", points)
	
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
	emit_signal("player_turn_ended")

func create_furniture_array():
	print("create array")
	var maxFurniture = availableFurniture.size()
	for i in range(0, maxFurniture):
		furnitureGained[availableFurniture[i]] = 0
		
func gained_furniture(furnitureId):
	print("dentro do gained furniture: ", furnitureId)
	#furnitureGained.insert(furnitureId,1)
	furnitureGained[furnitureId] = 1
	print(furnitureGained)
	#furnitureGained[furnitureId] = 1
	
func get_gained_furniture():
	return furnitureGained
