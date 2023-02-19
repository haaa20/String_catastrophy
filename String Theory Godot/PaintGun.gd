extends Node2D

enum {BLUE, PINK, YELLOW}

onready var timer = get_node("Timer")
onready var aoe = get_node("Area2D")
onready var emmiter = get_node("Particles2D")

var spray_colour = null


# Called when the node enters the scene tree for the first time.
func _ready():
	emmiter.emitting = false

func spray(colour):
	var hex_c = ""
	
	timer.start()
	emmiter.emitting = true
	
	match colour:
		BLUE:
			hex_c = Autoload.blue
		PINK:
			hex_c = Autoload.pink
		YELLOW:
			hex_c = Autoload.yellow
	
	emmiter.modulate = Color(hex_c)
	spray_colour = colour


func _on_Blue_pushed():
	spray(BLUE)


func _on_Pink_pushed():
	spray(PINK)


func _on_Yellow_pushed():
	spray(YELLOW)


func _on_Area2D_body_entered(body):
	if timer.time_left > 0 and body.is_in_group("Ball"):
		body.colour_ball(spray_colour)


func _on_Timer_timeout():
	emmiter.emitting = false
