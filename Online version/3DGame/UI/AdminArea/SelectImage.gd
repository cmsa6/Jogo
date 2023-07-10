extends Button

export(NodePath) var fileManager


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.
	
func show_fileManager():
	get_node(fileManager).popup()


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
