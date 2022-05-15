extends HBoxContainer

onready var progressBar = $TextureProgress
onready var mapButton = $NewMapButton
#onready var pointsBar = $PointsBar
#onready var pointsText = $PointsBar/Points
#onready var pointsShortcut = $PointsBar/Shortcut

func show_bar():
	progressBar.visible = true
	mapButton.visible   = true
	
func hide_bar():
	progressBar.visible = false
	mapButton.visible   = false

#func show_points():
#	pointsBar.visible = true
	
#func hide_points():
#	pointsBar.visible = false
	
#func enable_points():
#	pointsBar.disabled = false
#	pointsShortcut.visible = true
#	pointsText.set("custom_colors/font_color", Color8(228, 99, 14, 255))
#
#func disable_points():
#	pointsBar.disabled = true
#	pointsShortcut.visible = false
#	pointsText.set("custom_colors/font_color", Color(1.0, 1.0, 1.0, 1.0))
