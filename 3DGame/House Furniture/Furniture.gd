extends Spatial

export (int) var uid 

onready var meshInstance = $Mesh
#var newMaterial = preload("res://House Furniture/transparent.tres")



func get_uid():
	return uid
	
func activateObject():
	var materialName = "res://House Furniture/Materials/" + self.get_name() + "Material.tres"
	var newMaterial = load(materialName)

	meshInstance.set_surface_material(0, newMaterial)
	
func deactivateObject():
	var materialName = "res://House Furniture/Materials/transparent.tres"
	var newMaterial = load(materialName)

	meshInstance.set_surface_material(0, newMaterial)
	
	
