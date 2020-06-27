extends Node


var isNewIngredientLeftGet = false
var newIngredientLeftSprite = Sprite
var isNewIngredientRightGet = false
var newIngredientRightSprite = Sprite
var leftIng = ""
var rightIng = ""
var leftType = -1
var rightType = -1

#var carryingPath = String()

# Called when the node enters the scene tree for the first time.
func _ready():
	newIngredientLeftSprite = Sprite.new()
	newIngredientRightSprite = Sprite.new()

func setNewSprite(path, side):
	if(side==0):
		newIngredientRightSprite.texture = load(path)
		#carryingPath=path
	if(side==1):
		newIngredientLeftSprite.texture = load(path)

func setIng(type, side):
	if(side==0):
		rightType = type
		if(type==0):
			rightIng = "Bread"
		elif(type==1):
			rightIng = "Cheese"
		elif(type==2):
			rightIng="Ham"
		elif(type==3):
			rightIng="Lettuce"
		elif(type==4):
			rightIng="Onion"
		elif(type==5):
			rightIng="Tomato"
		elif(type==6):
			rightIng="IceCream"
		elif(type==7):
			rightIng="Banana"
		elif(type==8):
			rightIng="Fish"
		elif(type==9):
			rightIng="Pizza"
		elif(type==10):
			rightIng="Bottle"
	if(side==1):
		leftType = type
		if(type==0):
			leftIng = "Bread"
		elif(type==1):
			leftIng = "Cheese"
		elif(type==2):
			leftIng="Ham"
		elif(type==3):
			leftIng="Lettuce"
		elif(type==4):
			leftIng="Onion"
		elif(type==5):
			leftIng="Tomato"
		elif(type==6):
			leftIng="IceCream"
		elif(type==7):
			leftIng="Banana"
		elif(type==8):
			leftIng="Fish"
		elif(type==9):
			leftIng="Pizza"
		elif(type==10):
			leftIng="Bottle"

func setFood(ing, side):
	if(side==0):
		isNewIngredientRightGet=true
		rightIng = ing
		if(ing=="Bread"):
			rightType = 0
		elif(ing=="Cheese"):
			rightType=1
		elif(ing=="Ham"):
			rightType=2
		elif(ing=="Lettuce"):
			rightType=3
		elif(ing=="Onion"):
			rightType=4
		elif(ing=="Tomato"):
			rightType=5
		elif(ing=="IceCream"):
			rightType=6
		elif(ing=="Banana"):
			rightType=7
		elif(ing=="Fish"):
			rightType=8
		elif(ing=="Pizza"):
			rightType=9
		elif(ing=="Bottle"):
			rightType=10
	if(side==1):
		isNewIngredientLeftGet= true
		leftIng=ing
		if(ing=="Bread"):
			leftType = 0
		elif(ing=="Cheese"):
			leftType=1
		elif(ing=="Ham"):
			leftType=2
		elif(ing=="Lettuce"):
			leftType=3
		elif(ing=="Onion"):
			leftType=4
		elif(ing=="Tomato"):
			leftType=5
		elif(ing=="IceCream"):
			leftType=6
		elif(ing=="Banana"):
			leftType=7
		elif(ing=="Fish"):
			leftType=8
		elif(ing=="Pizza"):
			leftType=9
		elif(ing=="Bottle"):
			leftType=10
