extends Node

signal map_loaded

export (Array, NodePath) var to_disable
export (NodePath) var top_view_cam
export (int) var load_time = 5.0

var timer = 0

onready var loading_bar = $ProgressBar

func _ready():
	load_map()

func load_map():
	get_node(top_view_cam).make_current()
	SetNodesVisibility(false)

func _process(delta):
	timer += delta
	loading_bar.value = (timer * 100) / load_time
	if timer >= load_time:
		loading_bar.value = 100
		loading_bar.visible = false
		emit_signal("map_loaded")
		SetNodesVisibility(true)

func SetNodesVisibility(b):
	for nodePath in to_disable:
		get_node(nodePath).visible = b
