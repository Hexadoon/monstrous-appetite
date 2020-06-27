extends KinematicBody2D


export (int) var speed = 200
export (float) var rotation_speed = 1.5

var velocity = Vector2()
var rotation_dir =0
var lookleft = false
var cleaning = false
var numitems = 0
var checkedBlender = false
var checkedSandwiches = false
var checkedFridge = true

# Called when the node enters the scene tree for the first time.
func _ready():
	self.get_node("RayCast2D").set_collide_with_bodies(true)
	self.get_node("RayCast2D").set_enabled(true)
	pass # Replace with function body.

func doNormalLoop():
	var pos = self.get_position()
	if(pos.y<550 && pos.x==208):
		velocity.y+=1
	elif(pos.y>=550 && pos.x<900):
		velocity.y=0
		set_rotation_degrees(-90)
		velocity.x+=1
	elif(pos.y>320 && pos.x>=900):
		set_rotation_degrees(180)
		velocity.x=0
		velocity.y-=1
	elif(pos.y<320):
		if(pos.x>208):
			set_rotation_degrees(90)
			velocity.y=0
			velocity.x-=1
		elif(pos.y<-58):
			set_rotation_degrees(0)
			velocity.x=0
			velocity.y=0
			self.set_position(Vector2(208,-48))
			Global.isParentOut=false
			self.get_parent().ischecking=false
			checkedBlender=false
			checkedSandwiches=false
			checkedFridge=false
			numitems=0
		else:
			set_rotation_degrees(180)
			velocity.x=0
			velocity.y-=1
	velocity = velocity.normalized() * speed
	
func doLooking():
	if(lookleft):
		self.get_node("Sprite").rotation_degrees+=5
		self.get_node("RayCast2D").rotation_degrees+=5
	else:
		self.get_node("Sprite").rotation_degrees-=5
		self.get_node("RayCast2D").rotation_degrees+=5
	if(self.get_node("Sprite").get_rotation_degrees()==90):
		lookleft=false
	elif(self.get_node("Sprite").get_rotation_degrees()==-90):
		lookleft=true
func _physics_process(delta):
	if(Global.isParentOut and not cleaning):
		doNormalLoop()
		doLooking()
		rotation += rotation_dir * rotation_speed * delta
		velocity = move_and_slide(velocity)
		if(self.get_node("RayCast2D").is_colliding()):
			print(self.get_node("RayCast2D").get_collider().name)
			var name =self.get_node("RayCast2D").get_collider().name
			if(name == "Singular" or name == "Sandwich" or name == "Smoothie"):
				if(self.get_node("RayCast2D").get_collider().get_parent().get_parent().name=="Ingredients"):
					self.get_node("ShortClean").play()
					self.get_node("RayCast2D").get_collider().get_parent().queue_free()
					numitems+=1
					velocity = Vector2(0,0)
					var t = Timer.new() #time cleaning up
					t.set_wait_time(2)
					t.set_one_shot(true)
					self.add_child(t)
					cleaning = true
					t.start()
					yield(t, "timeout")
					cleaning = false
					t.queue_free()
					checkedFridge = false
			if(name == "Sandwiches" and not checkedSandwiches):
				checkedSandwiches = true
				checkedFridge=false
				self.get_node("LongClean").play()
				Global.clear("Sandwich")
				Global.SandwichLoaded=[0,0,0,0,0,0,0,0,0,0,0]
				velocity = Vector2(0,0)
				var t = Timer.new() #time cleaning up
				t.set_wait_time(6)
				t.set_one_shot(true)
				self.add_child(t)
				cleaning = true
				t.start()
				yield(t, "timeout")
				cleaning = false
				t.queue_free()
			if(name=="Blender" and not checkedBlender):
				checkedBlender=true
				checkedFridge=false
				self.get_node("LongClean").play()
				Global.clear("Smoothie")
				velocity = Vector2(0,0)
				Global.SmoothieLoaded=[0,0,0,0,0,0,0,0,0,0,0]
				var t = Timer.new() #time cleaning up
				t.set_wait_time(6)
				t.set_one_shot(true)
				self.add_child(t)
				cleaning = true
				t.start()
				yield(t, "timeout")
				cleaning = false
				t.queue_free()
			if(name=="Fridge" and not checkedFridge):
				checkedFridge=true
				var t = Timer.new()
				velocity = Vector2(0,0)
				t.set_wait_time(numitems)
				t.set_one_shot(true)
				self.add_child(t)
				cleaning = true
				t.start()
				yield(t, "timeout")
				cleaning = false
				t.queue_free()
				numitems=0
			if(name == "Walker" and Global.isHiding == false):
				self.get_node("Caught").play()
				print("CAUGHT") #GAMEOVER

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
