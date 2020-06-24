extends Node2D

export (PackedScene) var Order

func _ready():
	pass # Replace with function body.
#	randomize()
#	for i in range(5):
#		add_order(randi() % 8)

func _on_Button_pressed():
	hide()
	get_parent().show_HUD()

func add_order(ing_no):
	var order = Order.instance()
	order.make_order(ing_no)
	order.create_ingredient_nodes()
	order.position = $NextOrder.position
	$NextOrder.position.y += 75
	self.add_child(order)
	
