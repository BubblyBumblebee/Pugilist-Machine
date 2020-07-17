extends Area2D
enum type {hurtbox, hitbox, throwbox, blockbox}
export(type) var box_type: int = type.hurtbox

# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func get_box_type() -> int:
	return box_type
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
