extends Node

onready var anim  = $AnimationPlayer

var mute = false setget set_mute, get_mute


func fade_out_music():
	if not mute:
		anim.play("fade_out_music")
		
func fade_in_music():
	if not mute:
		anim.play("fade_in_music")
	
func start_city_sound():
	#print("i started city sound")
	CityAudioManager.start()
	#CityAudioManager.stream_paused = false
	#CityAudioManager.playing = true

func set_mute(bol):
	mute = bol
	
func get_mute():
	return mute
