extends LineEdit


func _ready():
	pass 




func _on_Score_input_text_changed(new_text):
	if (not new_text.is_valid_integer()) or (len(self.text) == 1 and new_text == "0"):
		var textLength = len(self.text)
		var validText = self.text.substr(0,textLength-1)
		self.text = validText
	

		
