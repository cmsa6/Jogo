extends Control

onready var timer = $Timer
onready var anim  = $AnimationPlayer


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func is_enabled():
	if self.visible:
		timer.start()
	else:
		anim.stop()
		timer.stop()
		


func _on_Timer_timeout():
	anim.play("press")
