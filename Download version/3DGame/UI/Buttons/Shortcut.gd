extends Control

onready var timer = $Timer
onready var anim  = $AnimationPlayer


func _ready():
	pass




func is_enabled():
	if self.visible:
		timer.start()
	else:
		anim.stop()
		timer.stop()
		


func _on_Timer_timeout():
	anim.play("press")
