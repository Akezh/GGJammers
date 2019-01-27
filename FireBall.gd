extends RigidBody2D


onready var Sprite = get_node("blast02_orange")
var tm = 0
var tmSprite = 0


func _physics_process(delta):
	tm += delta
	if tm > 1:
		tm = 0;
		queue_free();

	tmSprite += delta
	if tmSprite >= 0.15:
		Sprite.frame+=1
		tmSprite = 0

	pass


func _on_FireBall_body_entered(body):
	queue_free()
	if(body.has_method('kill')):
		tm = 1
		body.call('kill')

	pass

