extends Node

class_name HoldButton

export(int) var buffer_length: int = 0
enum buttonset {UP, DOWN, LEFT, RIGHT, A, B, C, D, E, F, G, H}
export(buttonset) var button_to_press
enum ButtonState {PRESSED, RELEASED, UNCHANGED = -1}
enum types {direction, face}
export(types) var type: int


func activate(buffer, sliced_buffer):
	var b: Array = []
	if type == types.direction:
		b = sliced_buffer
	else:
		b = buffer
		
	if buffer_length > 0:
		for i in range(b.size() - buffer_length, b.size()):
			var check_frame = b[i]
			if check_frame[button_to_press] == ButtonState.PRESSED:
				var c = get_children()
				for child in c:
					child.activate(buffer, buffer.slice(i + 1, buffer.size()))
	else:
		for i in range(0, b.size()):
			var check_frame = b[i]
			if check_frame[button_to_press] == ButtonState.PRESSED:
				var c = get_children()
				for child in c:
					child.activate(buffer, buffer.slice(i + 1, buffer.size()))
