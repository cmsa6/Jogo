extends KinematicBody

signal play_aguen
signal player_turn_ended
signal game_finished
signal player_points_updated(points)
signal load_minigame

export (int) var player_num
export (int) var speed = 5
export(NodePath) var GameManager

var animPlayer

var target = null
var target_pos = Vector3.ZERO
var velocity = Vector3.ZERO

var is_my_turn = false
var canMove = false
var target_count = 0
var cells_to_walk = 0

var points = 0 setget incr_points


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
			#game finished
			canMove = false
			play_animation(CharactersManager.IDLE_ANIM)
			emit_signal("game_finished")
		elif cells_to_walk > 0:
			UpdateTarget()
			incr_points(1)
		else:
			# Player reached destiniation cell
			if target.type == target.TYPE.GAME:
				emit_signal("load_minigame")
			canMove = false
			is_my_turn = false
			play_animation(CharactersManager.IDLE_ANIM)
			UpdateTarget()
			RotatePlayerToNextTarget()
			emit_signal("play_aguen")
			emit_signal("player_turn_ended")
			

func _physics_process(_delta):
	if canMove:
		RotatePlayerToNextTarget()
		velocity = -transform.basis.z * speed
		print(target_pos)
		if transform.origin.distance_to(target_pos) > 0.2:
			velocity = move_and_slide(velocity)
		play_animation(CharactersManager.WALK_ANIM)

# Animation controller
func play_animation(anim_name):
	animPlayer.play(anim_name)
	
	
# Get && Set
func incr_points(point_to_add):
	points += point_to_add
	emit_signal("player_points_updated", points)


