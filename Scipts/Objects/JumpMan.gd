extends CharacterBody2D

enum
{
	move, climb
}

var state = move
const SPEED = 120.0
const JUMP_VELOCITY = -180.0
@onready var sprite_2d = $Sprite2D
var gravity = 450
@onready var LadderCheck = $LadderCheck
@onready var BelowLadderCheck = $BelowLadderCheck

func _physics_process(delta):
	if (is_on_floor() and velocity.x == 0):
		sprite_2d.animation = "idle"
	elif (not is_on_floor() and not state == climb):
		velocity.y += gravity * delta
		sprite_2d.animation = "jump"
	elif (is_on_ladder() and velocity.y != 0):
		sprite_2d.animation = "climb"
	else:
		sprite_2d.animation = "walk"
	if (state == move):
		move_state()
	elif (state == climb):
		climb_state()
	move_and_slide()

	if (Input.is_action_just_pressed('left')):
		sprite_2d.flip_h = true
	if (Input.is_action_just_pressed('right')):
		sprite_2d.flip_h = false

func is_on_ladder():
	if (not LadderCheck.is_colliding()): 
		return false
	var collider = LadderCheck.get_collider()
	if (not collider is Ladder):
		return false
	return true
	
func is_above_ladder():
	if (not BelowLadderCheck.is_colliding()):
		return false
	var collider2 = BelowLadderCheck.get_collider()
	if (not collider2 is Ladder):
		return false
	return true
	
func move_state():
	if (is_above_ladder() and Input.is_action_just_pressed("down")):
		if (velocity.x <= 90 and velocity.x >= -90):
			velocity.x = 0
			position.y = position.y + 1
		state = climb
		sprite_2d.animation = "climb"

	if (is_on_ladder() and Input.get_axis("up", "down")):
		velocity.x = 0
		state = climb

	if (Input.is_action_just_pressed("jump") and is_on_floor()):
		velocity.y = JUMP_VELOCITY

	var direction = Input.get_axis("left", "right")
	if (is_on_floor()):
		if (direction):
			velocity.x = direction * SPEED
		else:
			velocity.x = move_toward(velocity.x, 0, 50)

func climb_state():
	if (not is_on_ladder()):
		state = move
	var direction = Input.get_axis("up", "down")
	velocity.y = direction * 80
	if (sprite_2d.animation != "climb"):
		sprite_2d.animation = "climb"
	if (is_on_floor()):
		state = move
