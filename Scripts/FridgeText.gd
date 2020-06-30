extends RichTextLabel

#ALSO USED FOR THE TRASHCAN TEXT
# Declare member variables here. Examples:
var numItems = 0
var defaultText = "Take out:"
var item1 = ""
var item2 = ""

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func AddItem(item):
	if numItems%2==0:
		self.clear()
		self.add_text(defaultText+ item+item2)
		item1=item
		numItems+=1
	if numItems%2==1:
		self.clear()
		self.add_text(defaultText+ item1+item)
		item2=item
		numItems+=1

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
