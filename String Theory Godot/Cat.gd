extends KinematicBody2D

enum {WANDER, RETURN, POUNCE}

onready var timer = get_node("../Timer")
onready var teather = get_node("../Teather")

var move_dir = Vector2(1, 0)
var speed = 3
var state = WANDER
var collision


# Checks if the cat is within bounds
func in_bounds():
	var bound = get_node("../Bound")
	return (self in bound.get_overlapping_bodies())


# Called when the node enters the scene tree for the first time.
func _ready():
	timer.wait_time = 0.3
	timer.start()
	collision = move_and_collide(Vector2.ZERO)


func wander():
	if in_bounds():
		move_dir = move_dir.rotated(rand_range(-0.6, 0.4))
	else:
		move_dir = (teather.position - position).normalized()
	
	state = WANDER
	timer.start()


func pounce():
	state = POUNCE


func _on_Timer_timeout():
	if state == WANDER:
		wander()


func _physics_process(delta):
	var move = Vector2()
	
	match state:
		WANDER:
			move = move_dir * speed
		
		POUNCE:
			var dist = get_viewport().get_mouse_position() - position
			if dist.length() > 10:
				move_dir = dist.normalized()
				move = move_dir * speed * 4
			
			if collision:
				if collision.collider.is_in_group("Ball"):
					collision.collider.push(-collision.normal)
	
	collision = move_and_collide(move)
	
