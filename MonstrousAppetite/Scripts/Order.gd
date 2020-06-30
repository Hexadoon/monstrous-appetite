extends Node2D

var buns = ["Bread"]
var food_ingredients = ["BananaPeel", "Blueberry", "Bottle", "Cheese",
						   "Cherry", "DeadFish", "Egg", "Ham", "IceCream",
						   "Kiwi", "Lettuce", "Onion", "Orange", "Pizza",
						   "Strawberry", "Tomato", "Watermelon", "Bread"]

var ingredients = []

var pos = Vector2(35, 0)

# Called when the node enters the scene tree for the first time.
func _ready():
#	make_order(5, "smoothie")
#	print(ingredients)
#	create_ingredient_nodes()
#	print(self.get_children())
	pass

func make_order(ing_no, type="sandwich"):
	if (type == "sandwich"):
		var bun = buns[randi() % buns.size()]
		ingredients.append(bun)
		for n in range(ing_no):
			ingredients.append(food_ingredients[randi() % food_ingredients.size()])
		ingredients.append(bun)
	elif (type == "smoothie"):
		for n in range(ing_no):
			ingredients.append(food_ingredients[randi() % food_ingredients.size()])
	return ingredients

func create_ingredient_nodes(type="sandwich"):
	# Remove all children first
	for n in self.get_children():
		n.queue_free()
	var temp = Sprite.new()
	if (type == "sandwich"):
		temp.texture = load("res://assets/Notebook/SandwichIcon.png")
	elif (type == "smoothie"):
		temp.texture = load("res://assets/Notebook/SmoothieIcon.png")
	temp.position = pos
	temp.scale = Vector2(0.07, 0.07)
	self.add_child(temp)
	pos.x += 100
	for i in ingredients:
		var s = Sprite.new()
		s.texture = load("res://assets/Notebook/%sIcon.png" % i)
		s.position = pos
		s.scale = Vector2(0.07, 0.07)
		self.add_child(s)
		pos.x += 60
