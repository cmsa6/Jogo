extends TextureButton


func _ready():
	pass 


func open():
	var langPath = "user://Cards/" + SettingsManager.language 
	var path = ProjectSettings.globalize_path(langPath)
	OS.shell_open(path)
