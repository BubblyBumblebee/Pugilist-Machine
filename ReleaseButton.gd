extends Node

class_name ReleaseButton

export(bool) var is_root_button: bool = false
enum buttonset {UP, DOWN, LEFT, RIGHT, A, B, C, D, E, F, G, H}
export(buttonset) var button_to_release
enum ButtonState {PRESSED, RELEASED, UNCHANGED = -1}

func activate(buffer):
	# check buttons in each buffer frame.
	# pop_front() to get first item and check for button by index.
	# If you find something, stop and pass the remaining buffer on to the child.
	for i in buffer:
		var check_frame = buffer.pop_front()
		if check_frame[button_to_release] == ButtonState.RELEASED:
			print(str("Released " + str(button_to_release)))
			var c = get_children()
			for child in c:
				child.activate(buffer)
			
