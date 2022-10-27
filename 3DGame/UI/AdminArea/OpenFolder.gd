extends TextureButton


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func open():
	var langPath = "user://Cards/" + SettingsManager.language 
	var path = ProjectSettings.globalize_path(langPath)
	#var path = ProjectSettings.globalize_path("user://Cards")
	OS.shell_open(path)
