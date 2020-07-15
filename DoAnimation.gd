extends Node

onready var AnimPlayer = owner.get_node("../AnimationPlayer")


func activate():
	AnimPlayer.play("test_anim")
	pass
