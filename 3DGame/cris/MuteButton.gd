extends TextureButton


func _input(event):
	if event.is_action_pressed("Tab") and self.visible:
		#if event.as_text() == "E" and self.visible:
		emit_signal("button_down")
		emit_signal("pressed")
		
		
func _ready():
	if CityAudioManager.get_mute():
		self.pressed = false
		
		
func mute():
	if CityAudioManager.get_mute():
		CityAudioManager.set_mute(false)
		MusicAudioManager.set_mute(false)
		CityAudioManager.start()
		self.pressed = true

	else:
		CityAudioManager.set_mute(true)
		MusicAudioManager.set_mute(true)
		CityAudioManager.stop()
		self.pressed = false
		
	
func hide_button(bol):
	#if bol:
	#	self.visible = false
	#else:
	#	self.visible = true
	pass
	
