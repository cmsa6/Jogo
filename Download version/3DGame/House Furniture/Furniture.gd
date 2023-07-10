extends Spatial

export (int) var uid 

onready var meshInstance = $Mesh
onready var light = $OmniLight
onready var anim = $AnimationPlayer
onready var audio = $AudioFeedback




func get_uid():
	return uid
	
func activate_object():
	var materialName = "res://House Furniture/Materials/BookcaseMaterial.tres"
	var newMaterial = load(materialName)

	meshInstance.set_surface_material(0, newMaterial)
	
	
	
func stand_out_object(origin):
	var materialName = "res://House Furniture/Materials/BedMaterial.tres"
	var newMaterial = load(materialName)

	meshInstance.set_surface_material(0, newMaterial)
	
	if origin != "Map":
		light.visible = true
		
		#audio.play(0)
		anim.play("blink")
	
	
	
func deactivate_object():
	var materialName = "res://House Furniture/Materials/transparent.tres"
	
	var newMaterial = load(materialName)

	meshInstance.set_surface_material(0, newMaterial)
	
	
