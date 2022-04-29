extends TextureButton

onready var skillScreen = preload("res://UI/SkillScreen/SkillScreen.tscn")
onready var points = $Points

var CFPoints setget set_CFPoints, get_CFPoints
var QOLPoints setget set_QOLPoints, get_QOLPoints

func _input(event):
	if event.is_action_released("check_points") and not disabled:
			emit_signal("pressed")



func show_skillScreen(orig):
	
	var root_node = get_node("/root") 
	
	
	var skillScreen_node = skillScreen.instance()
	
#	if orig == "Final":
#		print(get_playerIdFinal())
#		print(SavingManager.playersCFSkills[get_playerIdFinal()])
#		skillScreen_node.set_CFPoints(SavingManager.playersCFSkills[get_playerIdFinal()])
#		skillScreen_node.set_QOLPoints(SavingManager.playersQOLSkills[get_playerIdFinal()])
	
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
	

	
func change_text(bol):
	if not self.disabled:
		if bol :
			points.set("custom_colors/font_color", Color8(228, 99, 14, 255))
		else:
			points.set("custom_colors/font_color", Color8(241, 161, 109, 255))

	
