extends Node

class_name PressButton

export(bool) var is_root_button: bool = false
enum buttonset {UP, DOWN, LEFT, RIGHT, A, B, C, D, E, F, G, H}
export(buttonset) var button_to_press
enum ButtonState {PRESSED, RELEASED, UNCHANGED = -1}
enum types {direction, face}
var type: int

func activate(buffer, sliced_buffer):
	var b: Array = []
	if type == types.direction:
		b = sliced_buffer
	else:
		b = buffer

	for i in range(0, b.size()):
		var check_frame = b[i]
		if check_frame[button_to_press] == ButtonState.PRESSED:
			print(str("Pressed " + str(button_to_press)))
			var c = get_children()
			for child in c:
				child.activate(buffer, buffer.slice(i + 1, buffer.size()))
