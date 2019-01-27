extends RigidBody2D

func kill():
	get_node('../Archer').queue_free()
	print('delete')
	pass
