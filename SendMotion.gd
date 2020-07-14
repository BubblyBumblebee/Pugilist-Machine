extends Node
class_name input_sender

export(String) var message: String = ""

func _enter_tree():
	add_to_group("rollback")
	pass

func _physics_process(_delta):
	
	pass

func activate_all():
	print(message)

func deactivate_all():
	pass
