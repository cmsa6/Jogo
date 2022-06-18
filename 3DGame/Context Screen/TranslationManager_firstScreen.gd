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
			space2Text.text = "Te acabas de mudar a una nueva ciudad."	
			space3Text.text = "Tienes una nueva casa. Es hora de amueblarla."
			space4Text.text = "Completa los retos por toda la ciudad y gana objetos. Sólo necesitas presionar el botón del dado!"
		else:
			space1Text.text = "Bienvenidos "
			space2Text.text = "Os acabais de mudar a una nueva ciudad."	
			space3Text.text = "Cada jugador tiene una nueva casa. Ahora es el momento de amueblarla"
			space4Text.text = "Completad los retos por toda la ciudad y gana objetos. Sólo necesitáis presionar el botón del dado!"
			
		


		
	elif language == "it":
		if numPlayers == 1:
			space1Text.text = "Benvenuto "
			space2Text.text = "Ti sei appena trasferito in una nuova città."
			space3Text.text = "Hai una casa nuova. Adesso bisogna metterci i mobili."
			space4Text.text = "Completa le sfide in giro per la città per vincere degli oggetti. Devi solo premere il pulsante del dado!"
		else:
			space1Text.text = "Benvenuti "
			space2Text.text = "Vi siete appena trasferiti in una nuova città."
			space3Text.text = "Ogni giocatore ha una casa nuova. Adesso bisogna metterci i mobili."
			space4Text.text = "Completate le sfide in giro per la città per vincere degli oggetti. Dovete solo premere il pulsante del dado!"
			
			
		


	
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
		if numPlayers == 1:
			space1Text.text = "Welcome "
			space2Text.text = "You have just moved to a new city!"
			space3Text.text = "You have a new house. Now it is time to furnish it."
			space4Text.text = "Complete challenges throughout the city and win objects. You just need to press the dice button!"
			
		else:
			space1Text.text = "Welcome "
			space2Text.text = "You have just moved to a new city!"
			space3Text.text = "Each player has a new house. Now it is time to furnish it."  
			space4Text.text = "Complete challenges throughout the city and win objects. You just need to press the dice button!"


func change_pictures(language):
	var image4File = get_node(image4)	
	var filePath 
	
	
	filePath = "res://Context Screen/Photos/" + language + "/" + "firstContext_image4.png"
		
	var image = load(filePath)
	image4File.texture = image
