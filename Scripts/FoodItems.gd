extends Node

var ingredients = [0,0,0,0,0,0,0,0,0,0,0]
var isSingular = false
var isSandwich = false
var isSmoothie = false
var rotation = 0
var position = Vector2()
var shape = CollisionShape2D
var ingPool = PoolIntArray()

var height = 0
var change = 1

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func addIngredient(type,addon):
	var addonSprite = Sprite.new()
	if type==0:
		ingredients[0]+=1
		addonSprite.texture = load("res://Assets/bread.png")
	elif type==1:
		ingredients[1]+=1
		addonSprite.texture = load("res://Assets/cheesy.png")
	elif type==2:
		ingredients[2]+=1
		addonSprite.texture = load("res://Assets/Ham.png")
	elif type==3:
		ingredients[3]+=1
		addonSprite.texture = load("res://Assets/lettuce.png")
	elif type==4:
		ingredients[4]+=1
		addonSprite.texture = load("res://Assets/onion.png")
	elif type==5:
		ingredients[5]+=1
		addonSprite.texture = load("res://Assets/tomato.png")
	elif type==6:
		ingredients[6]+=1
		addonSprite.texture = load("res://Assets/IceCream.png")
	elif type==7:
		ingredients[7]+=1
		addonSprite.texture = load("res://Assets/Banana.png")
	elif type==8:
		ingredients[8]+=1
		addonSprite.texture = load("res://Assets/Fish.png")
	elif type==9:
		ingredients[9]+=1
		addonSprite.texture = load("res://Assets/Pizza.png")
	elif type==10:
		ingredients[10]+=1
		addonSprite.texture = load("res://Assets/Bottle.png")
		
	addonSprite.set_scale(Vector2(0.1, 0.1))
	
	addonSprite.set_name("Sprite") #NEEDED TO GET THE SPRITE TEXTURE UPON PICK UP
	addon.add_child(addonSprite)

	
func buildSingular(type, rot, pos, shap):
	isSingular=true
	rotation = rot
	position = pos
	shape = shap
	var addon=StaticBody2D.new() #things to add
#	self.add_child(shape)
#	ingredients[type]=1
	addIngredient(type,addon)
	addon.position = position #get location
	addon.rotation_degrees=rotation
	addon.global_translate(Vector2(height,0)) #move location to below player
	if(rotation==0):
		addon.global_translate(Vector2(0,20))
	elif(rotation==90):
		addon.global_translate(Vector2(-20,0))
	elif(rotation==-90):
		addon.global_translate(Vector2(20,0))
	elif(rotation==180):
		addon.global_translate(Vector2(0,-60)) 
	#above ifelse statement needed to make the ingredient land in front of player
	addon.add_child(shape)
	addon.set_name("Singular")
	self.add_child(addon)	

func buildSandwich(ing, rot, pos, shap):
	var addon=StaticBody2D.new() #things to add	
	isSandwich = true
	var addonSprite = Sprite.new()
	addonSprite.texture = load("res://Assets/plate_alone.png")
	addonSprite.set_scale(Vector2(0.75,0.75))
	addon.add_child(addonSprite)
	rotation=rot
	position=pos
	shape = shap
	ingPool=ing
#	self.add_child(shape)
	var build = Array(ing)
	for i in range(build.size()):
		addIngredient(build[i], addon)
		height+=change
	addon.position = position #get location
	addon.rotation_degrees=rotation
	addon.global_translate(Vector2(height,0)) #move location to below player
	if(rotation==0):
		addon.global_translate(Vector2(0,20))
	elif(rotation==90):
		addon.global_translate(Vector2(-20,0))
	elif(rotation==-90):
		addon.global_translate(Vector2(20,0))
	elif(rotation==180):
		addon.global_translate(Vector2(0,-40)) 
	#above ifelse statement needed to make the ingredient land in front of player
	addon.add_child(shape)	
	addon.set_name("Sandwich")
	self.add_child(addon)	
	
func buildSmoothie(ing, rot, pos, shap):
	var addon=StaticBody2D.new() #things to add	
	isSmoothie = true
	var addonSprite = Sprite.new()
	addonSprite.texture = load("res://Assets/kitchen_v01_closeup_Blender_Glass.png")
	rotation=rot
	position=pos
	shape = shap
	ingPool=ing
#	self.add_child(shape)
	var build = Array(ing)
	for i in range(build.size()):
		addIngredient(build[i], addon)
		height+=change
	addon.position = position #get location
	addon.rotation_degrees=rotation
	addon.global_translate(Vector2(height,0)) #move location to below player
	if(rotation==0):
		addon.global_translate(Vector2(0,20))
	elif(rotation==90):
		addon.global_translate(Vector2(-20,0))
	elif(rotation==-90):
		addon.global_translate(Vector2(20,0))
	elif(rotation==180):
		addon.global_translate(Vector2(0,-40)) 
	#above ifelse statement needed to make the ingredient land in front of player
	addon.add_child(shape)
	addonSprite.set_scale(Vector2(0.01, 0.01))
	addon.add_child(addonSprite)
	addon.set_name("Smoothie")
	
	self.add_child(addon)	

func getSingular():
	if(isSingular):
		for i in range(ingredients.size()):
			if ingredients[i] == 1:
				return i
func getSandwich():
	if(isSandwich):
		return ingPool
func getSmoothie():
	if(isSmoothie):
		return ingPool
