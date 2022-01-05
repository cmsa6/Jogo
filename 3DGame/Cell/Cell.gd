extends Area

enum TYPE {
	INIT,
	NORMAL,
	END,
	GAME,
}

export(Color) var init_color = Color(0.02, 0.02, 0.8, 255)
export(Color) var normal_color = Color(0.8, 0.02, 0.02, 255)
export(Color) var end_color = Color(0.8, 0.7, 0.02, 255)
export(Color) var game_color = Color(0.02, 0.8, 0.02, 255)

export(TYPE) var type = TYPE.NORMAL

onready var mesh = $MeshInstance
onready var sprite = $Sprite3D

func _ready():
	var auxMat = SpatialMaterial.new()
	
	match type:
		TYPE.INIT:
			auxMat.albedo_color = init_color
			sprite.visible = false
		TYPE.NORMAL:
			auxMat.albedo_color = normal_color
			sprite.visible = false
		TYPE.END:
			auxMat.albedo_color = end_color
			sprite.visible = false
		TYPE.GAME:
			auxMat.albedo_color = game_color
			sprite.visible = true
	
	mesh.material_override = auxMat
