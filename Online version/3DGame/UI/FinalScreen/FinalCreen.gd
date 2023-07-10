extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	if not MusicAudioManager.get_mute():
		CityAudioManager.stream_paused = true
		MusicAudioManager.fade_in_music()
