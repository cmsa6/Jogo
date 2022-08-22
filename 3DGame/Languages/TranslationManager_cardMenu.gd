extends Node


export(NodePath) var titleNode




	
func translate(zone):
	var language = SettingsManager.language
	var title   = get_node(titleNode)
	var zoneTranslated
	
	if language == "el":
		zoneTranslated = translate_zone_el( zone)
		title.text = "κάρτες πρόκλησης της " + zoneTranslated + " ζώνης της πόλης"
		
	elif language == "es":
		zoneTranslated = translate_zone_es( zone)
		title.text = "Cartas de desafío de la Zona " + zoneTranslated + " azul de la ciudad"
		
	elif language == "it":
		zoneTranslated = translate_zone_it(zone)
		title.text = "Carte sfida della Zona " + zoneTranslated + " blu della città"
				
	elif language == "pt":
		zoneTranslated = translate_zone_pt(zone)
		title.text = "Cartas de desafio da Área " + zoneTranslated + " azul da cidade"
		
	elif language == "en":
		title.text = "City's " + zone + "Zone's challenge cards"
		
		
		
func translate_zone_el(zone):
	match zone:
		"Blue": return "Μπλε"
		"Orange": return "Πορτοκαλί"
		"Green": return "Πράσινη"
		"Purple": return "Μωβ"
		
		
func translate_zone_es(zone):
	match zone:
		"Blue": return "Azul"
		"Orange": return "Naranja"
		"Green": return "Verde"
		"Purple": return "Morada"
		
func translate_zone_it(zone):
	match zone:
		"Blue": return "Blu"
		"Orange": return "Arancione"
		"Green": return "Verde"
		"Purple": return "Viola"
		
func translate_zone_pt(zone):
	match zone:
		"Blue": return "Azul"
		"Orange": return "Laranja"
		"Green": return "Verde"
		"Purple": return "Roxa"
		



