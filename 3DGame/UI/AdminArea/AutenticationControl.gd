extends VBoxContainer

onready var user = $LoginData/username
onready var password = $LoginData/password
onready var warning = $LoginButton/AcceptDialog


func check_login():
	if user.text == "admin" and password.text == "admin":
		check_cards_uid()
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
	
	
func check_cards_uid():
	var files = []
	var comemrcialDir = Directory.new()
	var commercialPath = "res://Cards/" + SettingsManager.language + "/COMMERCIAL/"
	comemrcialDir.open(commercialPath)
	comemrcialDir.list_dir_begin()
		
	while true:
		var file = comemrcialDir.get_next()
		if file == "":
			break
		elif not file.begins_with("."):
			var fileId = int(file.split(".")[0])
			files.append(fileId)

	comemrcialDir.list_dir_end()
	
	
	var servicesDir = Directory.new()
	var servicesPath = "res://Cards/" + SettingsManager.language + "/SERVICES/"
	servicesDir.open(servicesPath)
	servicesDir.list_dir_begin()
		
	while true:
		var file = servicesDir.get_next()
		if file == "":
			break
		elif not file.begins_with("."):
			var fileId = int(file.split(".")[0])
			files.append(fileId)

	servicesDir.list_dir_end()

	
	var helpDir = Directory.new()
	var helpPath = "res://Cards/" + SettingsManager.language + "/HELP/"
	helpDir.open(helpPath)
	helpDir.list_dir_begin()
		
	while true:
		var file = helpDir.get_next()
		if file == "":
			break
		elif not file.begins_with("."):
			var fileId = int(file.split(".")[0])
			files.append(fileId)

	helpDir.list_dir_end()

	
	var leisureDir = Directory.new()
	var leisurePath = "res://Cards/" + SettingsManager.language + "/LEISURE/"
	leisureDir.open(leisurePath)
	leisureDir.list_dir_begin()
		
	while true:
		var file = leisureDir.get_next()
		if file == "":
			break
		elif not file.begins_with("."):
			var fileId = int(file.split(".")[0])
			files.append(fileId)

	leisureDir.list_dir_end()

	files.sort()
	print(files)
	ChallengesManager.set_lastId(files[-1])
	
	









