extends CharacterBody3D

@export var speed = 5.0
@export var jump_speed = 8.0
var gravity = 0.3

func _physics_process(_delta):
	# gravity
	if not is_on_floor():
		velocity.y -= gravity

	# jump
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = jump_speed

	# left and right
	if Input.is_action_pressed("move_left"):
		velocity.x = -speed
	elif Input.is_action_pressed("move_right"):
		velocity.x = speed
	else:
		velocity.x = 0

	# forward and back
	if Input.is_action_pressed("move_up"):
		velocity.z = -speed
	elif Input.is_action_pressed("move_down"):
		velocity.z = speed
	else:
		velocity.z = 0

	move_and_slide()
