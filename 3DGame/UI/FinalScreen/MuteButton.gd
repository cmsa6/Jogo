extends TextureButton


func _input(event):
	if event.is_action_pressed("Tab") and not disabled:
			emit_signal("button_down")
			emit_signal("pressed")
			
func _ready():
	if MusicAudioManager.get_mute():
		self.pressed = false
		
		
func mute():
	if MusicAudioManager.get_mute():
		CityAudioManager.set_mute(false)
		MusicAudioManager.set_mute(false)
		MusicAudioManager.fade_in_music()
		self.pressed = true

	else:
		CityAudioManager.set_mute(true)
		MusicAudioManager.set_mute(true)
		MusicAudioManager.stream_paused = true
		self.pressed = true
		
	
