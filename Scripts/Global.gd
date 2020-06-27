extends Node

var pos = Vector2(160, 96)
var isCarryingLeft = false
var isCarryingRight= false
var kitchen = PackedScene
var numholding = 0
var SandwichLoaded = [0,0,0,0,0,0,0,0,0,0,0]
var SandwichBuilding = PoolIntArray()
var SmoothieLoaded = [0,0,0,0,0,0,0,0,0,0,0]
var SmoothieBuilding = PoolIntArray()
var SandwichFinished = false
var SmoothieFinished = false

var PickedUpSandwich = PoolIntArray()
var isPickedUpSandwichLeft =false
var isPickedUpSandwichRight = false
var isPickedUpSmoothieLeft = false
var isPickedUpSmoothieRight = false
var PickedUpSmoothie = PoolIntArray()

var isParentOut = false
var isHiding = false


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.
	
func clear(type):
	if(type=="Sandwich"):
		SandwichBuilding.resize(0)
	elif(type=="Smoothie"):
		SmoothieBuilding.resize(0)

func setSandwich(arr):
	SandwichBuilding.resize(0)
	SandwichBuilding.append_array(arr)

func setSmoothie(arr):
	SmoothieBuilding.resize(0)
	SmoothieBuilding.append_array(arr)

func setPickUpSandwich(arr):
	PickedUpSandwich.resize(0)
	PickedUpSandwich.append_array(arr)

func setPickUpSmoothie(arr):
	PickedUpSmoothie.resize(0)
	PickedUpSmoothie.append_array(arr)

func addIngredient(station, ingredient):
	if(station == "Sandwiches"):
		if(ingredient=="Bread"):
			SandwichLoaded[0]+=1
		elif(ingredient=="Cheese"):
			SandwichLoaded[1]+=1
		elif(ingredient=="Ham"):
			SandwichLoaded[2]+=1
		elif(ingredient=="Lettuce"):
			SandwichLoaded[3]+=1
		elif(ingredient=="Onion"):
			SandwichLoaded[4]+=1
		elif(ingredient=="Tomato"):
			SandwichLoaded[5]+=1
		elif(ingredient=="IceCream"):
			SandwichLoaded[6]+=1
		elif(ingredient=="Banana"):
			SandwichLoaded[7]+=1
		elif(ingredient=="Fish"):
			SandwichLoaded[8]+=1
		elif(ingredient=="Pizza"):
			SandwichLoaded[9]+=1
		elif(ingredient=="Bottle"):
			SandwichLoaded[10]+=1
	elif(station == "Blender"):
		if(ingredient=="Bread"):
			SmoothieLoaded[0]+=1
		elif(ingredient=="Cheese"):
			SmoothieLoaded[1]+=1
		elif(ingredient=="Ham"):
			SmoothieLoaded[2]+=1
		elif(ingredient=="Lettuce"):
			SmoothieLoaded[3]+=1
		elif(ingredient=="Onion"):
			SmoothieLoaded[4]+=1
		elif(ingredient=="Tomato"):
			SmoothieLoaded[5]+=1
		elif(ingredient=="IceCream"):
			SandwichLoaded[6]+=1
		elif(ingredient=="Banana"):
			SandwichLoaded[7]+=1
		elif(ingredient=="Fish"):
			SandwichLoaded[8]+=1
		elif(ingredient=="Pizza"):
			SandwichLoaded[9]+=1
		elif(ingredient=="Bottle"):
			SandwichLoaded[10]+=1
	
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

