extends Button

var numItems = 0
var defaultText = "Take out:"
var item1 = ""
var item2 = ""
var carryright=false
var carryleft=false


# Called when the node enters the scene tree for the first time.
func _ready():
	Global.isCarryingLeft=false
	Global.isCarryingRight=false


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func AddItem(item):
	if fmod(numItems,2)==0:
		self.get_parent().get_node("FridgeText").clear()
		self.get_parent().get_node("FridgeText").add_text(defaultText+" "+ item+", "+item2)
		item1=item
		numItems+=1
		carryleft=true
	else:
		self.get_parent().get_node("FridgeText").clear()
		self.get_parent().get_node("FridgeText").add_text(defaultText+" "+ item1+", "+item)
		item2=item
		numItems+=1
		carryright=true


func _on_ReturnBut_pressed():
	
	
	if carryright:
		IngredientVars.setFood(item2, 0)
		Global.isCarryingRight=carryright
	if carryleft:
		IngredientVars.setFood(item1,1)
		Global.isCarryingLeft=carryleft
	self.get_parent().queue_free()
	#IngredientVars.isNewIngredientRightGet=carryright
	#IngredientVars.isNewIngredientLeftGet=carryleft
	#Global.isCarryingLeft=carryleft
	#Global.isCarryingRight=carryright
	#IngredientVars.rightIng = item2
	#IngredientVars.leftIng = item1
	

func _on_Bread_pressed():
	self.AddItem("Bread")
	IngredientVars.setNewSprite("res://Assets/bread.png", fmod(numItems,2))


func _on_Cheese_pressed():
	self.AddItem("Cheese") 
	IngredientVars.setNewSprite("res://Assets/cheesy.png", fmod(numItems,2))

func _on_Ham_pressed():
	self.AddItem("Ham")
	IngredientVars.setNewSprite("res://Assets/Ham.png", fmod(numItems,2))

func _on_Tomato_pressed():
	self.AddItem("Tomato")
	IngredientVars.setNewSprite("res://Assets/tomato.png", fmod(numItems,2))

func _on_Onion_pressed():
	self.AddItem("Onion")
	IngredientVars.setNewSprite("res://Assets/onion.png", fmod(numItems,2))

func _on_Lettuce_pressed():
	self.AddItem("Lettuce")
	IngredientVars.setNewSprite("res://Assets/lettuce.png", fmod(numItems,2))


func _on_Clear_pressed():
	numItems=0
	item1 = ""
	item2 = ""
	self.get_parent().get_node("FridgeText").clear()
	self.get_parent().get_node("FridgeText").add_text(defaultText)
	carryleft = false
	carryright = false
	Global.isCarryingLeft=false
	Global.isCarryingRight=false # Replace with function body.
