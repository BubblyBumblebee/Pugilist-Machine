extends Node

class_name ReleaseButton

export(bool) var is_root_button: bool = false
export(String) var button_to_release: String = ""
export(int) var frame_timer_limit: int = 0
var frame_timer: int = 0

func _enter_tree():
	add_to_group("rollback")
	if is_root_button == false:
		set_process_input(false)
		set_physics_process(false)

func _input(event):
	if Input.is_action_just_released(button_to_release):
		for i in get_children():
			i.activate()
		set_process_input(false)
		set_physics_process(true)
		print(str(button_to_release + " released"))

func _physics_process(_delta):
	if frame_timer < frame_timer_limit:
		frame_timer += 1
	else:
		frame_timer = 0
		for i in get_children():
			i.deactivate()
		if is_root_button:
			set_process_input(true)
			set_physics_process(false)


func deactivate():
	set_physics_process(false)
	set_process_input(false)
	
func activate():
	set_physics_process(true)
	set_process_input(true)
