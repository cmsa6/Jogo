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
var commercial_color = Color8(252, 140, 48, 255)
var help_color = Color8(32, 170, 237, 255)
var leisure_color = Color8(179, 48, 219, 255)
var services_color = Color8(108, 219, 48, 255)

var commercialGame_color = Color8(189, 103, 32, 255)
var helpGame_color = Color8(24, 108, 150, 255)
var leisureGame_color = Color8(114, 27, 140, 255)
var servicesGame_color = Color8(81, 166, 35, 255)


export(TYPE) var type# = TYPE.NORMAL

onready var mesh = $MeshInstance
onready var sprite = $Sprite3D

func _ready():
	var auxMat = SpatialMaterial.new()
	
	match type:
		TYPE.INIT:
			auxMat.albedo_color = init_color
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
	
	mesh.material_override = auxMat
