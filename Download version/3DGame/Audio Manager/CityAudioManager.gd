extends AudioStreamPlayer

onready var anim = $AnimationPlayer

var mute = false setget set_mute, get_mute

func start():
	anim.play("fade_in_city_sound")
	
func stop():
	stream_paused = true
	
func set_mute(bol):
	mute = bol
	
func get_mute():
	return mute
	

