extends Node2D

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _on_StartButton_pressed():
	get_parent().switch_scene("Kitchen")

func free_self():
	queue_free()
