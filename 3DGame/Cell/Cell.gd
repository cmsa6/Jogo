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

var init_color = Color8(132, 135, 130, 255)
var commercial_color = Color8( 237, 72, 21, 255 )
var help_color =  Color8( 11, 72, 125, 255 )
var leisure_color = Color8(113, 28, 232, 255)
var services_color = Color8(63, 230, 30, 255)

var commercialGame_color = Color8(158, 39, 2, 255)
var helpGame_color = Color8(4, 25, 43, 255)
var leisureGame_color = Color8(66, 13, 140, 255)
var servicesGame_color = Color8(21, 125, 0, 255)


export(TYPE) var type# = TYPE.NORMAL

onready var mesh = $MeshInstance
onready var sprite = $Sprite3D

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
			sprite.visible = true
		TYPE.GAME_HELP:
			auxMat.albedo_color = helpGame_color
			sprite.visible = true
		TYPE.GAME_SERVICES:
			auxMat.albedo_color = servicesGame_color
			sprite.visible = true
		TYPE.GAME_LEISURE:
			auxMat.albedo_color = leisureGame_color
			sprite.visible = true
	
	
	#mesh.set_surface_material(0, auxMat)
	mesh.material_override = auxMat
