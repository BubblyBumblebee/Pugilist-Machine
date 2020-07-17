extends Node

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
onready var movelist = preload("pug_test_resources/pug_test_tree.tres")
onready var player: Node = get_parent()
onready var children: Array = get_children()
var blackboard = {"standing": true, "awake": true, "jumping": false, "hit": false}
var buffer: Array = []
var sliced_buffer = []


func _physics_process(delta):
	get_buffer()
	get_sliced_buffer()
	get_blackboard()
	process_tree()
	pass

func get_buffer() -> Array:
	# Here we slice off the last several frames of the input list to put in the buffer.
	# Let's set an int variable later to easily change how many. 
	buffer = player.input_list.slice(player.input_list.size() - 10, player.input_list.size(), true)
	return buffer

func get_sliced_buffer():
	# Building the array from scratch ensures that it's not just referencing the earlier one.
	for frame in buffer:
		sliced_buffer.append(frame)

func get_blackboard() -> Dictionary:
	return blackboard

func process_tree() -> void:
	for i in movelist:
		# For now, let's just validate a couple button sequences.
		# Then we can try validating some blackboard data.
		# VALIDATORS
		# Get validator size and iterate through validators.
		# Check validator's type, AND or OR.
		# In the AND loop, return false as soon as any element fails. Return true
		# if all elements return true.
		# In the OR loop, return true as soon as any check succeeds. Return
		# false if all return false.
		# If all AND & OR validators return true, play the animation.

		# BUTTON SEQUENCE
		# For each button sequence, get the player's input buffer.
		# Each button sequence should get a new copy of the `buffer` and
		# `sliced_buffer` before validating.
		# Slice it to match the button sequence's frame limit.
		# Check the action on each button press on a frame. Then move on to the next frame.
		# When we get `true` from a button, move on to the next in sequence.
		# If we get `false`, return from the loop.

		# BUTTON PRESS OR RELEASE
		# Select which buffer to check, `buffer` or `sliced buffer`.
		# For each frame of the buffer, go through the input events. When we find
		# a match for the button on the sliced buffer, we slice the remaining frames into a
		# new variable and use that to validate the next button in sequence.
		# When we find a match for the regular buffer, don't do any slicing.
		# If we do not find a match, just return false.

		# BUTTON HELD
		# Get the minimum frame count to hold the button. When we find the button
		# press or hold, start walking through frame by frame. If the hold is
		# If we count the held frames up to the minimum frame count, return true.
		# Else return false.
		pass
	pass
