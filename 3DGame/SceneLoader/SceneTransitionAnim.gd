extends Control

signal fade_out_finished

onready var animPlayer = $AnimationPlayer
onready var colorRect = $ColorRect

func self_hide():
	print("animation1")
	colorRect.hide()

func play_fade_out():
	print("animation2")
	colorRect.show()
	animPlayer.play("FadeOut")

func on_fade_out_finished():
	print("animation3")
	emit_signal("fade_out_finished")
