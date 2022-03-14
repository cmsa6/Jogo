extends HBoxContainer

onready var progressBar = $TextureProgress
onready var pointsBar = $PointsBar

func show_bar():
	progressBar.visible = true
	
func hide_bar():
	progressBar.visible = false

func show_points():
	pointsBar.visible = true
	
func hide_points():
	pointsBar.visible = false
	
func enable_points():
	pointsBar.disabled = false

func disable_points():
	pointsBar.disabled = true
