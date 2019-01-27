extends Area2D


func _ready():
	set_meta('cell', 1)


func _physics_process(delta):
	if global_position.x < $"../../".cameraX:
		queue_free()
