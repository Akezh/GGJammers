extends Node


const G = 10
const SPEED = 400
var speedY = 0
var ground
var cameraX = 0
var screenW = 0
var timer = 0
var timerArc = 0
var Cell = preload("res://Cell.tscn")
var Archers = preload("res://Archer.tscn")


func _ready():
	$Boy/sprite.play('move')
	ground = $Boy.position.y
	screenW = get_viewport().get_visible_rect().size.x


func random(var x, var y):
	randomize()
	return rand_range(x, y)


func _physics_process(delta):
	cameraX = $Cam.global_position.x
	timer += delta
	timerArc += delta
	
	if timer > 2:
		var cell = Cell.instance()
		cell.scale /= 1.5
		var offsetX = random(450, 600)
		var posY = random(1, 5)
		if posY > 2: posY = ground
		else: posY = ground - 100
		cell.position.x = cameraX + screenW + offsetX
		cell.position.y = posY
		$Cells.add_child(cell)
		timer = 0
		
	if timerArc > 5:
		var archer = Archers.instance()
		var offsetX = random(450, 600)
		archer.position.x = cameraX + screenW + offsetX
		archer.position.y = ground + 20
		$Archers.add_child(archer)
		timerArc = 0
	
	$Cam.position.x += SPEED * delta
	$Boy.position.x += SPEED * delta

	if $Boy.position.y < ground:
		speedY += G
	else:
		speedY = 0
		if Input.is_action_just_pressed('ui_jump'):
			speedY = -300
	
	$Boy.position.y += speedY * delta