extends Node


export(NodePath) var space1
export(NodePath) var space2
export(NodePath) var space3
export(NodePath) var space4

export(NodePath) var image4


func _ready():
	translate(SettingsManager.language)
	change_pictures(SettingsManager.language)
	
func translate(language):
	var space1Text           = get_node(space1)
	var space2Text           = get_node(space2)
	var space3Text           = get_node(space3)
	var space4Text           = get_node(space4)
	

	
	var numPlayers = SettingsManager.num_of_players


	if language == "el":
		if numPlayers == 1:
			space1Text.text      = "Καλωσήρθες "
			space2Text.text      = "Μόλις μετακόμισες σε μια νέα πόλη."
			space3Text.text      = "Απέκτησες ένα καινούργιο σπίτι. Ήρθε η ώρα να το επιπλώσεις."
			space4Text.text      = "Ολοκλήρωσε τις δοκιμασίες μέσα στην πόλη και κέρδισε αντικείμενα για το νέο σου σπίτι. Το μόνο που πρέπει να κάνεις είναι να πατήσεις το κουμπί με το ζάρι."
		else:
			space1Text.text      = "Καλωσήρθατε "
			space2Text.text      = "Μόλις μετακομίσατε σε μια νέα πόλη."
			space3Text.text      = "Κάθε παίκτης έχει αποκτήσει ένα νέο σπίτι. Ήρθε η ώρα να το επιπλώσετε."
			space4Text.text      = "Ολοκληρώστε τις δοκιμασίες μέσα στην πόλη και κερδίστε αντικείμενα για το νέο σας σπίτι. Το μόνο που πρέπει να κάνετε είναι να πατήσετε το κουμπί με το ζάρι."
			
		
		
		
	
	elif language == "es":
		if numPlayers == 1:
			space1Text.text = "Bienvenido "
			space3Text.text = "¡Y tienes una nueva casa vacía que necesitas amueblar!"
			space4Text.text = "¡Puedes ganar objetos desplazándote por la ciudad pulsando el botón de los dados!"
		else:
			space1Text.text = "Bienvenidos "
			space3Text.text = "¡Y tienen una casa nueva que tendrán que amueblar!"
			space4Text.text = "¡Puedes ganar objetos desplazándote por la ciudad pulsando el botón de los dados!"
			
		space2Text.text = "Te acabas de mudar a una nueva ciudad."	


		
	elif language == "it":
		if numPlayers == 1:
			space1Text.text = "Benvenuto "
			space3Text.text = "E hai una nuova casa che dovrai arredare!"
			space4Text.text = "Puoi vincere oggetti muovendoti per la città premendo il pulsante dei dadi!"
		else:
			space1Text.text = "Benvenuti "
			space3Text.text = "E hanno una nuova casa che dovranno arredare!"
			space4Text.text = "Puoi vincere oggetti muovendoti per la città premendo il pulsante dei dadi!"
			
		space2Text.text = "Ti sei appena trasferito in una nuova città."	


	
	elif language == "pt":
		if numPlayers == 1:
			space1Text.text = "Bem-Vindo "
			space2Text.text = "Acabaste de te mudar para uma nova cidade!"
			space3Text.text = "E tens uma casa nova! Agora está na altura de a mobilares!"
			space4Text.text = "Completa desafios pela cidade e ganha objetos. Só tens de pressionar o botão dos dados."
			
		else:
			space1Text.text = "Bem-Vindos "
			space2Text.text = "Acabaram de se mudar para uma nova cidade!"
			space3Text.text = "E cada um de vocês tem uma casa nova! Agora está na altura de a mobilarem!"  
			space4Text.text = "Completem desafios pela cidade e ganhem objetos. Só têm de pressionar o botão dos dados."
		
		
		

	elif language == "en":
		#if numPlayers == 1:
		#	space3Text.text = "And you have a new empty house that you need to furnish!"
		#else:
		#	space3Text.text = "And each one of you has a new empty house that you need to furnish!"
		pass	


func change_pictures(language):
	var image4File = get_node(image4)	
	var filePath 
	
	#TO DO
	if language == "es" or language == "en" or language == "it":
		filePath = "res://Context Screen/Photos/pt/firstContext_image4.png"
	else:
		filePath = "res://Context Screen/Photos/" + language + "/" + "firstContext_image4.png"
		
	var image = load(filePath)
	image4File.texture = image
