extends Button

export(NodePath) var fileManager
export(NodePath) var fileManagerCard



func _ready():
	pass 
	
func show_fileManager():
	get_node(fileManager).popup()
	
func show_fileManager_card():
	get_node(fileManagerCard).popup()


