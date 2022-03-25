extends Control


onready var buttonsLayer = $Buttons
onready var viewport = $ViewportContainer
onready var backButton = $GoBackButton
onready var points = $ViewportContainer/FinalViewport/FurnishedHouse/ScoreInfo/ScoreInfoManager/PointsBar
onready var scoreBoard = $ScoreBoard

onready var pointsButton = $Buttons/Points
onready var objectsButton = $Buttons/Objects


var blurred setget set_blurred, get_blurred
var playerID setget set_playerID, get_playerID



		
	

func show_house():
	pointsButton.pressed = false
	#buttonsLayer.visible = false
	#set_blurred(viewport.modulate)
	#viewport.modulate = Color(1,1,1,1)
	#backButton.visible = true

	
	scoreBoard.visible = false
	
func show_points():
	objectsButton.pressed = false

	
	#buttonsLayer.visible = false
	#backButton.visible = true
	viewport.modulate == Color(1,1,1,0.5)
	scoreBoard.set_up(get_playerID())
	scoreBoard.visible = true

func set_blurred(value):
	blurred = value
	
func get_blurred():
	return blurred
	
func set_playerID(id):
	playerID = id
	
func get_playerID():
	return playerID
	
func show_buttons():
	buttonsLayer.visible = true
	backButton.visible = false
	if scoreBoard.visible:
		scoreBoard.visible = false
	if viewport.modulate == Color(1,1,1,1):
		viewport.modulate = get_blurred()
