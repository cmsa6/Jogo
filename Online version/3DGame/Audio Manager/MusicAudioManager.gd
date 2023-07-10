extends AudioStreamPlayer

onready var anim = $AnimationPlayer


func stop():
	anim.play("fade_out_music")
