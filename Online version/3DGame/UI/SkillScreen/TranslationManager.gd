extends Node

export(NodePath) var qol
export(NodePath) var cf

export(NodePath) var interpersonalRelationships
export(NodePath) var socialInclusion
export(NodePath) var selfDetermination
export(NodePath) var physicalWellbeing
export(NodePath) var materialWellbeing
export(NodePath) var emotionalWellbeing
export(NodePath) var personalDevelopment
export(NodePath) var rights

export(NodePath) var calculusAndProblemSolving
export(NodePath) var memoryAndAttentionToDetail
export(NodePath) var socialAndEmotionalWellbeing
export(NodePath) var languageDevelopment
export(NodePath) var spatialOrientation

export(NodePath) var totalPoints




func _ready():
	translate(SettingsManager.language)
	
func translate(language):
	var qolText                          =   get_node(qol)
	var cfText                          =   get_node(cf)
	
	var interpersonalRelationshipsText   =   get_node(interpersonalRelationships)
	var socialInclusionText              =   get_node(socialInclusion)
	var selfDeterminationText            =   get_node(selfDetermination)
	var physicalWellbeingText            =   get_node(physicalWellbeing)
	var materialWellbeingText            =   get_node(materialWellbeing)
	var emotionalWellbeingText           =   get_node(emotionalWellbeing)
	var personalDevelopmentText          =   get_node(personalDevelopment)
	var rightsText                       =   get_node(rights)
	
	var calculusAndProblemSolvingText    =   get_node(calculusAndProblemSolving)
	var memoryAndAttentionToDetailText   =   get_node(memoryAndAttentionToDetail)
	var socialAndEmotionalWellbeingText  =   get_node(socialAndEmotionalWellbeing)
	var languageText                     =   get_node(languageDevelopment)
	var spatialOrientationText           =   get_node(spatialOrientation)
	
	var totalPointsText                  =   get_node(totalPoints)
			
	if language == "el":
		qolText.text                           = "Δεξιότητες ποιότητας ζωής"
		cfText.text                            = "Γνωστικές λειτουργίες"
		
		interpersonalRelationshipsText.text    = "Διαπροσωπικές σχέσεις"
		socialInclusionText.text               = "Κοινωνική\nένταξη"
		selfDeterminationText.text             = "Αυτοπροσδιορισμός"
		physicalWellbeingText.text             = "Σωματική\nευεξία"
		materialWellbeingText.text             = "Υλική\nευημερία"
		emotionalWellbeingText.text            = "Συναισθηματική\nευεξία"
		personalDevelopmentText.text           = "Προσωπική\nεξέλιξη"
		rightsText.text                        = "Δικαιώματα"
		
		calculusAndProblemSolvingText.text     = "Υπολογισμός και επίλυση προβλημάτων"
		memoryAndAttentionToDetailText.text    = "Μνήμη και Προσοχή σε λεπτομέρειες"
		socialAndEmotionalWellbeingText.text   = "Κοινωνική και συναισθηματική ευεξία"
		languageText.text                      = "Γλώσσα"
		spatialOrientationText.text            = "Χωρικός\nπροσανατολισμός"
		
		totalPointsText.text                   = "Συνολικοί βαθμοί: "

		
	elif language == "es":
		qolText.text                           = "Habilidades de Calidad de Vida"
		cfText.text                            = "Funciones Cognitivas"

		interpersonalRelationshipsText.text    = "Relaciones Interpersonales"
		socialInclusionText.text               = "Inclusión\nSocial"
		selfDeterminationText.text             = "Autodeterminación"
		physicalWellbeingText.text             = "Bienestar\nFísico"
		materialWellbeingText.text             = "Bienestar\nMaterial"
		emotionalWellbeingText.text            = "Bienestar\nEmocional"
		personalDevelopmentText.text           = "Desarrollo\nPersonal"
		rightsText.text                        = "Derechos"
		
		calculusAndProblemSolvingText.text     = "Calculo y Resolución de Problemas"
		memoryAndAttentionToDetailText.text    = "Memoria y Atención al Detalle"
		socialAndEmotionalWellbeingText.text   = "Bienestar Social y Emocional"
		languageText.text                      = "Lenguaje"
		spatialOrientationText.text            = "Orientación\nEspacial"
		
		totalPointsText.text                       = "Puntos totales: "
		
	elif language == "it":
		qolText.text                           = "Abilità in Qualità di Vita"
		cfText.text                            = "Funzioni cognitive"

		interpersonalRelationshipsText.text    = "Relazioni Interpersonali"
		socialInclusionText.text               = "Inclusione\nsociale"
		selfDeterminationText.text             = "Autodeterminazione"
		physicalWellbeingText.text             = "Benessere\nFisico"
		materialWellbeingText.text             = "Benessere\nMateriale"
		emotionalWellbeingText.text            = "Benessere\nEmotivo"
		personalDevelopmentText.text           = "Sviluppo\npersonale"
		rightsText.text                        = "Diritti"
		
		calculusAndProblemSolvingText.text     = "Calcolo e Risoluzione di Problemi"
		memoryAndAttentionToDetailText.text    = "Memoria e Attenzione al Dettaglio"
		socialAndEmotionalWellbeingText.text   = "Benessere Socio-emozionale"
		languageText.text                      = "Linguaggio"
		spatialOrientationText.text            = "Orientamento\nSpaziale"
		
		totalPointsText.text                       = "punti totali: "
	
	elif language == "pt":
		qolText.text                           = "Capacidades de Qualidade de Vida"
		cfText.text                            = "Funções Cognitivas"
		
		interpersonalRelationshipsText.text    = "Relações Interpessoais"
		socialInclusionText.text               = "Inclusão\nSocial"
		selfDeterminationText.text             = "Autodeterminação"
		physicalWellbeingText.text             = "Bem-estar\nFisico"
		materialWellbeingText.text             = "Bem-estar\nMaterial"
		emotionalWellbeingText.text            = "Bem-estar\nEmocional"
		personalDevelopmentText.text           = "Desenvolvimento\nPessoal"
		rightsText.text                        = "Direitos"
		
		calculusAndProblemSolvingText.text     = "Calculo e Resolução de Problemas"
		memoryAndAttentionToDetailText.text    = "Memória e Atenção ao Detalhe"
		socialAndEmotionalWellbeingText.text   = "Bem-estar Social e Emocional"
		languageText.text                      = "Linguagem"
		spatialOrientationText.text            = "Orientação\nEspacial"
		
		totalPointsText.text                       = "Pontos totais: "
		
		
		
