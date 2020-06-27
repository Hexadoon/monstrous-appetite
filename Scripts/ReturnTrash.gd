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
	Global.isCarryingLeft=carryleft
	Global.isCarryingRight=carryright
	IngredientVars.setFood(item2, 0)
	IngredientVars.setFood(item1,1)
	self.get_parent().queue_free()
	#IngredientVars.isNewIngredientRightGet=carryright
	#IngredientVars.isNewIngredientLeftGet=carryleft
	#Global.isCarryingLeft=carryleft
	#Global.isCarryingRight=carryright
	#IngredientVars.rightIng = item2
	#IngredientVars.leftIng = item1
	


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


func _on_IceCream_pressed():
	self.AddItem("IceCream")
	IngredientVars.setNewSprite("res://Assets/IceCream.png", fmod(numItems,2))


func _on_Banana_pressed():
	self.AddItem("Banana")
	IngredientVars.setNewSprite("res://Assets/Banana.png", fmod(numItems,2))


func _on_Fish_pressed():
	self.AddItem("Fish")
	IngredientVars.setNewSprite("res://Assets/lettuce.png", fmod(numItems,2)) # Replace with function body.


func _on_Pizza_pressed():
	self.AddItem("Pizza")
	IngredientVars.setNewSprite("res://Assets/Pizza.png", fmod(numItems,2)) # Replace with function body.


func _on_Bottle_pressed():
	self.AddItem("Bottle")
	IngredientVars.setNewSprite("res://Assets/Bottle.png", fmod(numItems,2)) # Replace with function body.
