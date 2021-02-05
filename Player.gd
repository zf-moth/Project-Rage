extends KinematicBody2D

const UP = Vector2(0,-1)
const GRAVITY = 20
const MAXFALLSPEED = 200
const MAXSPEED = 800
const JUMPFORCE = 850
const ACCEL = 10
const FRICTION = 10
onready var PlayerSprite = $Sprite
var Sprite1 = preload("res://Player.png")
var Sprite2 = preload("res://Player2.png")

var motion = Vector2()
var deg = 0
var clock = false
func _physics_process(delta):
	#Stops gravity when it hits MAXSPEED
	motion.y += GRAVITY
	if motion.y > MAXSPEED:
		motion.y = MAXSPEED
	deg = $Arrow.rotation_degrees
	var vector = Vector2( cos(deg2rad(deg)), sin(deg2rad(deg)))
	
	
	#Jumps only if player is on floor
	if is_on_floor():
		PlayerSprite.set_texture(Sprite1)
		if Input.is_action_just_pressed("ui_accept"):
			motion = vector * JUMPFORCE
			print("jump")
		
		if motion.x > 0:
			motion.x -= FRICTION
		elif motion.x < 0:
			motion.x += FRICTION
	else:
		PlayerSprite.set_texture(Sprite2)
	move_and_slide(motion, UP)

func _ready():
	pass
