extends Control

export(Color) var title_color = Color.blueviolet
export(float) var time_between_sections = 1.0
export(float) var line_time = 0.3
export(int) var speed = 100

export(String, FILE) var mapUsed

var scroll_speed = speed

var started = false
var finished = false

var section
var section_next = true
var section_timer = 0.0
var line_timer = 0.0
var curr_line = 0
var lines = []
var credits = [] setget set_credits, get_credits


func _ready():
	if SettingsManager.language == "el":
		var text = [
		[
			"Ένα παιχνίδι που υλοποιήθηκε στο πλαίσιο του έργου ID-GAMING",
			"Συγχρηματοδοτούμενο από το Πρόγραμμα Erasmus+ της Ευρωπαϊκής Ένωσης"
		],
		[
			"Συνεργάτες - Εταίροι",
			"C.E.C.D. Mira Sintra, Πορτογαλία (Συντονισμός Έργου)",
			"INESC-ID, Πορτογαλία",
			"Αριστοτέλειο Πανεπιστήμιο Θεσσαλονίκης, Ελλάδα",
			"CSS Forlì, Ιταλία",
			"COPAVA, Ισπανία",
			"AIAS, Ιταλία"
		],
		[
			"Σχεδιαστής παιχνιδιών",
			"Cristiana Antunes",
			"Tiago Toscano"
		],
		[
			"Προγραμματισμός",
			"Cristiana Antunes",
			"Tiago Toscano"
		],
		[
			"Art",
			"Artist Name"
		],
		[
			"Music",
			"Musician Name"
		],
		[
			"Ηχητικά εφέ",
			"https://www.zapsplat.com/"
		],
		[
			"Testers",
			"Name 1",
			"Name 2",
			"Name 3"
		],
		[
			"Χρησιμοποιούμενα εργαλεία",
			"Αναπτύχθηκε με την πλατφόρμα δημιουργίας παιχνιδιών Godot",
			"https://godotengine.org/license",
			"",
			"Art created with My Favourite Art Program",
			"https://myfavouriteartprogram.com"
		],
		[
			"Χρησιμοποιούμενοι πόροι παιχνιδιού",
			"Χαρακτήρας και Κίνηση: Mixamo, Adobe Systems Incorporated",
			"Υλικά: Texture Heaven, Polygon",
			#"Icons: Hysen Drogu, pngTree"
			"Icons: Flaticon, Kenney.nl, opengameart.org",
			"Κτίρια της πόλης: Itch.io"
		]
	]
	
		set_credits(text)
		
	elif SettingsManager.language == "en":
		var text = [
		[
			"A game by ID-GAMMING Project",
			"Co-funded by the Erasmus+ Programme of the European Union"
		],
		[
			"Partners",
			"C.E.C.D. Mira Sintra, Portugal (Project Coordination)",
			"INESC-ID, Portugal",
			"The Aristotle University of Thessaloniki, Greece",
			"CSS Forlì, Italy",
			"COPAVA, Spain",
			"AIAS, Italy"
		],
		[
			"Game Designer",
			"Cristiana Antunes",
			"Tiago Toscano"
		],
		[
			"Programming",
			"Cristiana Antunes",
			"Tiago Toscano"
		],
		[
			"Art",
			"Artist Name"
		],
		[
			"Music",
			"Musician Name"
		],
		[
			"Sound Effects",
			"https://www.zapsplat.com/"
		],
		[
			"Testers",
			"Name 1",
			"Name 2",
			"Name 3"
		],
		[
			"Tools used",
			"Developed with Godot Engine",
			"https://godotengine.org/license",
			"",
			"Art created with My Favourite Art Program",
			"https://myfavouriteartprogram.com"
		],
		[
			"Assets used",
			"Character & Animations: Mixamo, Adobe Systems Incorporated",
			"Materials: Texture Heaven, Polygon",
			#"Icons: Hysen Drogu, pngTree"
			"Icons: Flaticon, Kenney.nl, opengameart.org",
			"City buildings: Itch.io"
		]
	]
	
		set_credits(text)


#var credits = [
#	[
#		"A game by ID-GAMMING Project",
#		"Co-funded by the Erasmus+ Programme of the European Union"
#	],
#	[
#		"Partners",
#		"C.E.C.D. Mira Sintra, Portugal (Project Coordination)",
#		"INESC-ID, Portugal",
#		"The Aristotle University of Thessaloniki, Greece",
#		"CSS Forlì, Italy",
#		"COPAVA, Spain",
#		"AIAS, Italy"
#	],
#	[
#		"Game Designer",
#		"game designer"
#	],
#	[
#		"Programming",
#		"Programmer Name",
#		"Programmer Name 2"
#	],
#	[
#		"Art",
#		"Artist Name"
#	],
#	[
#		"Music",
#		"Musician Name"
#	],
#	[
#		"Sound Effects",
#		"SFX Name"
#	],
#	[
#		"Testers",
#		"Name 1",
#		"Name 2",
#		"Name 3"
#	],
#	[
#		"Tools used",
#		"Developed with Godot Engine",
#		"https://godotengine.org/license",
#		"",
#		"Art created with My Favourite Art Program",
#		"https://myfavouriteartprogram.com"
#	],
#	[
#		"Assets Used",
#		"Character & Animations: Mixamo, Adobe Systems Incorporated",
#		"Materials: Texture Heaven, Polygon",
#		"Icons: Hysen Drogu, pngTree"
#	]
#]

onready var line = $CreditsContainer/LineTemplate
onready var creditsContainer = $CreditsContainer


#func _ready():
	#var map_node = get_node("/root/Map1")
	#map_node.queue_free()
	#var root_node = get_node("/root")
	#root_node.get_children()[3].queue_free()
	#print(root_node.get_children()[3].get_children()) 

func _process(delta):
	var scroll_speed = speed * delta
	
	if section_next:
		section_timer += delta
		if section_timer >= time_between_sections:
			section_timer -= time_between_sections
			
			if get_credits().size() > 0:
				started = true
				section = get_credits().pop_front()
				curr_line = 0
				add_line()
	else:
		line_timer += delta
		if line_timer >= line_time:
			line_timer -= line_time
			add_line()

	if lines.size() > 0:
		for l in lines:
			l.rect_position.y -= scroll_speed
			if l.rect_position.y < -l.get_line_height():
				lines.erase(l)
				l.queue_free()
	elif started:
		finish()


func finish():
	if not finished:
		finished = true
		# NOTE: This is called when the credits finish
		# - Hook up your code to return to the relevant scene here, eg...
		#get_tree().change_scene("res://scenes/MainMenu.tscn")


func add_line():
	var new_line = line.duplicate()
	new_line.text = section.pop_front()
	lines.append(new_line)
	if curr_line == 0:
		new_line.add_color_override("font_color", title_color)
	creditsContainer.add_child(new_line)
	
	if section.size() > 0:
		curr_line += 1
		section_next = false
	else:
		section_next = true


func set_credits(text):
	credits = text
	
func get_credits():
	return credits
