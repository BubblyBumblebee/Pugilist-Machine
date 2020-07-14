extends Node2D

var controller_id: int = -1

enum ButtonState {PRESSED, RELEASED, UNCHANGED = -1}

onready var input_list: Array = []
onready var frame_buttons_dir: InputFrameDirection = InputFrameDirection.new()
onready var frame_buttons_face: InputFrameFace = InputFrameFace.new()
var frame_buttons = []

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
			frame_buttons_dir.up = ButtonState.PRESSED
		elif Input.is_action_just_pressed("fight_down"):
			frame_buttons_dir.down = ButtonState.PRESSED
		elif Input.is_action_just_pressed("fight_right"):
			frame_buttons_dir.right = ButtonState.PRESSED
		elif Input.is_action_just_pressed("fight_left"):
			frame_buttons_dir.left = ButtonState.PRESSED

func _physics_process(_delta):
	
	# Place inputs into their place in the input_list.
	input_list.append(frame_buttons_dir)	
	input_list.append(frame_buttons_face)
	# Clear input frame after we're done with it.
	frame_buttons = InputFrameDirection.new()
	
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
