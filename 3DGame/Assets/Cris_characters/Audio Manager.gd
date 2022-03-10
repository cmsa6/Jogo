extends Node

onready var walkSound = $Walk

func walk():
	walkSound.play(0)
