extends Resource
class_name PugButtonPress

export(bool) var in_sequence: bool =  true
enum type_set {PRESSED, RELEASED, HELD}
export var button: Array = ["pug_up", "pug_down", "pug_left", "pug_right", "pug_a", "pug_b", "pug_c", "pug_d", "pug_e", "pug_f", "pug_g", "pug_h"]
export(type_set) var type
export(int) var hold_time: int = 0
