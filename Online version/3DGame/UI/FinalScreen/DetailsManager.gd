extends Control


#onready var buttonsLayer = $Buttons
onready var viewport = $ViewportContainer
onready var backButton = $GoBackButton
onready var points = $ViewportContainer/FinalViewport/FurnishedHouse/ScoreInfo/ScoreInfoManager/PointsBar
#onready var scoreBoard = $ScoreBoard
onready var scoreBoard = $ScoreBoardGlobal

#onready var pointsButton = $Buttons/Points
#onready var objectsButton = $Buttons/Objects

export(NodePath) var objectsButton
export(NodePath) var pointsButton
export(NodePath) var buttonsLayer

var blurred setget set_blurred, get_blurred
var playerID setget set_playerID, get_playerID



		
	

func show_house():
	get_node(objectsButton).disabled = true
	get_node(pointsButton).disabled = false
	
	get_node(pointsButton).pressed = false
	#buttonsLayer.visible = false
	#set_blurred(viewport.modulate)
	#viewport.modulate = Color(1,1,1,1)
	#backButton.visible = true
	scoreBoard.visible = false
	
	#get_node(objectsButton).pressed = true
	
func show_points():
	get_node(objectsButton).disabled = false
	get_node(pointsButton).disabled = true
	
	get_node(objectsButton).pressed = false

	
	#buttonsLayer.visible = false
	#backButton.visible = true
	viewport.modulate == Color(1,1,1,0.5)
	scoreBoard.set_up(get_playerID())
	scoreBoard.visible = true

	#get_node(pointsButton).pressed = true

func set_blurred(value):
	blurred = value
	
func get_blurred():
	return blurred
	
func set_playerID(id):
	playerID = id
	
func get_playerID():
	return playerID
	
func show_buttons():
	get_node(buttonsLayer).visible = true
	backButton.visible = false
	if scoreBoard.visible:
		scoreBoard.visible = false
	if viewport.modulate == Color(1,1,1,1):
		viewport.modulate = get_blurred()
