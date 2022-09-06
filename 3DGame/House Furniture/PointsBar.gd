extends TextureButton



onready var shortcutImage = $Shortcut_upArrow
#onready var points = $Points

export(NodePath) var scoreInfoManager

var CFPoints setget set_CFPoints, get_CFPoints
var QOLPoints setget set_QOLPoints, get_QOLPoints

var isShowingSkills = false setget set_isShowingSkills, get_isShowingSkills


var status = "points" setget set_status, get_status


signal show_skills()
signal hide_mapButton(bol)

func _input(event):
	if not disabled:
		if event.is_action_pressed("UpArrow") and get_status() == "points":
			emit_signal("button_down")
			emit_signal("pressed")
		elif event.is_action_pressed("DownArrow") and get_status() == "house":
			emit_signal("button_down")
			emit_signal("pressed")



func show_skillScreen(orig):
	
	var root_node = get_node("/root") 
	
	set_isShowingSkills(true)
	var skillScreen = load("res://UI/SkillScreen/SkillScreen.tscn")
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
	
	var houseButton = load("res://Fotos/HouseButton.png")
	var houseButtonSelected = load("res://Fotos/HouseButtonSelected.png")

	var upArrow = load("res://Assets/Keyboard/Tiles/tile_0438.png")
	var downArrow = load("res://Assets/Keyboard/Tiles/tile_0440.png")

	var pointsButton = load("res://Fotos/ScoreButton.png")
	var pointsButtonSelected = load("res://Fotos/ScoreButton_selected.png")
	if bol:

		#self.set_pressed(false)
		self.set_pressed_texture(houseButtonSelected)
		#self.set_focused_texture(houseButtonSelected)
		self.set_hover_texture(houseButtonSelected)
		self.set_normal_texture(houseButton)
		shortcutImage.get_shortcut().set_texture(downArrow)
		set_status("house")
	else:
		self.set_normal_texture(pointsButton)
		self.set_pressed_texture(pointsButtonSelected)
		#self.set_focused_texture(pointsButtonSelected)
		self.set_hover_texture(pointsButtonSelected)
		shortcutImage.get_shortcut().set_texture(upArrow)
		set_status("points")
	
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

func teste():
	print("hello")

	
	
func show_or_hide():
	if get_isShowingSkills():
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
		var scoreInfo = get_node(scoreInfoManager)
		scoreInfo.hide_bar()
		emit_signal("hide_mapButton", true)
		emit_signal("show_skills")
		change_to_house_button(true)
		
func set_isShowingSkills(bol):
	isShowingSkills = bol
	
func get_isShowingSkills():
	return isShowingSkills
	
func set_status(s):
	status = s
	
func get_status():
	return status






