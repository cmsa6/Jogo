extends Node


export(NodePath) var titleNode
export(NodePath) var mapZoneNode
export(NodePath) var mapZoneOptionsNode
export(NodePath) var cardTitleNode
export(NodePath) var descriptionNode
export(NodePath) var descriptionLimitNode
export(NodePath) var imageNode
export(NodePath) var imageOptionsNode
export(NodePath) var scoreNode
export(NodePath) var skillNode
export(NodePath) var skillOptionsNode
export(NodePath) var chooseImageDialogueNode
export(NodePath) var mandatoryNode





func _ready():
	translate(SettingsManager.language)

	
func translate(language):
	var title               = get_node(titleNode)
	var mapZone             = get_node(mapZoneNode)
	var mapZoneOptions      = get_node(mapZoneOptionsNode)
	var cardTitle           = get_node(cardTitleNode)
	var description         = get_node(descriptionNode)
	var descriptionLimit    = get_node(descriptionLimitNode)
	var image               = get_node(imageNode)
	var imageOptions        = get_node(imageOptionsNode)
	var score               = get_node(scoreNode)
	var skill               = get_node(skillNode)
	var skillOptions        = get_node(skillOptionsNode)
	var dialogue            = get_node(chooseImageDialogueNode)
	var mandatory           = get_node(mandatoryNode)
	


	if language == "el":
		title.text                = "Δημιουργία μιας νέας κάρτας δοκιμασίας"
		mapZone.text              = "Περιοχή"
		cardTitle.text            = "Τίτλος"
		description.text          = "Περιγραφή"
		descriptionLimit.text     = "(μέγιστο 200\nχαρακτήρες)"
		image.text                = "Εικόνα (.png)"
		imageOptions.text         = "Επιλέξτε"
		score.text                = "Σκορ"
		skill.text                = "Δεξιότητα"
		
		dialogue.set_text("Διαλέξτε μια εικόνα για αυτή τη δοκιμασία")
		dialogue.window_title = "Διαλέξτε μια εικόνα"
		
		
		mapZoneOptions.add_item("Επιλέξτε μια ζώνη πόλης")
		mapZoneOptions.add_item("Μπλε περιοχή - Περιοχή βοήθειας")
		mapZoneOptions.add_item("Πράσινη περιοχή - Περιοχή υπηρεσιών")
		mapZoneOptions.add_item("Πορτοκαλί περιοχή - Εμπορική περιοχή")
		mapZoneOptions.add_item("Μωβ περιοχή - Περιοχή αναψυχής")
	
		
		skillOptions.add_item("Επιλέξτε δεξιότητες που εκπαιδεύονται με πρόκληση")
		skillOptions.add_item("Διαπροσωπικές σχέσεις")
		skillOptions.add_item("Κοινωνική ένταξη")
		skillOptions.add_item("Δικαιώματα")
		skillOptions.add_item("Προσωπική εξέλιξη")
		skillOptions.add_item("Αυτοπροσδιορισμός")
		skillOptions.add_item("Σωματική ευεξία")
		skillOptions.add_item("Υλική ευημερία")
		skillOptions.add_item("Συναισθηματική ευεξία")
		skillOptions.add_item("Υπολογισμός και επίλυση προβλημάτων")
		skillOptions.add_item("Γλώσσα")
		skillOptions.add_item("Μνήμη και Προσοχή σε λεπτομέρειες")
		skillOptions.add_item("Χωρικός προσανατολισμός")
		skillOptions.add_item("Κοινωνική και συναισθηματική ευεξία")
		
		mandatory.text = "* Υποχρεωτικό"
		
		
		
		
	elif language == "es":
		title.text                = "Creando una nueva carta de reto"
		mapZone.text              = "Zona"
		cardTitle.text            = "Título"
		description.text          = "Descripción"
		descriptionLimit.text     = "(máximo 200 caracteres)"
		image.text                = "Imagen (.png)"
		imageOptions.text         = "Seleccionar"
		score.text                = "Puntuación"
		skill.text                = "Habilidad"
		
		dialogue.set_text("Elige una imagen para este reto")
		dialogue.window_title = "Elige una imagen"
		
		mapZoneOptions.add_item("Selecciona una zona de la ciudad")
		mapZoneOptions.add_item("Zona azul - Área de ayudas")
		mapZoneOptions.add_item("Zona verde - Área de servicios")
		mapZoneOptions.add_item("Zona naranja - Área comercial")
		mapZoneOptions.add_item("Zona morada - Área de ocio")
	
		
		skillOptions.add_item("Selecciona una habilidad fomentada por el reto")
		skillOptions.add_item("Relaciones Interpersonales")
		skillOptions.add_item("Inclusión Social")
		skillOptions.add_item("Derechos")
		skillOptions.add_item("Desarrollo Personal")
		skillOptions.add_item("Autodeterminación")
		skillOptions.add_item("Bienestar Físico")
		skillOptions.add_item("Bienestar Material")
		skillOptions.add_item("Bienestar Emocional")
		skillOptions.add_item("Calculo y Resolución de Problemas")
		skillOptions.add_item("Lenguaje")
		skillOptions.add_item("Memoria y Atención al Detalle")
		skillOptions.add_item("Orientación Espacial")
		skillOptions.add_item("Bienestar Social y Emocional")
		
		mandatory.text = "* Obligatorio"

		
		
		
		
	
	elif language == "it":
		title.text                = "Creazione di una nuova carta sfida"
		mapZone.text              = "Zona"
		cardTitle.text            = "Titolo"
		description.text          = "Descrizione"
		descriptionLimit.text     = "(max. 200 caratteri)"
		image.text                = "Immagine (.png)"
		imageOptions.text         = "Selezionare"
		score.text                = "Punto"
		skill.text                = "Abilità"
		
		dialogue.set_text("Scegli un'immagine per questa sfida")
		dialogue.window_title = "Scegli un'immagine"
		
		mapZoneOptions.add_item("Seleziona una zona della città")
		mapZoneOptions.add_item("Zona blu - Area di aiuto")
		mapZoneOptions.add_item("Zona verde - Zona servizi")
		mapZoneOptions.add_item("Zona arancio - Zona commerciale")
		mapZoneOptions.add_item("Zona viola - Zona ricreativa")
	
		
		skillOptions.add_item("Seleziona un'abilità incoraggiata dalla sfida")
		skillOptions.add_item("Relazioni Interpersonali")
		skillOptions.add_item("Inclusione Sociale")
		skillOptions.add_item("Diritti")
		skillOptions.add_item("Sviluppo Personale")
		skillOptions.add_item("Autodeterminazione")
		skillOptions.add_item("Benessere Fisico")
		skillOptions.add_item("Benessere Materiale")
		skillOptions.add_item("Benessere Emotivo")
		skillOptions.add_item("Calcolo e Risoluzione di Problemi")
		skillOptions.add_item("Linguaggio")
		skillOptions.add_item("Memoria e Attenzione al Dettaglio")
		skillOptions.add_item("Orientamento Spaziale")
		skillOptions.add_item("Benessere Socio-emozionale")
		
		mandatory.text = "* obbligatorio"
		

		
		
		
	
	elif language == "pt":
		title.text             = "Criação de nova carta de desafio"
		mapZone.text           = "Zona"
		cardTitle.text         = "Título"
		description.text       = "Descrição"
		descriptionLimit.text  = "(max. 200 caracts)"
		image.text             = "Imagem (.png)"
		imageOptions.text      = "Selecione"
		score.text             = "Pontuação"
		skill.text             = "Habilidade"
		
		dialogue.window_title = "Seleciona uma imagem"
		dialogue.set_text("Escolhe uma imagem para este desafio")
		
		mapZoneOptions.add_item("Selecione uma zona da cidade")
		mapZoneOptions.add_item("Zona azul - Área da ajuda")
		mapZoneOptions.add_item("Zona verde - Área de serviços")
		mapZoneOptions.add_item("Zona laranja - Área comercial")
		mapZoneOptions.add_item("Zona roxa - Área lazer")
	
		
		skillOptions.add_item("Selecione uma habilidade encorajada pelo desafio")
		skillOptions.add_item("Relações Interpessoais")
		skillOptions.add_item("Inclusão Social")
		skillOptions.add_item("Direitos")
		skillOptions.add_item("Desenvolvimento Pessoal")
		skillOptions.add_item("Autodeterminação")
		skillOptions.add_item("Bem-estar Fisico")
		skillOptions.add_item("Bem-estar Material")
		skillOptions.add_item("Bem-estar Emocional")
		skillOptions.add_item("Calculo e Resolução de Problemas")
		skillOptions.add_item("Linguagem")
		skillOptions.add_item("Memória e Atenção ao Detalhe")
		skillOptions.add_item("Orientação Espacial")
		skillOptions.add_item("Bem-estar Social e Emocional")
		
		mandatory.text = "* obrigatório"
		
		
		
		
	elif language == "en":
		mapZoneOptions.add_item("Select a city zone")
		mapZoneOptions.add_item("Blue Zone - Help Area")
		mapZoneOptions.add_item("Green Zone - Services Area")
		mapZoneOptions.add_item("Orange Zone - Commercial Area")
		mapZoneOptions.add_item("Purple Zone - Leisure Area")
	
		
		skillOptions.add_item("Select a skill encouraged by the challenge")
		skillOptions.add_item("Interpersonal Relationship")
		skillOptions.add_item("Social Inclusion")
		skillOptions.add_item("Rights")
		skillOptions.add_item("Personal Development")
		skillOptions.add_item("Self-Determination")
		skillOptions.add_item("Physical Wellbeing")
		skillOptions.add_item("Material Wellbeing")
		skillOptions.add_item("Emotional Wellbeing")
		skillOptions.add_item("Calculus and Problem Solving")
		skillOptions.add_item("Language")
		skillOptions.add_item("Memory and Attention to Detail")
		skillOptions.add_item("Spatial Orientation")
		skillOptions.add_item("Social and Emotional Wellbeing")
		
		
func translate_skill(skillId):
	var language = SettingsManager.language
	if skillId == 1:
		match language:
			"en": return "Interpersonal Relationship"
			"el": return "Διαπροσωπικές σχέσεις"
			"es": return "Relaciones Interpersonales"
			"it": return "Relazioni Interpersonali"
			"pt": return "Relações Interpessoais"
	
	elif skillId == 2:
		match language:
			"en": return "Social Inclusion"
			"el": return "Κοινωνική ένταξη"
			"es": return "Inclusión Social"
			"it": return "Inclusione Sociale"
			"pt": return "Inclusão Social"
	
	elif skillId == 3:
		match language:
			"en": return "Rights"
			"el": return "Δικαιώματα"
			"es": return "Derechos"
			"it": return "Diritti"
			"pt": return "Direitos"
	
	elif skillId == 4:
		match language:
			"en": return "Personal Development"
			"el": return "Προσωπική εξέλιξη"
			"es": return "Desarrollo Personal"
			"it": return "Sviluppo Personale"
			"pt": return "Desenvolvimento Pessoal"
	
	elif skillId == 5:
		match language:
			"en": return "Self-Determination"
			"el": return "Αυτοπροσδιορισμός"
			"es": return "Autodeterminación"
			"it": return "Autodeterminazione"
			"pt": return "Autodeterminação"
			
	elif skillId == 6:
		match language:
			"en": return "Physical Wellbeing"
			"el": return "Σωματική ευεξία"
			"es": return "Bienestar Físico"
			"it": return "Benessere Fisico"
			"pt": return "Bem-estar Fisico"
			
	elif skillId == 7:
		match language:
			"en": return "Material Wellbeing"
			"el": return "Υλική ευημερία"
			"es": return "Bienestar Material"
			"it": return "Benessere Materiale"
			"pt": return "Bem-estar Material"
		
	elif skillId == 8:
		match language:
			"en": return "Emotional Wellbeing"
			"el": return "Συναισθηματική ευεξία"
			"es": return "Bienestar Emocional"
			"it": return "Benessere Emotivo"
			"pt": return "Bem-estar Emocional"
			
	elif skillId == 9:
		match language:
			"en": return "Calculus and Problem Solving"
			"el": return "Υπολογισμός και επίλυση προβλημάτων"
			"es": return "Calculo y Resolución de Problemas"
			"it": return "Calcolo e Risoluzione di Problemi"
			"pt": return "Calculo e Resolução de Problemas"
			
	elif skillId == 10:
		match language:
			"en": return "Language"
			"el": return "Γλώσσα"
			"es": return "Lenguaje"
			"it": return "Linguaggio"
			"pt": return "Linguagem"
			
	elif skillId == 11:
		match language:
			"en": return "Memory and Attention to Detail"
			"el": return "Μνήμη και Προσοχή σε λεπτομέρειες"
			"es": return "Memoria y Atención al Detalle"
			"it": return "Memoria e Attenzione al Dettaglio"
			"pt": return "Memória e Atenção ao Detalhe"
			
	elif skillId == 12:
		match language:
			"en": return "Spatial Orientation"
			"el": return "Χωρικός προσανατολισμός"
			"es": return "Orientación Espacial"
			"it": return "Orientamento Spaziale"
			"pt": return "Orientação Espacial"

	elif skillId == 13:
		match language:
			"en": return "Social and Emotional Wellbeing"
			"el": return "Κοινωνική και συναισθηματική ευεξία"
			"es": return "Bienestar Social y Emocional"
			"it": return "Benessere Socio-emozionale"
			"pt": return "Bem-estar Social e Emocional"
			
func change_title():
	var title = get_node(titleNode)
	var language = SettingsManager.language
	
	if language == "el":
		title.text = "Επεξεργασία της κάρτας δοκιμασίας:"
		
	if language == "es":
		title.text = "Editando la carta de reto:"
		
	if language == "it":
		title.text = "Modifica della carta sfida:"
		
	if language == "pt":
		title.text = "Edição da carta de desafio:"
		
	if language == "en":
		title.text = "Editing the challenge card:"

