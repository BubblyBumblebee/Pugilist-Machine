extends Object
class_name InputFra

var frame: int
enum ButtonState {PRESSED, RELEASED, UNCHANGED = -1}
var up: int = ButtonState.UNCHANGED
var down: int = ButtonState.UNCHANGED
var left: int = ButtonState.UNCHANGED
var right: int = ButtonState.UNCHANGED
var a: int = ButtonState.UNCHANGED
var b: int = ButtonState.UNCHANGED
var c: int = ButtonState.UNCHANGED
var d: int = ButtonState.UNCHANGED
var e: int = ButtonState.UNCHANGED
var f: int = ButtonState.UNCHANGED
var g: int = ButtonState.UNCHANGED
var h: int = ButtonState.UNCHANGED

func _get_property_list():
	return [{"name": "frame", "type": 2}, {"name": "up", "type": 2}, {"name": "down", "type": 2}, {"name": "left", "type": 2}, {"name": "right", "type": 2}, {"name": "a", "type": 2}, {"name": "b", "type": 2}, {"name": "c", "type": 2}, {"name": "d", "type": 2}, {"name": "e", "type": 2}, {"name": "f", "type": 2}, {"name": "g", "type": 2}, {"name": "h", "type": 2}]
	pass
