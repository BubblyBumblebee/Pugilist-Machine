extends Node
class_name input_sender

export(String) var message: String = ""

func _enter_tree():
	pass

func activate():
	print(message)

func deactivate():
	pass
