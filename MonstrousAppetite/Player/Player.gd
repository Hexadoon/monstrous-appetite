extends KinematicBody2D

export var speed = 400
var screen_size

func _ready():
	screen_size = get_viewport_rect().size

func _process(delta):
	var velocity = Vector2()
	if Input.is_action_pressed("ui_right"):
		velocity.x += 1
	if Input.is_action_pressed("ui_left"):
		velocity.x -= 1
	if Input.is_action_pressed("ui_up"):
		velocity.y -= 1
	if Input.is_action_pressed("ui_down"):
		velocity.y += 1
	if velocity.length() > 0:
		velocity = velocity.normalized() * speed
		$AnimatedSprite.animation = "walk"
		self.rotation = velocity.angle() + (PI / 2)
#		$AnimatedSprite.flip_h = velocity.x < 0
#		$AnimatedSprite.flip_v = velocity.y > 0
		$AnimatedSprite.play()
	else:
		$AnimatedSprite.animation = "stand"
		$AnimatedSprite.stop()
	
	# This sets position, but I believe is bad practice
#	position += velocity * delta
#	position.x = clamp(position.x, 0, screen_size.x)
#	position.y = clamp(position.y, 0, screen_size.y)

	move_and_slide(velocity)
	
	
	
func start(pos):
	position = pos
	show()
	$CollisionShape2D.disabled = false
	
