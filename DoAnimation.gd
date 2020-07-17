extends Node

class_name AnimationSender

export(String) var animation_name: String = ""
onready var AnimPlayer = owner.get_node("../AnimationPlayer")


func activate(buffer, sliced_buffer):
	if AnimPlayer.get_current_animation() != animation_name:
		AnimPlayer.play(animation_name)
	pass
 
