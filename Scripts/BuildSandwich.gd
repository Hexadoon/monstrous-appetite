extends Node


#make sure the items are stacking
var height = 0

#keep track of how much we've got of each (probably good for ordering)
var numBread = 0
var numCheese =0
var numHam =0
var numLettuce=0
var numOnion=0
var numTomato=0

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


#on_blank_pressed methods will add the related object to the sandwich
func _on_Bread_pressed():
	var addon = Sprite.new() 
	addon.texture = load("res://Assets/bread.png")
	addon.set_offset(Vector2(504, 460+height))
	self.add_child(addon)
	height-=10 
	numBread+=1


func _on_Cheese_pressed():
	var addon = Sprite.new() 
	addon.texture = load("res://Assets/cheesy.png")
	addon.set_offset(Vector2(504, 460+height))
	self.add_child(addon)
	height-=10 
	numCheese+=1


func _on_Ham_pressed():
	var addon = Sprite.new() 
	addon.texture = load("res://Assets/Ham.png")
	addon.set_offset(Vector2(504, 460+height))
	self.add_child(addon)
	height-=10 
	numHam+=1


func _on_Lettuce_pressed():
	var addon = Sprite.new() 
	addon.texture = load("res://Assets/lettuce.png")
	addon.set_offset(Vector2(504, 460+height))
	self.add_child(addon)
	height-=10 
	numLettuce+=1


func _on_Onion_pressed():
	var addon = Sprite.new() 
	addon.texture = load("res://Assets/onion.png")
	addon.set_offset(Vector2(504, 460+height))
	self.add_child(addon)
	height-=10
	numOnion +=1


func _on_Tomato_pressed():
	var addon = Sprite.new() 
	addon.texture = load("res://Assets/tomato.png")
	addon.set_offset(Vector2(504, 460+height))
	self.add_child(addon)
	height-=10 
	numTomato +=1
