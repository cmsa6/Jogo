extends HBoxContainer


export(NodePath) var cognitiveCardsContainer
export(NodePath) var qualityCardsContainer

export(String, FILE) var cfScene
export(String, FILE) var qolScene





func select_card_type(type):
	self.visible = false
	if type == "quality" :
		get_tree().change_scene(qolScene)
	elif type == "cognitive" :
		get_tree().change_scene(cfScene)
