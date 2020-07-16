extends Node

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
onready var player: Node = get_parent()
onready var children: Array = get_children()
var state = {"standing": true, "awake": true, "jumping": false, "hit": false}


# Called when the node enters the scene tree for the first time.
func _physics_process(delta):
	var input_list_slice: Array = player.input_list.slice(player.input_list.size() - 15, player.input_list.size(), true)
	var buffer: Array = []
	var sliced_buffer: Array = []
	
	
	for i in input_list_slice:
		var frame_in: Array = []
		frame_in.append(i.up)
		frame_in.append(i.down)
		frame_in.append(i.left)
		frame_in.append(i.right)
		frame_in.append(i.a)
		frame_in.append(i.b)
		frame_in.append(i.c)
		frame_in.append(i.d)
		frame_in.append(i.e)
		frame_in.append(i.f)
		frame_in.append(i.g)
		frame_in.append(i.h)
		buffer.append(frame_in)
		sliced_buffer.append(frame_in)
		
	for c in children:
		c.activate(buffer, sliced_buffer)
	pass
