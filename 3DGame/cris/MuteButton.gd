extends TextureButton


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	if CityAudioManager.get_mute():
		self.pressed = true
		
		
func mute():
	if CityAudioManager.get_mute():
		CityAudioManager.set_mute(false)
		MusicAudioManager.set_mute(false)
		CityAudioManager.start()

	else:
		CityAudioManager.set_mute(true)
		MusicAudioManager.set_mute(true)
		CityAudioManager.stop()
		
	
func hide_button(bol):
	if bol:
		self.visible = false
	else:
		self.visible = true

	
