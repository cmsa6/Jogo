extends Node

onready var sound = $AudioStreamPlayer

func walk():
	sound.play()
	print("hello")
