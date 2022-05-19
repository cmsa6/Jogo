extends TextureButton


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	if MusicAudioManager.get_mute():
		self.pressed = true
		
		
func mute():
	if MusicAudioManager.get_mute():
		CityAudioManager.set_mute(false)
		MusicAudioManager.set_mute(false)
		MusicAudioManager.fade_in_music()

	else:
		CityAudioManager.set_mute(true)
		MusicAudioManager.set_mute(true)
		MusicAudioManager.stream_paused = true
		
	
