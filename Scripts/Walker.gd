extends KinematicBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
export (int) var speed = 200
export (float) var rotation_speed = 1.5

var velocity = Vector2()
var rotation_dir =0

func get_input():
	velocity = Vector2()
	rotation_dir=0
	if Input.is_action_pressed("ui_right"):
		velocity.x += 1
		set_rotation_degrees(-90)
	if Input.is_action_pressed("ui_left"):
		velocity.x -= 1
		set_rotation_degrees(90)
	if Input.is_action_pressed('ui_up'):
		velocity.y -= 1
		set_rotation_degrees(180)
	if Input.is_action_pressed("ui_down"):
		velocity.y += 1
		set_rotation_degrees(0)
	if Input.is_key_pressed(KEY_A):
		velocity.x-=1
		set_rotation_degrees(90)
	if Input.is_key_pressed(KEY_D):
		velocity.x+=1
		set_rotation_degrees(-90)
	if Input.is_key_pressed(KEY_W):
		velocity.y-=1
		set_rotation_degrees(180)
	if Input.is_key_pressed(KEY_S):
		velocity.y+=1
		set_rotation_degrees(0)



	velocity = velocity.normalized() * speed

func _physics_process(delta):
	get_input()
	rotation += rotation_dir * rotation_speed * delta
	velocity = move_and_slide(velocity)


