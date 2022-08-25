extends Button

export(NodePath) var overlay
export(NodePath) var button
export(NodePath) var translator
export(int) var languageId

var selected=false setget set_selected, get_selected

func _ready():
	if languageId == 1:
		emit_signal("pressed")


func _input(event):
	if event.is_action_pressed("select_language"):
		if  str(languageId) in event.as_text():
			emit_signal("button_down")
			emit_signal("pressed")


func mouse_entered():
	get_node(overlay).visible = true


func mouse_exited():
	print(get_selected())
	if not get_selected():
		get_node(overlay).visible = false
	
func select():
	var lang = self.get_name()
	print("Im selecting")
	get_node(overlay).visible = true
	set_selected(true)
	get_node(button).set_languageSelected(lang)
	get_node(translator).translate(lang)
	
	
func set_selected(bol):
	selected = bol
	
func get_selected():
	return selected
	
func unselect():
	set_selected(false)
	get_node(overlay).visible = false




