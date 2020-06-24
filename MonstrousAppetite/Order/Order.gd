extends Node2D

var buns = ["bread"]
var mids = ["cheese", "ham", "lettuce", "onions", "tomatoes"]

var ingredients = []

var pos = Vector2(35, 25)

# Called when the node enters the scene tree for the first time.
func _ready():
#	make_order(5)
#	print(ingredients)
#	create_ingredient_nodes()
#	print(self.get_children())
	pass

func make_order(ing_no):
	var bun = buns[randi() % buns.size()]
	ingredients.append(bun)
	for n in range(ing_no):
		ingredients.append(mids[randi() % mids.size()])
	ingredients.append(bun)
	return ingredients

func create_ingredient_nodes():
	# Remove all children first
	for n in self.get_children():
		n.queue_free()
	for i in ingredients:
		var s = Sprite.new()
		s.texture = load("res://assets/Notebook/notebooksymbol_%s.png" % i)
		s.position = pos
		s.scale = Vector2(0.3, 0.3)
		self.add_child(s)
		pos.x += 60
