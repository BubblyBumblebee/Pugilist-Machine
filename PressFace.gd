extends Node

class_name PressFace

export(bool) var is_root_button: bool = false
enum buttonset {UP= 0, DOWN = 1, LEFT = 2, RIGHT = 3, A = 4, B = 5, C = 6, D = 7, E = 8, F = 9, G = 10, H = 12}
export(buttonset) var button_to_press
enum ButtonState {PRESSED, RELEASED, UNCHANGED = -1}

func activate(buffer):
	# check buttons in each buffer frame.
	# pop_front() to get first item and check for button by index.
	# If you find something, stop and pass the remaining buffer on to the child.
	for i in range(0, buffer.size()):
		var check_frame = buffer[i]
		if check_frame[button_to_press] == ButtonState.PRESSED:
			print(str("pressed " + str(button_to_press)))
			var c = get_children()
			for child in c:
				child.activate(buffer.slice(i, buffer.size()))
