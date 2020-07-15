extends Node

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
onready var player = get_parent()

# Called when the node enters the scene tree for the first time.
func _physics_process(delta):
	var buffer = player.input_list.slice(player.input_list.size() - 10, player.input_list.size())
	
	# Pass buffer to children.
	
	pass

