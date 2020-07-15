extends Node
export(int) var buffer_limit: int = 0
var buffer = []
func _physics_process(delta):
# Get data from InputTree. The PlayObject will give us its data.
	advance_input_buffer()
	pass

func advance_input_buffer():
	# Iterate through the input buffer and decrement the buffer time on each input.
	# When it reaches 0, destroy it.
	if buffer.size() != 0:
		for i in range(0, buffer.size()):
			buffer[i].buffer_time -= 1
			if buffer[i].buffer_time < 0:
				buffer.remove(i)
		pass
	pass


func _on_found_input():
	
	pass
