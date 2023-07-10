extends GridContainer

onready var timer = $Timer
onready var anim  = $AnimationPlayer





# Called when the node enters the scene tree for the first time.
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
