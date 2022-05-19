extends TextureButton

func mute():	
	print("mute")
	print(CityAudioManager.get_mute())
	if CityAudioManager.get_mute():
		print("entrei1")
		CityAudioManager.set_mute(false)
		MusicAudioManager.set_mute(false)
		MusicAudioManager.stream_paused = false

	else:
		print("entrei2")
		CityAudioManager.set_mute(true)
		MusicAudioManager.set_mute(true)
		MusicAudioManager.stream_paused = true
	
