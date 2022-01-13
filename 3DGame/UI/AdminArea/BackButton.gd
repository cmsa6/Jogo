extends TextureButton

export (NodePath) var cardTypeSelecter
 
onready var parentName = self.get_parent().name


func _on_BackButton_pressed():
	if "Card" in parentName:
		get_node(cardTypeSelecter).visible = true
		get_parent().visible = false
	else:
		get_tree().change_scene("res://UI/InitialScreen/InitialScreenWithIcon.tscn")
	
