extends Node2D

var timestart
var timenow
var numchecks #number of times the parents will show up this level
var ischecking
var parentbody = KinematicBody2D
var velocity = Vector2()
var rotation_dir =0

# Called when the node enters the scene tree for the first time.
func _ready():
	timestart=OS.get_unix_time()
	numchecks=2
	set_process(true)
	
	ischecking=false
	parentbody=self.get_node("Parents")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if(not ischecking and not Global.isParentOut):
		self.get_node("Hall Light").visible=false
		self.visible=false
		self.get_node("Parents").visible=false

	if(numchecks>0):
		timenow = OS.get_unix_time()
		var elapsed = (timenow-timestart) % 60
		if (elapsed % 40 ==0 and not ischecking):
			self.visible=true
			self.get_node("Hall Light").visible=true
			numchecks-=1
			ischecking=true
			var t = Timer.new()
			t.set_wait_time(6)
			t.set_one_shot(true)
			self.add_child(t)
			t.start()
			yield(t, "timeout")
			t.queue_free()
			self.get_node("Parents").visible=true
			Global.isParentOut=true

			
