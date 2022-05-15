extends Node


export(NodePath) var objects
export(NodePath) var points
export(NodePath) var qol
export(NodePath) var cf
export(NodePath) var qolPoints
export(NodePath) var cfPoints

export(NodePath) var seeDetails


func _ready():
	translate(SettingsManager.language)
	
func translate(language):
	var objectsText    = get_node(objects)
	var pointsText     = get_node(points)
	var qolText        = get_node(qol)
	var cfText         = get_node(cf)
	var qolPointsText  = get_node(qolPoints)
	var cfPointsText   = get_node(cfPoints)
	var seeDetailsText = get_node(seeDetails)
	
	
	var numObjs
	var numPoints
			
	if language == "el":
		objectsText.text = "1\nπαίχτης"
		pointsText.text  = "2\nΠαίκτες"
		qolText.text     = "3\nΠαίκτες"
		cfText.text      = "4\nΠαίκτες"
		
	elif language == "es":
		qolText.text     = "Calidad de Vida"
		qolPointsText.text = " PUNTOS"
		cfText.text      = "Funciones Cognitivas"
		cfPointsText.text = " PUNTOS"
		
		
		seeDetailsText.text = "Ver detalles"
		
	elif language == "it":
		qolText.text     = "Qualità della vita"
		qolPointsText.text = " PUNTI"
		
		cfText.text      = "Funzioni cognitive"
		cfPointsText.text = " PUNTI"
		
		seeDetailsText.text = "Guarda i Detagli"

	
	elif language == "pt":
		qolText.text        = "Qualidade de Vida"
		qolPointsText.text  = " PONTOS"
		
		cfText.text         = "Funções Cognitivas"
		qolPointsText.text  = " PONTOS"
		
		seeDetailsText.text = "Ver Detalhes"

	
func translate_total(objs, pnts):
	var language      = SettingsManager.language

	var objectsText   = get_node(objects)
	var pointsText    = get_node(points)
	

			
	if language == "el":
		pass
		
	elif language == "es":
		objectsText.text = objs + " OBJETOS"
		pointsText.text  = pnts + " PUNTOS"
		
	elif language == "it":
		objectsText.text = objs + " OGGETTI"
		pointsText.text  = pnts + " PUNTI"

	
	elif language == "pt":
		objectsText.text = objs + " OBJETOS"
		pointsText.text  = pnts + " PONTOS"
		
	elif language == "en":
		objectsText.text = objs + " OBJECTS"
		pointsText.text  = pnts + " POINTS"


		


		
		
		
		
		
