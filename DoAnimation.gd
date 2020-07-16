extends Node

onready var AnimPlayer = owner.get_node("../AnimationPlayer")


func activate(buffer, sliced_buffer):
	print("animate!")
	if AnimPlayer.get_current_animation() != "test_anim":
		AnimPlayer.play("test_anim")
	pass
 
