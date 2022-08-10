extends TextureButton

func _input(event):
	if event.is_action_pressed("Tab"):
		emit_signal("button_down")
		emit_signal("pressed")
		
		
func mute():	
	if CityAudioManager.get_mute():
		CityAudioManager.set_mute(false)
		MusicAudioManager.set_mute(false)
		MusicAudioManager.stream_paused = false
		self.pressed = false

	else:
		CityAudioManager.set_mute(true)
		MusicAudioManager.set_mute(true)
		MusicAudioManager.stream_paused = true
		self.pressed = true
	
