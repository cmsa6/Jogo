extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	AudioManager.stream_paused = false
	var children = get_node("/root/").get_children()
	for child in children:
		print(child.get_name())
