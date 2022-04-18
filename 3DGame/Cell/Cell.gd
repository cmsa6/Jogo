extends Area

enum TYPE {
	INIT,
	COMMERCIAL,
	LEISURE,
	SERVICES,
	HELP,
	GAME_COMMERCIAL,
	GAME_SERVICES,
	GAME_LEISURE,
	GAME_HELP,
	END,
}

#export(Color) var init_color = Color(0.02, 0.02, 0.8, 255)
#export(Color) var normal_color = Color(0.8, 0.02, 0.02, 255)
#export(Color) var end_color = Color(0.8, 0.7, 0.02, 255)
#export(Color) var game_color = Color(0.02, 0.8, 0.02, 255)

var init_color = Color8(132, 135, 130, 0)
var commercial_color = Color8( 237, 72, 21, 0 )
var help_color =  Color8( 11, 72, 125, 100 )
var leisure_color = Color8(113, 28, 232, 0)
var services_color = Color8(63, 230, 30, 0)

var commercialGame_color = Color8(158, 39, 2, 255)
var helpGame_color = Color8(4, 25, 43, 255)
var leisureGame_color = Color8(66, 13, 140, 255)
var servicesGame_color = Color8(21, 125, 0, 255)


export(TYPE) var type# = TYPE.NORMAL

onready var mesh = $MeshInstance
onready var mesh2 = $MeshInstance2
onready var sprite = $Sprite3D
onready var light = $OmniLight
onready var audio = $AudioStreamPlayer

var occupied = false setget set_occupied, get_occupied
var doNotPlay = false setget set_doNotPlay, get_doNotPlay

func _ready():
	var auxMat = SpatialMaterial.new()
	#var auxMat = mesh.get_surface_material(0)
	
	
	match type:
		TYPE.INIT:
			auxMat.albedo_color = init_color
			print(init_color)
			sprite.visible = false
		TYPE.COMMERCIAL:
			auxMat.albedo_color = commercial_color
			sprite.visible = false
		TYPE.LEISURE:
			auxMat.albedo_color = leisure_color
			sprite.visible = false
		TYPE.SERVICES:
			auxMat.albedo_color = services_color
			sprite.visible = false
		TYPE.HELP:
			auxMat.albedo_color = help_color
			sprite.visible = false
		#TYPE.END:
		#	auxMat.albedo_color = end_color
		#	sprite.visible = false
		TYPE.GAME_COMMERCIAL:
			auxMat.albedo_color = commercialGame_color
#			sprite.visible = true
			mesh2.material_override = auxMat
		TYPE.GAME_HELP:
			auxMat.albedo_color = helpGame_color
#			sprite.visible = true
			mesh2.material_override = auxMat
		TYPE.GAME_SERVICES:
			auxMat.albedo_color = servicesGame_color
#			sprite.visible = true
			mesh2.material_override = auxMat
		TYPE.GAME_LEISURE:
			auxMat.albedo_color = leisureGame_color
#			sprite.visible = true
			mesh2.material_override = auxMat
	
	
	#mesh.set_surface_material(0, auxMat)
	mesh.material_override = auxMat
	
	


func _on_Cell_body_entered(body):
	print(doNotPlay)
	if get_occupied() and not doNotPlay:
		#audio.play(0.2)
		audio.play(0)
		set_doNotPlay(false)

	set_occupied(true)
	light.visible = true



func _on_Cell_body_exited(body):
	set_occupied(false)
	light.fade_out()
	set_doNotPlay(false)

	
func set_occupied(bol):
	occupied = bol

func get_occupied():
	return occupied
	
func set_doNotPlay(bol):
	doNotPlay = bol
	
func get_doNotPlay():
	return doNotPlay





