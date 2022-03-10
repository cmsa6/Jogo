extends OmniLight

onready var anim = $AnimationPlayer

func fade_out():
	anim.play("fade_out")
