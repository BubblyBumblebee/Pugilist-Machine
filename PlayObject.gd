extends Node2D

enum player {PLAYER_ONE, PLAYER_TWO}
export(player) var side
var controller_id: int = -1

enum ButtonState {PRESSED, RELEASED, HELD, UNHELD = -1}
enum FacingSet {LEFT, RIGHT}
var facing: int

var input_frame: Array

onready var input_list: Array = []
onready var frame_buttons: InputFra = InputFra.new()

var game_frame = 0

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
	if event.device == controller_id:
		input_frame.append(event)
	pass

func _physics_process(_delta):

	game_frame += 1
	
	input_frame.push_front(game_frame)
	# Place inputs into their place in the input_list.
	input_list.append(input_frame)
	# Clear input frame after we're done with it.
	input_frame = []
	
	# Process collisions.
func _on_FightBox_area_entered(area):
	print(area.owner.name)
	pass

func test_setup():
	controller_id = 0
	facing = FacingSet.RIGHT

func integrated_setup():
	controller_id = 0
