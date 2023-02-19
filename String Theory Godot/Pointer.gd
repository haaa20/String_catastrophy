extends Node2D

enum {ON, OFF}
var state

signal turned_on ()
signal turned_off


# Called when the node enters the scene tree for the first time.
func _ready():
	state = OFF


func turn_off():
	state = OFF
	visible = false
	emit_signal("turned_off")


func turn_on():
	state = ON
	position = get_viewport().get_mouse_position()
	visible = true
	emit_signal("turned_on")


func _process(delta):
	match state:
		ON:
			position = get_viewport().get_mouse_position()
			if Input.is_action_just_released("ui_click"):
				turn_off()
		
		OFF:
			if Input.is_action_just_pressed("ui_click"):
				turn_on()
	
	
