extends RayCast2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text


func _input(event):
	if Input.is_action_pressed("ui_right"):
		set_rotation_degrees(-90)
	if Input.is_action_pressed("ui_left"):
		set_rotation_degrees(90)
	if Input.is_action_pressed('ui_up'):
		set_rotation_degrees(180)
	if Input.is_action_pressed("ui_down"):
		set_rotation_degrees(0)
	if (event is InputEventKey and event.pressed and self.is_colliding()):
		if Input.is_key_pressed(KEY_SPACE):
			Global.pos = self.get_parent().position
			self.get_parent().get_parent().get_node("Ingredients").setIngredientpos()
			
			if (self.get_collider().name == "Fridge"):
				var scene = preload("res://Scenes/Fridge.tscn")
				var node = scene.instance()
				self.get_parent().get_parent().get_node("Overlay").add_child(node)
				
			elif(self.get_collider().name=="Trash"):
				var scene = preload("res://Scenes/Trash.tscn")
				var node = scene.instance()
				self.get_parent().get_parent().get_node("Overlay").add_child(node)
				
			elif (self.get_collider().name == "Sandwiches"):
				var scene = preload("res://Scenes/Sandwiches.tscn")
				var node = scene.instance()
				self.get_parent().get_parent().get_node("Overlay").add_child(node)

			elif (self.get_collider().name == "Blender"):
				var scene = preload("res://Scenes/Blender.tscn")
				var node = scene.instance()
				self.get_parent().get_parent().get_node("Overlay").add_child(node)
					
			elif (self.get_collider().get_parent().name == "HidingSpots"):
				Global.isHiding = true
				self.get_parent().position = self.get_collider().get_node("CollisionShape2D").position
		if Input.is_key_pressed(KEY_A) and not Global.isCarryingLeft:
			if(self.get_collider().name=="Singular"):
				IngredientVars.leftType = self.get_collider().get_parent().getSingular()
				IngredientVars.setIng(IngredientVars.leftType,1)
				IngredientVars.isNewIngredientLeftGet=true
				Global.isCarryingLeft=true		
				self.get_collider().get_parent().queue_free()
			if(self.get_collider().name=="Sandwich"):
				Global.isPickedUpSandwichLeft = true
				Global.setPickUpSandwich(self.get_collider().get_parent().getSandwich())
				Global.isCarryingLeft=true
				self.get_collider().get_parent().queue_free()
			if(self.get_collider().name=="Smoothie"):
				Global.isPickedUpSmoothieLeft = true
				Global.setPickUpSmoothie(self.get_collider().get_parent().getSmoothie())
				Global.isCarryingLeft=true
				self.get_collider().get_parent().queue_free()
		if Input.is_key_pressed(KEY_D) and not Global.isCarryingRight:
			if(self.get_collider().name=="Singular"):
				IngredientVars.rightType = self.get_collider().get_parent().getSingular()
				IngredientVars.setIng(IngredientVars.rightType,0)
				IngredientVars.isNewIngredientRightGet=true
				Global.isCarryingRight=true
				self.get_collider().get_parent().queue_free()
			if(self.get_collider().name=="Sandwich"):
				Global.isPickedUpSandwichRight = true
				Global.setPickUpSandwich(self.get_collider().get_parent().getSandwich())
				Global.isCarryingRight=true
				self.get_collider().get_parent().queue_free()
			if(self.get_collider().name=="Smoothie"):
				Global.isPickedUpSmoothieRight = true
				Global.setPickUpSmoothie(self.get_collider().get_parent().getSmoothie())
				Global.isCarryingRight=true
				self.get_collider().get_parent().queue_free()
		if Input.is_key_pressed(KEY_SHIFT) and Global.isCarryingLeft or Global.isCarryingRight:
			if (self.get_collider().name=="Sandwiches" or self.get_collider().name=="Blender"):
				if(Global.isCarryingLeft):
					Global.addIngredient(self.get_collider().name,IngredientVars.leftIng)
					Global.isCarryingLeft = false
				else:
					Global.addIngredient(self.get_collider().name,IngredientVars.rightIng)
					Global.isCarryingRight = false












# Called when the node enters the scene tree for the first time.
func _ready():
	set_collide_with_bodies(true)
	set_enabled(true)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
