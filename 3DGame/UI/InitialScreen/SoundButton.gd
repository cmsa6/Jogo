extends TextureButton

func _input(event):
	if event.is_action_pressed("Tab"):
		emit_signal("button_down")
		emit_signal("pressed")
		
		
func _ready():
	if not CityAudioManager.get_mute():
		self.pressed = true
		
		
func mute():	
	if CityAudioManager.get_mute():
		CityAudioManager.set_mute(false)
		MusicAudioManager.set_mute(false)
		MusicAudioManager.stream_paused = false
		self.pressed = true

	else:
		CityAudioManager.set_mute(true)
		MusicAudioManager.set_mute(true)
		MusicAudioManager.stream_paused = true
		self.pressed = false
	
