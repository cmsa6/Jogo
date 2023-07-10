extends Spatial

onready var animPlayer = $AnimationPlayer

func _on_Button_pressed():
	animPlayer.play("thrown")
