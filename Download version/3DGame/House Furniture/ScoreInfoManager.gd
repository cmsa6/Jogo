extends HBoxContainer

onready var progressBar = $TextureProgress
onready var mapButton = $NewMapButton


func show_bar():
	progressBar.visible = true
	mapButton.visible   = true
	
func hide_bar():
	progressBar.visible = false
	mapButton.visible   = false


