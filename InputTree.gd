extends Node

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
onready var player: Node = get_parent()
onready var children: Array = get_children()
var state = {"standing": true, "awake": true, "jumping": false, "hit": false}


# Called when the node enters the scene tree for the first time.
func _physics_process(delta):
	var input_list_slice = player.input_list.slice(player.input_list.size() - 25, player.input_list.size())
	
	var buffer = []
	
	
	for i in input_list_slice:
		var frame = []
		frame.append(i.up)
		frame.append(i.down)
		frame.append(i.left)
		frame.append(i.right)
		frame.append(i.a)
		frame.append(i.b)
		frame.append(i.c)
		frame.append(i.d)
		frame.append(i.e)
		frame.append(i.f)
		frame.append(i.g)
		frame.append(i.h)
		buffer.append(frame)
	for c in children:
		c.activate(buffer)
	pass

