extends Node


export(NodePath) var space1
export(NodePath) var space2
export(NodePath) var space3
export(NodePath) var space4

export(NodePath) var image1
export(NodePath) var image2
export(NodePath) var image3
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
		space1Text.text      = "Όταν ο χαρακτήρας σας σταματήσει σε ένα κυκλικό πλακίδιο θα εμφανιστεί μια δοκιμασία."
		space2Text.text      = "Για παράδειγμα, αυτή η δοκιμασία λέγεται \"Πηγαίνοντας στοστη γιατρό\". Αν ολοκληρώσεις επιτυχώς τη δοκιμασία κερδίζεις μια τραπέζι."
		space3Text.text      = "Αφού πατήσεις το βελάκι, προσπάθησε να ολοκληρώσεις τη δοκιμασία."
		space4Text.text      = "Οι υπόλοιποι παίκτες αποφασίζουν αν έχεις ολοκληρώσει επιτυχώς τη δοκιμασία πατώντας το κουμπί \"Μου αρέσει\"."
	
	elif language == "es":
		space1Text.text = "Cuando tu personaje se detiene en un mosaico circular, ¡aparece un reto!"
		space2Text.text = "Por ejemplo, este reto se llama \"Como se Siente\". ¡Si aciertas puedes ganar un sofá!"	
		space3Text.text = "Después de presionar el botón de flecha, intenta completar el desafío"
		space4Text.text = "Los otros jugadores deciden si tuviste éxito presionando el botón \"Me gusta\"."

			
		


		
	elif language == "it":
			space1Text.text = "Quando il personaggio si ferma nella casella circolare, appare una sfida!"
			space2Text.text = "Per esempio, questa sfida è chiamata \"Osserva l'Emozione\". Se superata si può vincere una macchina per il caffè!"	
			space3Text.text = "Dopo aver premuto il pulsante con la freccia, prova a completare la sfida"
			space4Text.text = "Gli altri giocatori decidono se l'hai superata premendo il pulsante \"mi piace\"."
			
		


	
	elif language == "pt":
		if numPlayers == 1:
			space1Text.text = "Quando o teu personagem parar num circulo, aparece um desafio!"
			space2Text.text = "Por exemplo, este desafio chama-se \"Posição Certa\" e com ele podes ganhar uma mesa!"
			space3Text.text = "Depois de pressionares o botão da seta, tenta completar o desafio"
			space4Text.text = "Depois reflete na tua resposta e avalia-a!"
			
		else:
			space1Text.text = "Quando o teu personagem parar num circulo, aparece um desafio!"
			space2Text.text = "Por exemplo, este desafio chama-se Posição Certa e com ele podes ganhar uma mesa!"
			space3Text.text = "Depois de pressionares o botão da seta, tenta completar o desafio"
			space4Text.text = "Os outros jogadores decidem se ganhas, pressionando o botão do \"Gosto\""
		
		
		

	elif language == "en":
		space1Text.text = "When your character stops at a circle tile, a challenge pops up!"
		space2Text.text = "For example, this challenge is called \"Repeated Element\". If you succeed you can win a coffee machine!"
		space3Text.text = "After pressing the arrow button, try to complete the challenge."
		space4Text.text = "The other players decide whether you were successful by pressing the \"Like\" button."


func change_pictures(language):
	var image1File = get_node(image1)
	var image2File = get_node(image2)	
	var image3File = get_node(image3)		
	var image4File = get_node(image4)	
	
	var filePath 
	var image
	
	filePath = "res://Context Screen/Photos/" + language + "/" + "secondContext_image1.png"
	image = load(filePath)
	image1File.texture = image
	
	
	filePath = "res://Context Screen/Photos/" + language + "/" + "secondContext_image2.png"
	image = load(filePath)
	image2File.texture = image	


	filePath = "res://Context Screen/Photos/" + language + "/" + "secondContext_image3.png"
	image = load(filePath)
	image3File.texture = image


	filePath = "res://Context Screen/Photos/" + language + "/" + "secondContext_image4.png"
	image = load(filePath)
	image4File.texture = image