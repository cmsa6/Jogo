extends HBoxContainer


export(NodePath) var cognitiveCardsContainer
export(NodePath) var qualityCardsContainer


func select_card_type(type):
	self.visible = false
	if type == "quality" :
		get_node(qualityCardsContainer).visible = true
	elif type == "cognitive" :
		get_node(cognitiveCardsContainer).visible = true
