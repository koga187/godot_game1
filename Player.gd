extends KinematicBody2D

const UP = Vector2(0, -1) ## -1 é acima da imagem
const JUMP_HEIGHT = -550
const SPEED = 200
const GRAVITY_SPEED = 20
var motion = Vector2()

func _physics_process(delta):
	gravity()
	walk()
	jump()

	motion = move_and_slide(motion, UP)

func gravity():
	motion.y += GRAVITY_SPEED

func walk():
	if Input.is_action_pressed("ui_right"):
		motion.x = SPEED
	elif Input.is_action_pressed("ui_left"):
		motion.x = -SPEED
	else:
		motion.x = 0

func jump():
	if is_on_floor():
		if Input.is_action_just_pressed("ui_up"):
			motion.y = JUMP_HEIGHT