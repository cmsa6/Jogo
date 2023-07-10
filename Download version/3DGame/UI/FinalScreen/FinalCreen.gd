extends Control


func _ready():
	if not MusicAudioManager.get_mute():
		CityAudioManager.stream_paused = true
		MusicAudioManager.fade_in_music()
