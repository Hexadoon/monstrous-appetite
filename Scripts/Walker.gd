extends KinematicBody2D


export (int) var speed = 200
export (float) var rotation_speed = 1.5

var velocity = Vector2()
var rotation_dir =0

func _init():
	load("res://Scripts/Global.gd")
	self.set_position(Global.pos)

func get_input():
	velocity = Vector2()
	rotation_dir=0
	if Input.is_action_pressed("ui_right"):
		velocity.x += 1
		Global.isHiding= false

	if Input.is_action_pressed("ui_left"):
		velocity.x -= 1
		Global.isHiding= false

	if Input.is_action_pressed('ui_up'):
		velocity.y -= 1
		Global.isHiding= false

	if Input.is_action_pressed("ui_down"):
		velocity.y += 1
		Global.isHiding= false



	velocity = velocity.normalized() * speed

func _physics_process(delta):
	get_input()
	rotation += rotation_dir * rotation_speed * delta
	velocity = move_and_slide(velocity)
	if(Global.isHiding):
		self.visible = false
	else:
		self.visible = true


