extends Spatial

onready var currentPlayer = SavingManager.current_player

onready var cfSkills = $Control/SkillManager/VBoxContainer/Skills/cfSkills
onready var qolSkills = $Control/SkillManager/VBoxContainer/Skills/qolSkills

var CFPoints setget set_CFPoints, get_CFPoints
var QOLPoints setget set_QOLPoints, get_QOLPoints

func set_up():
	
#	for player in spawners:
#		if currentPlayer == ( player.get_player_num() - 1 ):
#			CFPoints = player.get_CFPoints()
#			QOLPoints = player.get_QOLPoints()
#			break
#
	var CFPoints = get_CFPoints()
	var QOLPoints = get_QOLPoints()
	
	
	
	var nodePath
	for skill in CFPoints.keys():
		nodePath = "Control/SkillManager/VBoxContainer/Skills/cfSkills/" + skill
		get_node(nodePath).update_value(CFPoints[skill])

	for skill in QOLPoints.keys():
		nodePath = "Control/SkillManager/VBoxContainer/Skills/qolSkills/" + skill
		get_node(nodePath).update_value(QOLPoints[skill])


func set_CFPoints(p):
	CFPoints = p
	
func set_QOLPoints(p):
	QOLPoints = p
	
func get_CFPoints():
	return CFPoints
	
func get_QOLPoints():
	return QOLPoints
