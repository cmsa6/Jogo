extends Control

signal fade_out_finished

onready var animPlayer = $AnimationPlayer
onready var colorRect = $ColorRect

func self_hide():
	colorRect.hide()

func play_fade_out():
	colorRect.show()
	animPlayer.play("FadeOut")

func on_fade_out_finished():
	emit_signal("fade_out_finished")
