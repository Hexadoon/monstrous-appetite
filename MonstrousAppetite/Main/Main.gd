extends Node

export (PackedScene) var StartScreen
export (PackedScene) var Kitchen
export (PackedScene) var GameOver

var current_scene = null

# Called when the node enters the scene tree for the first time.
func _ready():
	current_scene = StartScreen.instance()
	add_child(current_scene)

func switch_scene(name):
	get_child(0).free_self()
	match name:
		"Kitchen":
			current_scene = Kitchen.instance()
		"StartScreen":
			current_scene = StartScreen.instance()
		"GameOver":
			current_scene = GameOver.instance()
	add_child(current_scene)
