extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func free_self():
	queue_free()


func _on_MainButton_pressed():
	get_parent().switch_scene("StartScreen")


func _on_ExitButton_pressed():
	get_tree().quit()
