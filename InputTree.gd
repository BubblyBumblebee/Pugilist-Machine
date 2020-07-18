extends Node

export(Resource) var movelist: Resource = null
onready var player: Node = get_parent()
onready var AnimPlayer: Node = get_node("../AnimationPlayer")
var blackboard = {"standing": true, "awake": true, "jumping": false, "hit": false}
var buffer: Array = []
var sliced_buffer = []


func _physics_process(delta):
	get_buffer()
	get_sliced_buffer()
	get_blackboard()
	process_tree()
	pass

func get_buffer() -> void:
	# Here we slice off the last several frames of the input list to put in the buffer.
	# Let's set an int variable later to easily change how many. 
	buffer = player.input_list.slice(player.input_list.size() - 120, player.input_list.size(), true)

func get_sliced_buffer() -> void:
	sliced_buffer = buffer.duplicate()

func get_blackboard() -> Dictionary:
	# Let's get the blackboard from the parent once we're ready for more complex
	# interactions. For now, just return this array.
	return blackboard

func process_tree() -> void:
	for move in movelist.moves:
		# For now, let's just validate a couple button sequences.
		# Then we can try validating some blackboard data.
		
		# VALIDATORS
		# Get validator size and iterate through validators.
		# Check validator's type, AND or OR.
		# In the AND loop, return false as soon as any element fails. Return true
		# only if all elements return true.
		# In the OR loop, return true as soon as any check succeeds. Return
		# false only if all fail.
		# Check number of validators against number of successes. If all AND &
		# OR validators return true, play the animation.
		var val_outcomes: Array = []
		for validator in move.validators:
			
			if validator.validator_type == validator.type_set.AND:
				# Do AND validation.
				for element in validator.elements:
					# Check element's class and pick the appropriate route.
					# Share routes between AND & OR. The only difference is
					# what they do with the results.
					if element.get_class() == "PugButtonSequence":
						val_outcomes.append(validate_button_sequence(element))
						

			elif validator.validator_type == validator.type_set.OR:
				# Do OR validation.
				for element in validator.elements:
					# Check element's class and pick the appropriate route.
					# Share routes between AND & OR. The only difference is
					# what they do with the results.
					val_outcomes.append(false)
					if element.get_class() == "PugButtonSequence":
						if validate_button_sequence(element):
							val_outcomes[-1] = true
							break
		# Play the animation's move if all the validators were succesful.
		if !val_outcomes.has(false):
			AnimPlayer.play(move.move_to_play)
			break

# HELPER FUNCTIONS

# BUTTON SEQUENCE
# For each button sequence, get the player's input buffer.
# Each button sequence should get a new copy of the `buffer` and
# `sliced_buffer` before validating.
# Slice them to match the button sequence's frame limit.
# Check the action on each button press on a frame. Then move on to the next frame.
# When we get `true` from a button, move on to the next in sequence.
# If we get reach the end, return `false`.
# If we get all the buttons in the sequence, return true.

func validate_button_sequence(element) -> bool:
	var v_buffer: Array = buffer.duplicate(true).slice(-element.frame_limit, buffer.size(), true)
	var v_sliced_buffer: Array = sliced_buffer.slice(-element.frame_limit, sliced_buffer.size(), true)
	for button in element:
		if validate_button(button, v_buffer, v_sliced_buffer) == true:
			return true
		else:
			return false

# BUTTON PRESS OR RELEASE
# Select which buffer to check, `buffer` or `sliced buffer`.
# For each frame of the buffer, go through the input events. When we find
# a match for the button on the sliced buffer, we slice the remaining frames into a
# new variable and use that to validate the next button in sequence.
# When we find a match for the regular buffer, don't do any slicing.
# If we do not find a match, just return false.

func validate_button(button, v_buffer, v_sliced_buffer) -> bool:
	var result: bool = false
	if button.type == button.type_set.PRESSED:
		if button.in_sequence:
			for frame in range(0, v_sliced_buffer.size()):
				for press in v_sliced_buffer[frame]:
					if press.is_action_just_pressed(button.button):
						v_sliced_buffer = v_sliced_buffer.slice(frame, v_sliced_buffer.size())
						return true
		else:
			for frame in range(0, v_buffer.size()):
				for press in v_sliced_buffer[frame]:
					if press.is_action_just_pressed(button.button):
						return true
	elif button.type == button.type_set.RELEASED:
		if button.in_sequence:
			for frame in range(0, v_sliced_buffer.size()):
				for press in v_sliced_buffer[frame]:
					if press.is_action_just_released(button.button):
						v_sliced_buffer = v_sliced_buffer.slice(frame, v_sliced_buffer.size())
						return true
		else:
			for frame in range(0, v_buffer.size()):
				for press in v_buffer[frame]:
					if press.is_action_just_released(button.button):
						return false
	# BUTTON HELD
	# Get the minimum frame count to hold the button. When we find the button
	# press or hold, start walking through frame by frame. If we count the
	# held frames up to the minimum frame count, return true. Else return false.
	elif button.type == button.type_set.HELD:
		var count: int = 0
		for frame in range(0, v_buffer.size()):
			for press in v_buffer[frame]:
				if press.is_action_pressed:
					count += 1
					break
				elif count > 0 && press.is_action_released():
					return false
		if count >= button.hold_time:
			result = true
		else:
			result = false
	return result
