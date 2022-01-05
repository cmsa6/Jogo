extends VBoxContainer

const POINTS_LABEL = "Points: "

onready var icon = $CenterContainer/TextureRect2/CenterContainer/Icon
onready var label = $Label


func set_icon(new_icon):
	icon.texture = new_icon

func set_points_text(new_points):
	label.text = POINTS_LABEL + str(new_points)
