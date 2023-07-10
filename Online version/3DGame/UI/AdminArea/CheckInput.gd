extends LineEdit


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Score_input_text_changed(new_text):
	if (not new_text.is_valid_integer()) or (len(self.text) == 1 and new_text == "0"):
		var textLength = len(self.text)
		var validText = self.text.substr(0,textLength-1)
		self.text = validText
	

		
