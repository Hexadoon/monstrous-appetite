extends RayCast2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text


func get_input():
	if (self.is_colliding()):
		if Input.is_key_pressed(KEY_SPACE):
			if (self.get_collider().name == "Fridge"):
				get_tree().change_scene("res://Scenes/Fridge.tscn")
			elif (self.get_collider().name == "Sandwiches"):
				get_tree().change_scene("res://Scenes/Sandwiches.tscn")













# Called when the node enters the scene tree for the first time.
func _ready():
	set_collide_with_bodies(true)
	set_enabled(true)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	get_input()
	pass
