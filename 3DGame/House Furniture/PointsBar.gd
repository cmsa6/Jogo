extends TextureButton

onready var skillScreen = preload("res://UI/SkillScreen/SkillScreen.tscn")
#onready var points = $Points

export(NodePath) var scoreInfoManager

var CFPoints setget set_CFPoints, get_CFPoints
var QOLPoints setget set_QOLPoints, get_QOLPoints

var isShowingSkills = false setget set_isShowingSkills, get_isShowingSkills

var houseButton = preload("res://Fotos/HouseButton.png")
var houseButtonSelected = preload("res://Fotos/HouseButtonSelected.png")

var pointsButton = preload("res://Fotos/points.png")
var pointsButtonSelected = preload("res://Fotos/points_selected.png")


signal show_skills()
signal hide_mapButton(bol)

func _input(event):
	if event.is_action_released("check_points") and not disabled:
			emit_signal("pressed")



func show_skillScreen(orig):
	
	var root_node = get_node("/root") 
	
	set_isShowingSkills(true)
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
	

	
	
func change_to_house_button(bol):
	if bol:

		#self.set_pressed(false)
		self.set_pressed_texture(houseButtonSelected)
		#self.set_focused_texture(houseButtonSelected)
		self.set_hover_texture(houseButtonSelected)
		self.set_normal_texture(houseButton)
	else:
		self.set_normal_texture(pointsButton)
		self.set_pressed_texture(pointsButtonSelected)
		#self.set_focused_texture(pointsButtonSelected)
		self.set_hover_texture(pointsButtonSelected)
	
func set_CFPoints(p):
	CFPoints = p
	
func set_QOLPoints(p):
	QOLPoints = p	
	
func get_CFPoints():
	return CFPoints 
	
func get_QOLPoints():
	return QOLPoints	
	

	
#func change_text(bol):
#	if not self.disabled:
#		if bol :
#			points.set("custom_colors/font_color", Color8(228, 99, 14, 255))
#		else:
#			points.set("custom_colors/font_color", Color8(241, 161, 109, 255))

	
	
func show_or_hide():
	print("here no show or hide")
	if get_isShowingSkills():
		print("hiding skill")
		var rootNode = get_node("/root")
	
		var currentCard = rootNode.get_child(0)
		currentCard.queue_free()
	
	
		set_isShowingSkills(false)
		var scoreInfo = get_node(scoreInfoManager)
		scoreInfo.show_bar()
		#scoreInfo.enable_points()
		emit_signal("hide_mapButton", false)
		change_to_house_button(false)
	else: 
		emit_signal("hide_mapButton", true)
		emit_signal("show_skills")
		change_to_house_button(true)
		
func set_isShowingSkills(bol):
	isShowingSkills = bol
	
func get_isShowingSkills():
	return isShowingSkills



