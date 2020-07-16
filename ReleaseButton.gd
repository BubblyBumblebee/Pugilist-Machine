extends Node

class_name ReleaseButton

export(bool) var is_root_button: bool = false
enum buttonset {UP, DOWN, LEFT, RIGHT, A, B, C, D, E, F, G, H}
export(buttonset) var button_to_release
enum ButtonState {PRESSED = 0, RELEASED = 1, UNCHANGED = -1}
enum types {direction, face}
var type

func _ready():
	if button_to_release in [0, 1, 2, 3]:
		type = types.direction
	else:
		type = types.face
	pass

func activate(buffer, sliced_buffer):
	var b: Array = []
	if type == types.direction:
		b = sliced_buffer
	else:
		b = buffer
	# check buttons in each buffer frame.
	# pop_front() to get first item and check for button by index.
	# If you find something, stop and pass the remaining buffer on to the child.
	for i in range(0, b.size()):
		var check_frame = b[i]
		if check_frame[button_to_release] == ButtonState.RELEASED:
			print(str("Released " + str(button_to_release)))
			var c = get_children()
			for child in c:
				child.activate(buffer, buffer.slice(i + 1, buffer.size()))
