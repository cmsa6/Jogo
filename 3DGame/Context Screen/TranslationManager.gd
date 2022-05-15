extends Node


export(NodePath) var space1
export(NodePath) var space2
export(NodePath) var space3
export(NodePath) var space4


func _ready():
	translate(SettingsManager.language)
	
func translate(language):
	var space1Text           = get_node(space1)
	var space2Text           = get_node(space2)
	var space3Text           = get_node(space3)
	var space4Text           = get_node(space4)
	
	var numPlayers = SettingsManager.num_of_players


	if language == "el":
		space1Text.text      = "Καλώς ήρθες "
		space2Text.text      = "παίχτης "
		space3Text.text      = "παίχτης "
		space4Text.text      = "παίχτης "
	
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
			space1Text.text = "Bem vindo  "
			space2Text.text = "Acabaste de chegar a uma nova cidade."
			space3Text.text = "E tens uma casa nova que vais ter de mobilar!"
			space4Text.text = "Podes ganhar objetos movendo-te pela cidade pressionando o botão dos dados!"
			
		else:
			space1Text.text = "Bem vindos "
			space2Text.text = "Acabaram de chegar a uma nova cidade."		
			space3Text.text = "E têm uma casa nova que vão ter de mobilar!"	
			space4Text.text = "Podem ganhar objetos movendo-se pela cidade pressionando o botão dos dados!"
		
		
		

	elif language == "en":
		#if numPlayers == 1:
		#	space3Text.text = "And you have a new empty house that you need to furnish!"
		#else:
		#	space3Text.text = "And each one of you has a new empty house that you need to furnish!"
		pass	
