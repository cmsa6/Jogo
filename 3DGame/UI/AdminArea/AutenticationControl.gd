extends VBoxContainer

onready var user = $LoginData/username
onready var password = $LoginData/password


func check_login():
	if user.text == "admin" and password.text == "admin":
		get_tree().change_scene("res://UI/AdminArea/CardManager.tscn")
	else:
		return false 


func write():
	var file = File.new()
	file.open("res://Cards/save_game.txt", File.WRITE)
	file.store_string("hello")
	file.close()
	
func load():
	var file = File.new()
	file.open("res://save_game.dat", File.READ)
	var content = file.get_as_text()
	file.close()
	return content
	
