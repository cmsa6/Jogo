extends TextureButton


func _input(event):
	if event.is_action_pressed("Shift"):
		emit_signal("button_down")
		emit_signal("pressed")

func _ready():
	if SettingsManager.get_ttsEnabled():
		self.pressed = true


func enable_tts():
	if SettingsManager.get_ttsEnabled():
		SettingsManager.set_ttsEnabled(false)
		self.pressed = false
	else:
		SettingsManager.set_ttsEnabled(true)
		self.pressed = true
