extends TextureButton

onready var animPlayer = $AnimationPlayer


func show_dice_screen():
	var root_node = get_node("/root")

	var playScreen = load("res://UI/Dice/NewDicePreview.tscn")
	var play_node = playScreen.instance()
	root_node.add_child(play_node)
	root_node.move_child(play_node,0)

	

	
func blink():
	animPlayer.play("blink")
	
func disappear():
	animPlayer.play("disappear")


func _on_DiceButton_mouse_entered():
	if not disabled:
		animPlayer.play("Still")



func _on_DiceButton_mouse_exited():
	if not disabled:
		animPlayer.play("blink")
