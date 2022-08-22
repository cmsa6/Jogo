extends Node


export(NodePath) var blueNodeZone
export(NodePath) var blueNodeArea
export(NodePath) var orangeNodeZone
export(NodePath) var orangeNodeArea
export(NodePath) var greenNodeZone
export(NodePath) var greenNodeArea
export(NodePath) var purpleNodeZone
export(NodePath) var purpleNodeArea

export(NodePath) var titleNode


func _ready():
	translate(SettingsManager.language)





	
func translate(language):
	var blueZone   = get_node(blueNodeZone)
	var blueArea   = get_node(blueNodeArea)
	var orangeZone = get_node(orangeNodeZone)
	var orangeArea = get_node(orangeNodeArea)
	var greenZone  = get_node(greenNodeZone)
	var greenArea  = get_node(greenNodeArea)
	var purpleZone = get_node(purpleNodeZone)
	var purpleArea = get_node(purpleNodeArea)
	
	var title      = get_node(titleNode)
	
	if language == "el":
		title.text = "Επιλέξτε μια τράπουλα με κάρτες πρόκλησης"
		
		blueZone.text = "Μπλε ζώνη"
		blueArea.text = "Περιοχή\nβοήθειας"
		
		orangeZone.text = "Πορτοκαλί ζώνη"
		orangeArea.text = "Εμπορικός\nχώρος"
		
		greenZone.text = "Πράσινη ζώνη"
		greenArea.text = "Περιοχή\nυπηρεσιών"
			
		purpleZone.text = "Μωβ ζώνη"
		purpleArea.text = "Χώρος\nαναψυχής"
		

	
	
	elif language == "es":
		title.text = "Elige una baraja de cartas de desafío"
		
		blueZone.text = "Zona Azul"
		blueArea.text = "Área de Ayuda"
		
		orangeZone.text = "Zona Naranja"
		orangeArea.text = "Area comercial"
		
		greenZone.text = "Zona Verde"
		greenArea.text = "Area de Servicios"
			
		purpleZone.text = "Zona Morada"
		purpleArea.text = "Area de Ocio"
		
		
		
	elif language == "it":
		title.text = "Scegli un mazzo di carte sfida"
		
		blueZone.text = "Zona Blu"
		blueArea.text = "Area di Aiuto"
		
		orangeZone.text = "Zona Arancio"
		orangeArea.text = "Area Commerciale"
		
		greenZone.text = "Zona Verde"
		greenArea.text = "Area Servizi"
			
		purpleZone.text = "Zona Viola"
		purpleArea.text = "Area Ricreativa"
		
		
				
	elif language == "pt":
		title.text = "Escolhe um baralho de cartas de desafio"
		
		blueZone.text = "Zona Azul"
		blueArea.text = "Área de Ajuda"
		
		orangeZone.text = "Zona Laranja"
		orangeArea.text = "Área de Serviços"
		
		greenZone.text = "Zona Verde"
		greenArea.text = "Área Comercial"
			
		purpleZone.text = "Zona Roxa"
		purpleArea.text = "Área de Lazer"
	

		
