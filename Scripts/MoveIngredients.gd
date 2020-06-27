extends Area2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var leftIng = ""
var rightIng = ""
var leftFood =""
var rightFood = ""

# Called when the node enters the scene tree for the first time.
func _ready():
	pass
	

func _process(delta): #check if it's carrying
	if IngredientVars.isNewIngredientLeftGet: #single ingredient built in hands
		var scene = preload("res://Scenes/FoodItems.tscn")
		var node = scene.instance()
		node.isSingular=true
		node.buildSingular(IngredientVars.leftType, 0, self.position, self.get_node("CollisionShape2D").duplicate())
		IngredientVars.isNewIngredientLeftGet=false
		leftIng=IngredientVars.leftIng
		self.get_node("Left").add_child(node)
		node.set_name("leftfood")
		leftFood="Singular"
	if IngredientVars.isNewIngredientRightGet:
		var scene = preload("res://Scenes/FoodItems.tscn")
		var node = scene.instance()
		node.isSingular=true
		node.buildSingular(IngredientVars.rightType, 0, self.position, self.get_node("CollisionShape2D").duplicate())
		IngredientVars.isNewIngredientRightGet=false
		rightIng=IngredientVars.rightIng
		self.get_node("Right").add_child(node)
		node.set_name("rightfood")
		rightFood="Singular"
	if Global.isCarryingLeft: #make the left node visible or not depending on if we have stuff
		self.get_node("Left").visible = true
	else:
		self.get_node("Left").visible = false
		if(not self.get_node("Left").get_node("leftfood") == null):
			self.get_node("Left").get_node("leftfood").queue_free()
	if Global.isCarryingRight: #make the right node visible or not depending on if we have stuff
		self.get_node("Right").visible = true
	else:
		self.get_node("Right").visible = false
		if(not self.get_node("Right").get_node("rightfood") == null):
			self.get_node("Right").get_node("rightfood").queue_free()
	if Global.SandwichFinished: #finished sandwich built in hands
		var scene = preload("res://Scenes/FoodItems.tscn")
		var node = scene.instance()
		if not Global.isCarryingLeft:
			self.get_node("Left").add_child(node)
			node.set_name("leftfood")
			Global.isCarryingLeft =true
			leftFood="Sandwich"
		elif not Global.isCarryingRight:
			self.get_node("Right").add_child(node)
			node.set_name("rightfood")
			Global.isCarryingRight = true
			rightFood="Sandwich"
		node.isSandwich=true
		node.buildSandwich(Global.SandwichBuilding, rotation_degrees, self.position, self.get_node("CollisionShape2D").duplicate())
		Global.clear("Sandwich")
		Global.SandwichFinished=false
	if Global.SmoothieFinished: #finished sandwich built in hands
		var scene = preload("res://Scenes/FoodItems.tscn")
		var node = scene.instance()
		if not Global.isCarryingLeft:
			self.get_node("Left").add_child(node)
			node.set_name("leftfood")
			Global.isCarryingLeft =true
			leftFood="Smoothie"
		elif not Global.isCarryingRight:
			self.get_node("Right").add_child(node)
			node.set_name("rightfood")
			Global.isCarryingRight = true
			rightFood="Smoothie"
		node.isSmoothie=true
		node.buildSmoothie(Global.SmoothieBuilding, rotation_degrees, self.position, self.get_node("CollisionShape2D").duplicate())
		Global.clear("Smoothie")
		Global.SmoothieFinished=false
	if Global.isPickedUpSandwichLeft:
		var scene = preload("res://Scenes/FoodItems.tscn")
		var node = scene.instance()
		node.isSandwich=true
		node.buildSandwich(Global.PickedUpSandwich, rotation_degrees, self.position, self.get_node("CollisionShape2D").duplicate())
		self.get_node("Left").add_child(node)
		node.set_name("leftfood")
		leftFood="Sandwich"
		Global.isPickedUpSandwichLeft=false
	if Global.isPickedUpSandwichRight:
		var scene = preload("res://Scenes/FoodItems.tscn")
		var node = scene.instance()
		node.isSandwich=true
		node.buildSandwich(Global.PickedUpSandwich, rotation_degrees, self.position, self.get_node("CollisionShape2D").duplicate())
		self.get_node("Right").add_child(node)
		node.set_name("rightfood")
		rightFood="Sandwich"
		Global.isPickedUpSandwichRight=false
	if Global.isPickedUpSmoothieLeft:
		var scene = preload("res://Scenes/FoodItems.tscn")
		var node = scene.instance()
		node.isSmoothie=true
		node.buildSmoothie(Global.PickedUpSmoothie, rotation_degrees, self.position, self.get_node("CollisionShape2D").duplicate())
		self.get_node("Left").add_child(node)
		node.set_name("leftfood")
		leftFood="Smoothie"
		Global.isPickedUpSmoothieLeft=false
	if Global.isPickedUpSmoothieRight:
		var scene = preload("res://Scenes/FoodItems.tscn")
		var node = scene.instance()
		node.isSmoothie=true
		node.buildSmoothie(Global.PickedUpSmoothie, rotation_degrees, self.position, self.get_node("CollisionShape2D").duplicate())
		self.get_node("Right").add_child(node)
		node.set_name("rightfood")
		rightFood="Smoothie"
		Global.isPickedUpSmoothieRight=false

func _input(event):
	if Input.is_action_pressed("ui_right"):
		set_rotation_degrees(-90)
	if Input.is_action_pressed("ui_left"):
		set_rotation_degrees(90)
	if Input.is_action_pressed('ui_up'):
		set_rotation_degrees(180)
	if Input.is_action_pressed("ui_down"):
		set_rotation_degrees(0)
	if event is InputEventKey and event.pressed and Global.isCarryingLeft:
		if event.scancode == KEY_A:
			var scene = preload("res://Scenes/FoodItems.tscn")
			var node = scene.instance()
			if(leftFood=="Singular"):
				node.buildSingular(IngredientVars.leftType, rotation_degrees, self.get_parent().position, self.get_node("CollisionShape2D").duplicate())
			elif(leftFood=="Sandwich"):
				node.buildSandwich(self.get_node("Left").get_node("leftfood").getSandwich(),rotation_degrees,self.get_parent().position,self.get_node("CollisionShape2D").duplicate())
			elif(leftFood=="Smoothie"):
				node.buildSmoothie(self.get_node("Left").get_node("leftfood").getSmoothie(),rotation_degrees,self.get_parent().position,self.get_node("CollisionShape2D").duplicate())
			self.get_parent().get_parent().get_node("Ingredients").add_child(node)
			
			Global.isCarryingLeft = false
	if event is InputEventKey and event.pressed and Global.isCarryingRight:	
		if event.scancode == KEY_D: #same as above
			var scene = preload("res://Scenes/FoodItems.tscn")
			var node = scene.instance()
			if(rightFood=="Singular"):
				node.buildSingular(IngredientVars.rightType, rotation_degrees, self.get_parent().position, self.get_node("CollisionShape2D").duplicate())
			elif(rightFood=="Sandwich"):
				node.buildSandwich(self.get_node("Right").get_node("rightfood").getSandwich(),rotation_degrees,self.get_parent().position,self.get_node("CollisionShape2D").duplicate())
			elif(rightFood=="Smoothie"):
				node.buildSmoothie(self.get_node("Right").get_node("rightfood").getSmoothie(),rotation_degrees,self.get_parent().position,self.get_node("CollisionShape2D").duplicate())
			
			self.get_parent().get_parent().get_node("Ingredients").add_child(node)
			Global.isCarryingRight = false
		
