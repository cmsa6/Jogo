extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	print("ready")
	check_cards_uid()


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
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
	
	



