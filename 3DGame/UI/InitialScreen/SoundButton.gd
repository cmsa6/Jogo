extends TextureButton

func _input(event):
	if event.is_action_pressed("Tab"):
		emit_signal("button_down")
		emit_signal("pressed")
		
		
func mute():	
	print("mute")
	print(CityAudioManager.get_mute())
	if CityAudioManager.get_mute():
		print("entrei1")
		CityAudioManager.set_mute(false)
		MusicAudioManager.set_mute(false)
		MusicAudioManager.stream_paused = false
		self.pressed = false

	else:
		print("entrei2")
		CityAudioManager.set_mute(true)
		MusicAudioManager.set_mute(true)
		MusicAudioManager.stream_paused = true
		self.pressed = true
	
