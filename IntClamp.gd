extends Node

# Setup tests.
func _enter_tree():
	if self.get_parent() == get_node("/root"):	
		var n = Node2D.new()
		n.add_to_group("rollback")
		add_child(n)
	pass

func _physics_process(delta):
	
	# Get nodes in group, 'lockdown', and iterate over them.
	var int_nodes = get_tree().get_nodes_in_group("lock_to_int")
	for i in int_nodes:

	# For each variable we want to clamp (`position`, `extents.x`, `extents.y`) test if it's present and run it through the
	# helper function `int_clamp(node, variable, value)`.
		if i.get("position") != null:
			int_clamp(i.position.x)
			int_clamp(i.position.y)
		if i.get("extents") != null:
			int_clamp(i.extents.x)
			int_clamp(i.extents.y)

func int_clamp(variable):
	variable = int(floor(variable))
