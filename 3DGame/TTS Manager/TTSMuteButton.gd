extends TextureButton


func enable_tts():
	if SettingsManager.get_ttsEnabled():
		SettingsManager.set_ttsEnabled(false)
	else:
		SettingsManager.set_ttsEnabled(true)
		self.pressed = true
