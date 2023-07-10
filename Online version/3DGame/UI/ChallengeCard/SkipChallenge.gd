extends Button

var mainColor setget set_mainColor, get_mainColor
var outlineColor setget set_outlineColor, get_outlineColor

var reward   = "" setget set_reward, get_reward
var cardType = "" setget set_cardType, get_cardType
var cardTypeName = "" setget set_cardTypeName, get_cardTypeName


func set_colors(colors):
	var mColor = Color8(230,111,32,255)
	var oColor = Color8(241,161,109,255)
	
	set_mainColor(mColor)
	set_outlineColor(oColor)
	
	self.set("custom_colors/font_color", oColor)
	self.set("custom_colors/font_color_hover", mColor)
	self.get("custom_fonts/font").set_outline_color(mColor)
	
	
func set_mainColor(color):
	mainColor = color
	
func get_mainColor():
	return mainColor
	
func set_outlineColor(color):
	outlineColor = color
	
func get_outlineColor():
	return outlineColor
	
	
func change_colors_mouse_in():
	self.get("custom_fonts/font").set_outline_color(get_outlineColor())

	
func change_colors_mouse_out():
	self.get("custom_fonts/font").set_outline_color(get_mainColor())
	
func set_reward(r):
	reward = r
	
func get_reward():
	return reward
	
func set_cardType(t):
	cardType = t
	
func get_cardType():
	return cardType
	
func set_cardTypeName(name):
	#print("saving the type to the skip button - ", name)
	cardTypeName = name
	
func get_cardTypeName():
	return cardTypeName
	
	
func skip_challenge():
	#print("no skip o tipo e: ", get_cardTypeName())
	var root_node = get_node("/root")
	

	var currentCard = root_node.get_child(0)
	currentCard.queue_free()
	
	var cardScene = load("res://UI/ChallengeCard/CardPreview.tscn")
	var cardInstance = cardScene.instance()

	cardInstance.set_origin("skip")
	cardInstance.save_rewardSkip(get_reward())
	cardInstance.set_cardType(get_cardType())
	
	cardInstance.set_cardTypeName(get_cardTypeName())
	
	root_node.add_child(cardInstance)
	root_node.move_child(cardInstance,0)

