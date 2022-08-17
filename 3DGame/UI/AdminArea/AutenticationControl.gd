extends VBoxContainer

onready var user = $LoginData/username
onready var password = $LoginData/password
onready var warning = $LoginButton/AcceptDialog


func check_login():
	if user.text == "admin" and password.text == "admin":
		get_tree().change_scene("res://UI/AdminArea/CardManager.tscn")
	else:
		warning.popup()
		user.clear()
		password.clear()


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
	





