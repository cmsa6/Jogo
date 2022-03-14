extends TextureButton

onready var skillScreen = preload("res://UI/SkillScreen/SkillScreen.tscn")

var CFPoints setget set_CFPoints, get_CFPoints
var QOLPoints setget set_QOLPoints, get_QOLPoints

func show_skillScreen():
	
	var root_node = get_node("/root") 
	
	var skillScreen_node = skillScreen.instance()
	
	skillScreen_node.set_CFPoints(get_CFPoints())
	skillScreen_node.set_QOLPoints(get_QOLPoints())
	skillScreen_node.set_up()
	
	root_node.add_child(skillScreen_node)
	root_node.move_child(skillScreen_node,0)
	
	
func set_CFPoints(p):
	CFPoints = p
	
func set_QOLPoints(p):
	QOLPoints = p	
	
func get_CFPoints():
	return CFPoints 
	
func get_QOLPoints():
	return QOLPoints	
	
	
	
