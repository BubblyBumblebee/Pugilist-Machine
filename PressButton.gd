extends Node

class_name PressButton

export(bool) var is_root_button: bool = false
export(String) var button_to_press: String = ""
export(int) var frame_timer_limit: int = 0
var frame_timer: int = 0

func _enter_tree():
	add_to_group("rollback")
	if is_root_button == false:
		set_process_input(false)
		set_physics_process(false)
	elif is_root_button == true:
		set_process_input(true)
		set_physics_process(true)
		

func _input(event):
	if Input.is_action_just_pressed(button_to_press):
		set_process_input(false)
		print(button_to_press)
		for i in get_children():
			i.activate_all()

func _physics_process(_delta):
	if frame_timer < frame_timer_limit:
		frame_timer += 1
	else:
		frame_timer = 0
		if is_root_button:
			set_process_input(true)
		for i in get_children():
			i.deactivate_all()


func deactivate_all():
	set_physics_process(false)
	set_process_input(false)
	for i in get_children():
		i.deactivate_all()
	
func activate_all():
	set_physics_process(true)
	set_process_input(true)


