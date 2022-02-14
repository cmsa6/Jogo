extends VBoxContainer

#const POINTS_LABEL = "Points: "
const POINTS_LABEL = " /10 OBJECTS"

onready var icon = $CenterContainer/TextureRect2/CenterContainer/Icon
onready var button = $CenterContainer/TextureRect2/CenterContainer/TextureButton
onready var label = $Label

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
