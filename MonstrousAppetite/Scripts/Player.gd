extends KinematicBody2D

export var speed = 400
var screen_size
var last_direction = "down"
var h_flip = false;

func _ready():
	screen_size = get_viewport_rect().size

func _process(delta):
	var velocity = Vector2()
	var set_dir = false
	if Input.is_action_pressed("ui_up"):
		velocity.y -= 1
		if not set_dir:
			$AnimatedSprite.animation = "walk_up"
			last_direction = "up"
			set_dir = true
	if Input.is_action_pressed("ui_down"):
		velocity.y += 1
		if not set_dir:
			$AnimatedSprite.animation = "walk_down"
			last_direction = "down"
			set_dir = true
	if Input.is_action_pressed("ui_right"):
		velocity.x += 1
		if not set_dir:
			$AnimatedSprite.animation = "walk_side"
			last_direction = "side"
			$AnimatedSprite.flip_h = false
			h_flip = false
			set_dir = true
	if Input.is_action_pressed("ui_left"):
		velocity.x -= 1
		if not set_dir:
			$AnimatedSprite.animation = "walk_side"
			$AnimatedSprite.flip_h = true
			h_flip = true
			last_direction = "side"
			set_dir = true
	if velocity.length() > 0:
		velocity = velocity.normalized() * speed
		$AnimatedSprite.play()
	else:
		$AnimatedSprite.animation = "stand_" + last_direction
		$AnimatedSprite.stop()
	move_and_slide(velocity)
	
func start(pos):
	position = pos
	show()
	$Collision.disabled = false
