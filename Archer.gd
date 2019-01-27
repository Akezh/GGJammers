extends Area2D

var FireBall = preload('res://FireBall.tscn')
var tm = 0
var timerOfDistance = 0
onready var Global = get_node('/root/Global')

func push():
	var fireball = FireBall.instance();
	fireball.position = position + Vector2(-50, -10);
	get_node('../').add_child(fireball);
	fireball.apply_impulse(Vector2(), Vector2(-800,-50));
	
func _physics_process(delta):
	tm += delta
	if position.x - Global.playerPosition.x  <= 600:
		timerOfDistance+= delta
		if timerOfDistance >= 1:
			push()
			timerOfDistance = 0
	
	if global_position.x < $"../../".cameraX:
		queue_free()
	
	

func kill():
	queue_free()
	pass

	


func _on_Archer_area_entered(area):
	if area.has_method('kill'):
		area.call('kill')
	pass 
