extends TextureButton

onready var animPlayer = $AnimationPlayer


const VISIBLE = Color(1, 1, 1, 1)
const HIDDEN = Color(1, 1, 1, 0)


func _input(event):
	if not self.disabled:
		if event.is_action_pressed("RightArrow"):
			emit_signal("button_down")
			emit_signal("pressed")
		

func show_dice_screen():
	var root_node = get_node("/root")

	var playScreen = load("res://UI/Dice/NewDicePreview.tscn")
	var play_node = playScreen.instance()
	root_node.add_child(play_node)
	root_node.move_child(play_node,0)

	

	
func blink():
	pass
	
	
	
func disappear():
	animPlayer.play("disappear")


func _on_DiceButton_mouse_entered():
	if self.modulate == VISIBLE:
		animPlayer.play("Still")



func _on_DiceButton_mouse_exited():
	if self.modulate == VISIBLE:
		pass
		
func stop():
	animPlayer.stop()
	
