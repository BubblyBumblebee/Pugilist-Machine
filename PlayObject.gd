extends Node2D

var controller_id: int = -1

enum ButtonState {PRESSED, RELEASED, UNCHANGED = -1}
enum Facing {LEFT, RIGHT}

onready var input_list: Array = []
onready var frame_buttons: InputFra = InputFra.new()

var game_frame = 0

onready var groundray = $GroundRay

var xvelocity: int = 5
func _enter_tree():
	# Place node in `Rollback` group.
	self.add_to_group("rollback")
	self.add_to_group("lock_to_int")


func _ready():
	# If parent is not root, set up test environment.
	if get_parent() != get_node("/root"):
		test_setup()
	else:
		integrated_setup()
	pass # Replace with function body.
	

func _input(event):
	# First check if controller matches the assigned id.
	if event.device == controller_id:
		if Input.is_action_just_pressed("fight_up"):
			frame_buttons.up = ButtonState.PRESSED
		elif Input.is_action_just_released("fight_up"):
			frame_buttons.up = ButtonState.RELEASED
		elif !Input.is_action_just_pressed("fight_up") && !Input.is_action_just_released("fight_up"):
			frame_buttons.up = ButtonState.UNCHANGED
		if Input.is_action_just_pressed("fight_down"):
			frame_buttons.down = ButtonState.PRESSED
		elif Input.is_action_just_released("fight_down"):
			frame_buttons.down = ButtonState.RELEASED
		elif !Input.is_action_just_pressed("fight_down") && !Input.is_action_just_released("fight_down"):
			frame_buttons.down = ButtonState.UNCHANGED
		if Input.is_action_just_pressed("fight_right"):
			frame_buttons.right = ButtonState.PRESSED
		elif Input.is_action_just_released("fight_right"):
			frame_buttons.right = ButtonState.RELEASED
		elif !Input.is_action_just_pressed("fight_right") && !Input.is_action_just_released("fight_right"):
			frame_buttons.right = ButtonState.UNCHANGED
		if Input.is_action_just_pressed("fight_left"):
			frame_buttons.left = ButtonState.PRESSED
		elif Input.is_action_just_released("fight_left"):
			frame_buttons.left = ButtonState.RELEASED
		elif !Input.is_action_just_pressed("fight_left") && !Input.is_action_just_released("fight_left"):
			frame_buttons.left = ButtonState.UNCHANGED
		if Input.is_action_just_pressed("fight_a"):
			frame_buttons.left = ButtonState.PRESSED
		elif Input.is_action_just_released("fight_a"):
			frame_buttons.left = ButtonState.RELEASED
		elif !Input.is_action_just_pressed("fight_a") && !Input.is_action_just_released("fight_a"):
			frame_buttons.left = ButtonState.UNCHANGED
		if Input.is_action_just_pressed("fight_b"):
			frame_buttons.left = ButtonState.PRESSED
		elif Input.is_action_just_released("fight_b"):
			frame_buttons.left = ButtonState.RELEASED
		elif !Input.is_action_just_pressed("fight_b") && !Input.is_action_just_released("fight_b"):
			frame_buttons.left = ButtonState.UNCHANGED
		if Input.is_action_just_pressed("fight_c"):
			frame_buttons.left = ButtonState.PRESSED
		elif Input.is_action_just_released("fight_c"):
			frame_buttons.left = ButtonState.RELEASED
		elif !Input.is_action_just_pressed("fight_c") && !Input.is_action_just_released("fight_c"):
			frame_buttons.left = ButtonState.UNCHANGED
		if Input.is_action_just_pressed("fight_d"):
			frame_buttons.left = ButtonState.PRESSED
		elif Input.is_action_just_released("fight_d"):
			frame_buttons.left = ButtonState.RELEASED
		elif !Input.is_action_just_pressed("fight_d") && !Input.is_action_just_released("fight_d"):
			frame_buttons.left = ButtonState.UNCHANGED
		if Input.is_action_just_pressed("fight_e"):
			frame_buttons.left = ButtonState.PRESSED
		elif Input.is_action_just_released("fight_e"):
			frame_buttons.left = ButtonState.RELEASED
		elif !Input.is_action_just_pressed("fight_e") && !Input.is_action_just_released("fight_e"):
			frame_buttons.left = ButtonState.UNCHANGED
		if Input.is_action_just_pressed("fight_f"):
			frame_buttons.left = ButtonState.PRESSED
		elif Input.is_action_just_released("fight_f"):
			frame_buttons.left = ButtonState.RELEASED
		elif !Input.is_action_just_pressed("fight_f") && !Input.is_action_just_released("fight_f"):
			frame_buttons.left = ButtonState.UNCHANGED
		if Input.is_action_just_pressed("fight_g"):
			frame_buttons.left = ButtonState.PRESSED
		elif Input.is_action_just_released("fight_g"):
			frame_buttons.left = ButtonState.RELEASED
		elif !Input.is_action_just_pressed("fight_g") && !Input.is_action_just_released("fight_g"):
			frame_buttons.left = ButtonState.UNCHANGED
		if Input.is_action_just_pressed("fight_h"):
			frame_buttons.left = ButtonState.PRESSED
		elif Input.is_action_just_released("fight_h"):
			frame_buttons.left = ButtonState.RELEASED
		elif !Input.is_action_just_pressed("fight_h") && !Input.is_action_just_released("fight_h"):
			frame_buttons.left = ButtonState.UNCHANGED
		

func _physics_process(_delta):
	game_frame += 1
	
	frame_buttons.frame = game_frame
	# Place inputs into their place in the input_list.
	input_list.append(frame_buttons)	
	# Clear input frame after we're done with it.
	frame_buttons = InputFra.new()
	
	# Process collisions.
	
	# For now, just check if the ground ray has touched the ground. If so, stop moving downward.
	if (groundray.cast_to.y + self.position.y) > 400:
		xvelocity = 0
	# If the end of the ground ray has penetrated the floor, go back up to just above the floor.
		self.position.y -= self.position.y - 400 + groundray.cast_to.y

	# Each frame, move downward by some amount of pixels.
	self.position = self.position + Vector2(0, xvelocity)

	# Trigger move parser.


func test_setup():
	controller_id = 0

func integrated_setup():
	controller_id = 0
