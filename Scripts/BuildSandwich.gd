extends Node


#make sure the items are stacking
var height = 0
var change = 15

#keep track of how much we've got of each (probably good for ordering)
var numBread = 0
var numCheese =0
var numHam =0
var numLettuce=0
var numOnion=0
var numTomato=0
var numIceCream = 0
var numBanana = 0
var numFish =0
var numPizza=0
var numBottle=0

var storedBread = 0
var storedCheese = 0
var storedHam =0
var storedLettuce = 0
var storedOnion = 0
var storedTomato = 0
var storedIceCream = 0
var storedBanana = 0
var storedFish =0
var storedPizza=0
var storedBottle=0

var SandwichBuilding = PoolIntArray()

# Called when the node enters the scene tree for the first time.
func _ready():
	storedBread = Global.SandwichLoaded[0]
	storedCheese = Global.SandwichLoaded[1]
	storedHam = Global.SandwichLoaded[2]
	storedLettuce = Global.SandwichLoaded[3]
	storedOnion = Global.SandwichLoaded[4]
	storedTomato = Global.SandwichLoaded[5]
	storedIceCream = Global.SandwichLoaded[6]
	storedBanana = Global.SandwichLoaded[7]
	storedFish = Global.SandwichLoaded[8]
	storedPizza= Global.SandwichLoaded[9]
	storedBottle= Global.SandwichLoaded[10]
	self.get_parent().get_node("Sandwich Buttons").get_node("Bread").set_text(str(storedBread))
	self.get_parent().get_node("Sandwich Buttons").get_node("Cheese").set_text(str(storedCheese))
	self.get_parent().get_node("Sandwich Buttons").get_node("Ham").set_text(str(storedHam))
	self.get_parent().get_node("Sandwich Buttons").get_node("Lettuce").set_text(str(storedLettuce))
	self.get_parent().get_node("Sandwich Buttons").get_node("Onion").set_text(str(storedOnion))
	self.get_parent().get_node("Sandwich Buttons").get_node("Tomato").set_text(str(storedTomato))
	self.get_parent().get_node("Sandwich Buttons").get_node("IceCream").set_text(str(storedIceCream))
	self.get_parent().get_node("Sandwich Buttons").get_node("Banana").set_text(str(storedBanana))
	self.get_parent().get_node("Sandwich Buttons").get_node("Fish").set_text(str(storedFish))
	self.get_parent().get_node("Sandwich Buttons").get_node("Pizza").set_text(str(storedPizza))
	self.get_parent().get_node("Sandwich Buttons").get_node("Bottle").set_text(str(storedBottle))
	if(storedBread==0):
			self.get_parent().get_node("Sandwich Buttons").get_node("Bread").set_visible(false)
	if(storedCheese==0):
			self.get_parent().get_node("Sandwich Buttons").get_node("Cheese").set_visible(false)
	if(storedHam==0):
			self.get_parent().get_node("Sandwich Buttons").get_node("Ham").set_visible(false)
	if(storedLettuce==0):
			self.get_parent().get_node("Sandwich Buttons").get_node("Lettuce").set_visible(false)
	if(storedOnion==0):
			self.get_parent().get_node("Sandwich Buttons").get_node("Onion").set_visible(false)
	if(storedTomato==0):
			self.get_parent().get_node("Sandwich Buttons").get_node("Tomato").set_visible(false)
	if(storedIceCream==0):
			self.get_parent().get_node("Sandwich Buttons").get_node("IceCream").set_visible(false)
	if(storedBanana==0):
			self.get_parent().get_node("Sandwich Buttons").get_node("Banana").set_visible(false)
	if(storedFish==0):
			self.get_parent().get_node("Sandwich Buttons").get_node("Fish").set_visible(false)
	if(storedPizza==0):
			self.get_parent().get_node("Sandwich Buttons").get_node("Pizza").set_visible(false)
	if(storedBottle==0):
			self.get_parent().get_node("Sandwich Buttons").get_node("Bottle").set_visible(false)
	var build = Array(Global.SandwichBuilding)

	SandwichBuilding.append_array(Global.SandwichBuilding)
	if(Global.isCarryingLeft and Global.isCarryingRight):
		self.get_parent().get_node("Complete").disabled = true
		self.get_parent().get_node("Complete").set_text("Hands Full!!")

	for i in range(build.size()):
		if build[i]==0:
			var addon = Sprite.new() 
			addon.texture = load("res://Assets/bread.png")
			addon.set_offset(Vector2(504, 460+height))
			self.add_child(addon)
			height-=change 
			numBread+=1
		elif build[i]==1:
			var addon = Sprite.new() 
			addon.texture = load("res://Assets/cheesy.png")
			addon.set_offset(Vector2(504, 460+height))
			self.add_child(addon)
			height-=change 
			numCheese+=1
		elif build[i]==2:
			var addon = Sprite.new() 
			addon.texture = load("res://Assets/Ham.png")
			addon.set_offset(Vector2(504, 460+height))
			self.add_child(addon)
			height-=change 
			numHam+=1
		elif build[i]==3:
			var addon = Sprite.new() 
			addon.texture = load("res://Assets/lettuce.png")
			addon.set_offset(Vector2(504, 460+height))
			self.add_child(addon)
			height-=change 
			numLettuce+=1
		elif build[i]==4:
			var addon = Sprite.new() 
			addon.texture = load("res://Assets/onion.png")
			addon.set_offset(Vector2(504, 460+height))
			self.add_child(addon)
			height-=change 
			numOnion+=1
		elif build[i]==5:
			var addon = Sprite.new() 
			addon.texture = load("res://Assets/tomato.png")
			addon.set_offset(Vector2(504, 460+height))
			self.add_child(addon)
			height-=change 
			numTomato+=1
		elif build[i]==6:
			var addon = Sprite.new() 
			addon.texture = load("res://Assets/IceCream.png")
			addon.set_offset(Vector2(504, 460+height))
			self.add_child(addon)
			height-=change 
			numIceCream+=1
		elif build[i]==7:
			var addon = Sprite.new() 
			addon.texture = load("res://Assets/Banana.png")
			addon.set_offset(Vector2(504, 460+height))
			self.add_child(addon)
			height-=change 
			numBanana+=1
		elif build[i]==8:
			var addon = Sprite.new() 
			addon.texture = load("res://Assets/Fish.png")
			addon.set_offset(Vector2(504, 460+height))
			self.add_child(addon)
			height-=change 
			numFish+=1
		elif build[i]==9:
			var addon = Sprite.new() 
			addon.texture = load("res://Assets/Pizza.png")
			addon.set_offset(Vector2(504, 460+height))
			self.add_child(addon)
			height-=change 
			numPizza+=1
		elif build[i]==10:
			var addon = Sprite.new() 
			addon.texture = load("res://Assets/Bottle.png")
			addon.set_offset(Vector2(504, 460+height))
			self.add_child(addon)
			height-=change 
			numBottle+=1

#on_blank_pressed methods will add the related object to the sandwich
func _on_Bread_pressed():
	if(storedBread>0):
		var addon = Sprite.new() 
		addon.texture = load("res://Assets/bread.png")
		addon.set_offset(Vector2(504, 460+height))
		self.add_child(addon)
		height-=change 
		numBread+=1
		storedBread-=1
		SandwichBuilding.append(0)
		self.get_parent().get_node("Sandwich Buttons").get_node("Bread").set_text(str(storedBread))
		if(storedBread==0):
			self.get_parent().get_node("Sandwich Buttons").get_node("Bread").set_visible(false)


func _on_Cheese_pressed():
	if(storedCheese>0):
		var addon = Sprite.new() 
		addon.texture = load("res://Assets/cheesy.png")
		addon.set_offset(Vector2(504, 460+height))
		self.add_child(addon)
		height-=change 
		numCheese+=1
		storedCheese-=1
		SandwichBuilding.append(1)
		self.get_parent().get_node("Sandwich Buttons").get_node("Cheese").set_text(str(storedCheese))
		if(storedCheese==0):
			self.get_parent().get_node("Sandwich Buttons").get_node("Cheese").set_visible(false)


func _on_Ham_pressed():
	if(storedHam>0):
		var addon = Sprite.new() 
		addon.texture = load("res://Assets/Ham.png")
		addon.set_offset(Vector2(504, 460+height))
		self.add_child(addon)
		height-=change 
		numHam+=1
		storedHam-=1
		SandwichBuilding.append(2)
		self.get_parent().get_node("Sandwich Buttons").get_node("Ham").set_text(str(storedHam))
		if(storedHam==0):
			self.get_parent().get_node("Sandwich Buttons").get_node("Ham").set_visible(false)


func _on_Lettuce_pressed():
	if(storedLettuce>0):
		var addon = Sprite.new() 
		addon.texture = load("res://Assets/lettuce.png")
		addon.set_offset(Vector2(504, 460+height))
		self.add_child(addon)
		height-=change 
		numLettuce+=1
		storedLettuce-=1
		SandwichBuilding.append(3)
		self.get_parent().get_node("Sandwich Buttons").get_node("Lettuce").set_text(str(storedLettuce))
		if(storedLettuce==0):
			self.get_parent().get_node("Sandwich Buttons").get_node("Lettuce").set_visible(false)


func _on_Onion_pressed():
	if(storedOnion>0):
		var addon = Sprite.new() 
		addon.texture = load("res://Assets/onion.png")
		addon.set_offset(Vector2(504, 460+height))
		self.add_child(addon)
		height-=change
		numOnion +=1
		storedOnion-=1
		SandwichBuilding.append(4)
		self.get_parent().get_node("Sandwich Buttons").get_node("Onion").set_text(str(storedOnion))
		if(storedOnion==0):
			self.get_parent().get_node("Sandwich Buttons").get_node("Onion").set_visible(false)


func _on_Tomato_pressed():
	if(storedTomato>0):
		var addon = Sprite.new() 
		addon.texture = load("res://Assets/tomato.png")
		addon.set_offset(Vector2(504, 460+height))
		self.add_child(addon)
		height-=change
		numTomato +=1
		storedTomato -=1
		SandwichBuilding.append(5)
		self.get_parent().get_node("Sandwich Buttons").get_node("Tomato").set_text(str(storedTomato))
		if(storedTomato==0):
			self.get_parent().get_node("Sandwich Buttons").get_node("Tomato").set_visible(false)

func _on_IceCream_pressed():
	if(storedIceCream>0):
		var addon = Sprite.new() 
		addon.texture = load("res://Assets/IceCream.png")
		addon.set_offset(Vector2(504, 460+height))
		self.add_child(addon)
		height-=change
		numIceCream +=1
		storedIceCream -=1
		SandwichBuilding.append(6)
		self.get_parent().get_node("Sandwich Buttons").get_node("IceCream").set_text(str(storedIceCream))
		if(storedIceCream==0):
			self.get_parent().get_node("Sandwich Buttons").get_node("IceCream").set_visible(false)

func _on_Banana_pressed():
	if(storedBanana>0):
		var addon = Sprite.new() 
		addon.texture = load("res://Assets/Banana.png")
		addon.set_offset(Vector2(504, 460+height))
		self.add_child(addon)
		height-=change
		numBanana +=1
		storedBanana -=1
		SandwichBuilding.append(7)
		self.get_parent().get_node("Sandwich Buttons").get_node("Banana").set_text(str(storedBanana))
		if(storedBanana==0):
			self.get_parent().get_node("Sandwich Buttons").get_node("Banana").set_visible(false)

func _on_Fish_pressed():
	if(storedFish>0):
		var addon = Sprite.new() 
		addon.texture = load("res://Assets/Fish.png")
		addon.set_offset(Vector2(504, 460+height))
		self.add_child(addon)
		height-=change
		numFish +=1
		storedFish -=1
		SandwichBuilding.append(8)
		self.get_parent().get_node("Sandwich Buttons").get_node("Fish").set_text(str(storedFish))
		if(storedFish==0):
			self.get_parent().get_node("Sandwich Buttons").get_node("Fish").set_visible(false)

func _on_Pizza_pressed():
	if(storedPizza>0):
		var addon = Sprite.new() 
		addon.texture = load("res://Assets/Pizza.png")
		addon.set_offset(Vector2(504, 460+height))
		self.add_child(addon)
		height-=change
		numPizza +=1
		storedPizza -=1
		SandwichBuilding.append(9)
		self.get_parent().get_node("Sandwich Buttons").get_node("Pizza").set_text(str(storedPizza))
		if(storedPizza==0):
			self.get_parent().get_node("Sandwich Buttons").get_node("Pizza").set_visible(false)

func _on_Bottle_pressed():
	if(storedBottle>0):
		var addon = Sprite.new() 
		addon.texture = load("res://Assets/Bottle.png")
		addon.set_offset(Vector2(504, 460+height))
		self.add_child(addon)
		height-=change
		numBottle +=1
		storedBottle -=1
		SandwichBuilding.append(10)
		self.get_parent().get_node("Sandwich Buttons").get_node("Bottle").set_text(str(storedBottle))
		if(storedBottle==0):
			self.get_parent().get_node("Sandwich Buttons").get_node("Bottle").set_visible(false)


func _on_ReturnBut_pressed():
	Global.SandwichLoaded[0] = storedBread
	Global.SandwichLoaded[1] = storedCheese
	Global.SandwichLoaded[2] = storedHam
	Global.SandwichLoaded[3] = storedLettuce
	Global.SandwichLoaded[4] = storedOnion
	Global.SandwichLoaded[5] = storedTomato
	Global.SandwichLoaded[6] = storedIceCream
	Global.SandwichLoaded[7] = storedBanana
	Global.SandwichLoaded[8] = storedFish
	Global.SandwichLoaded[9] = storedPizza
	Global.SandwichLoaded[10] = storedBottle
	Global.setSandwich(SandwichBuilding)
	self.get_parent().queue_free()


func _on_Complete_pressed():
	Global.SandwichLoaded[0] = storedBread
	Global.SandwichLoaded[1] = storedCheese
	Global.SandwichLoaded[2] = storedHam
	Global.SandwichLoaded[3] = storedLettuce
	Global.SandwichLoaded[4] = storedOnion
	Global.SandwichLoaded[5] = storedTomato
	Global.SandwichLoaded[6] = storedIceCream
	Global.SandwichLoaded[7] = storedBanana
	Global.SandwichLoaded[8] = storedFish
	Global.SandwichLoaded[9] = storedPizza
	Global.SandwichLoaded[10] = storedBottle
	Global.setSandwich(SandwichBuilding)
	Global.SandwichFinished=true
	self.get_parent().queue_free()


