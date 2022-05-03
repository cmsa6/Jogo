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
			
	if language == "el":
		interpersonalRelationshipsText.text    = "1\nπαίχτης"
		socialInclusionText.text               = "2\nΠαίκτες"
		selfDeterminationText.text             = "3\nΠαίκτες"
		physicalWellbeingText.text             = "4\nΠαίκτες"
		materialWellbeingText.text             = "1\nπαίχτης"
		emotionalWellbeingText.text            = "2\nΠαίκτες"
		personalDevelopmentText.text           = "3\nΠαίκτες"
		rightsText.text                        = "4\nΠαίκτες"
		
		calculusAndProblemSolvingText.text     = "1\nπαίχτης"
		memoryAndAttentionToDetailText.text    = "2\nΠαίκτες"
		socialAndEmotionalWellbeingText.text   = "3\nΠαίκτες"
		languageText.text                      = "4\nΠαίκτες"
		spatialOrientationText.text            = "1\nπαίχτης"

		
	elif language == "es":
		qolText.text                           = "Calidad de Vida"
		cfText.text                            = "Funciones Cognitivas"

		interpersonalRelationshipsText.text    = "Relaciones Interpersonales"
		socialInclusionText.text               = "Inclusión\nSocial"
		selfDeterminationText.text             = "Auto\nDeterminación"
		physicalWellbeingText.text             = "Bienestar\nFísico"
		materialWellbeingText.text             = "Bienestar\nMaterial"
		emotionalWellbeingText.text            = "Bienestar\nEmocional"
		personalDevelopmentText.text           = "Desarrollo\nPersonal"
		rightsText.text                        = "Derechos"
		
		calculusAndProblemSolvingText.text     = "Calculo y Resolucion de Problemas"
		memoryAndAttentionToDetailText.text    = "Memoria y Atención al Detalle"
		socialAndEmotionalWellbeingText.text   = "Bienestar Social y Emocional"
		languageText.text                      = "Idioma"
		spatialOrientationText.text            = "Orientación\nEspacial"
		
	elif language == "it":
		qolText.text                           = "Qualità della vita"
		cfText.text                            = "Funzioni cognitive"

		interpersonalRelationshipsText.text    = "Relazioni Interpersonali"
		socialInclusionText.text               = "Integrazione\nSociale"
		selfDeterminationText.text             = "Auto\nDeterminazione"
		physicalWellbeingText.text             = "Benessere\nFisico"
		materialWellbeingText.text             = "Benessere\nMateriale"
		emotionalWellbeingText.text            = "Benessere\nEmotivo"
		personalDevelopmentText.text           = "Crescita\nPersonale"
		rightsText.text                        = "Diritti"
		
		calculusAndProblemSolvingText.text     = "Calcolo e Risoluzione dei Problemi"
		memoryAndAttentionToDetailText.text    = "Memoria e Cura dei Dettagli"
		socialAndEmotionalWellbeingText.text   = "Benessere Sociale ed Emotivo"
		languageText.text                      = "Linguaggio"
		spatialOrientationText.text            = "Orientamento\nSpaziale"
	
	elif language == "pt":
		qolText.text                           = "Qualidade de Vida"
		cfText.text                            = "Funções Cognitivas"
		
		interpersonalRelationshipsText.text    = "Relações Interpessoais"
		socialInclusionText.text               = "Inclusão\nSocial"
		selfDeterminationText.text             = "Auto\nDeterminação"
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
		
		
		
