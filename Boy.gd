extends Area2D


onready var Global = get_node('/root/Global')
onready var Sprite = get_node('arc')
const SPEED = 200
const GRAVITY = 800
var tm = 0
var velocity = Vector2()
var Shield = preload('res://Shield.tscn')
var FireBall = preload('res://FireBall.tscn')


func push():
  var counter = get_node('../GUI/Fire2').get_value()
  if counter > 0:
  	var fireball = FireBall.instance()
  	$Blust.play()
  	fireball.position = position + Vector2(300, +240)
  	get_node('../').add_child(fireball)
  	fireball.apply_impulse(Vector2(), Vector2(800,-50))
  	get_node('../GUI/Fire2').set_value(counter - 1)


func _physics_process(delta):
  if Input.is_action_just_pressed('ui_up'):
    push()
  elif Input.is_action_pressed('ui_down'):
    var shield = Shield.instance()
    $WaterShield.play()
    shield.position = position + Vector2(250, 250);
    get_node('../').add_child(shield)
  Global.playerPosition = Vector2(position);


func _on_Boy_area_entered(area):
	if area.has_meta('cell'):
		var counter = get_node('../GUI/Fire2').get_value()
		get_node('../GUI/Fire2').set_value(counter+1)
		area.queue_free()
		$Fire.play()
		
		
func kill():
	queue_free();
	get_tree().quit()