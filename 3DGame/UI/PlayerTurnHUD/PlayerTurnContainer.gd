extends VBoxContainer

#const POINTS_LABEL = "Points: "
const POINTS_LABEL = " /6 OBJETOS"

onready var icon = $VBoxContainer2/CenterContainer/Icon
onready var button = $VBoxContainer2/CenterContainer/TextureButton
onready var label = $Label
onready var turnText = $VBoxContainer/TurnText
onready var arrow = $VBoxContainer/Arrow
onready var diceButton = $VBoxContainer2/DiceButton

const VISIBLE = Color(1, 1, 1, 1)
const HIDDEN = Color(1, 1, 1, 0)

var player setget set_player, get_player


func set_icon(new_icon):
	icon.texture = new_icon

func set_points_text(new_points):
	#label.text = POINTS_LABEL + str(new_points)
	label.text = str(new_points) + POINTS_LABEL
	
func set_texture(newIcon):
	button.set_normal_texture(newIcon)


func set_player(playerID):
	player = playerID 


func get_player():
	return player 
	
func hide_turn():
	turnText.modulate = HIDDEN
	arrow.modulate = HIDDEN


func hide_agency():
	#diceButton.disappear()
	diceButton.visible = false
	hide_turn()
	
	
func show_agency():
	diceButton.visible = true
