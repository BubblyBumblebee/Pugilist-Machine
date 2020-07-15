extends Node


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
onready var children = get_children()
onready var input_tree = get_owner()
export(String) var value_to_check: String = ""

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func activate(buffer):
	var state = input_tree.state 
	if state[value_to_check]:
		for c in children:
			c.activate(buffer)

