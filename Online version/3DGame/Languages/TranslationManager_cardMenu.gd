extends Node


export(NodePath) var titleNode




	
func translate(zone):
	var language = SettingsManager.language
	var title   = get_node(titleNode)
	var zoneTranslated
	
	if language == "el":
		zoneTranslated = translate_zone_el(zone)
		title.text = "Κάρτες δοκιμασιών που χρησιμοποιήθηκαν στην περιοχή της πόλης " + zoneTranslated
		title.get("custom_fonts/font").set_size(25)
		
	elif language == "es":
		zoneTranslated = translate_zone_es(zone)
		title.text = "Cartas de retos usadas en la Zona " + zoneTranslated + " de la ciudad"
		
	elif language == "it":
		zoneTranslated = translate_zone_it(zone)
		title.text = "Carte sfida della Zona " + zoneTranslated + " della città"
				
	elif language == "pt":
		zoneTranslated = translate_zone_pt(zone)
		title.text = "Cartas de desafio da Área " + zoneTranslated + " da cidade"
		
	elif language == "en":
		title.text = "City's " + zone + " Zone's challenge cards"
		
		
		
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
		


