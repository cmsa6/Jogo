extends TextureButton


func _input(event):
	if event.is_action_pressed("Escape"):
		emit_signal("button_down")
		emit_signal("pressed")


func _on_SettingsButton_pressed():
	var destFolderName = "user://en/cards"
	var dir = Directory.new()
	dir.open(destFolderName)
	dir.list_dir_begin()
	
	while true:
		var file = dir.get_next()
		if file == "":
			break
		#elif not file.begins_with("."):
		#	print("depois do file manager")
		#	print(file)
			
	get_tree().change_scene("res://UI/AdminArea/LoginCheck.tscn")


