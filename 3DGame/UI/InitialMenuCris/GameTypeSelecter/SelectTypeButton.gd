extends TextureButton


onready var settings = get_node("/root/SettingsManager")

func _on_SinglePlayer_Selected():
	settings._on_SinglePlayer_Selected()

func _on_Local_Multiplayer_Selected():
	settings._on_Local_Multiplayer_Selected()


